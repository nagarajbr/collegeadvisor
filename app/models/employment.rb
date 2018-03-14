class Employment < ApplicationRecord
 enum position_type:  {Full_Time: 0, Permanent_Time: 1 , Permanent: 2}
 enum employment_status:  {Subsidized: 0 , Unsubsidised: 1 , Self_employment: 2, Under_employed: 3}
 enum frequency:  {Monthly: 0 , Bi_Weekly: 1 , Hourly: 2, Annually: 3}
 include AuditModule
   before_create :set_create_user_fields
   before_update :set_update_user_field


    def set_create_user_fields
        user_id = AuditModule.get_current_user.id

        self.created_by = user_id
        self.updated_by = user_id
    end

    def set_update_user_field
        user_id = AuditModule.get_current_user.id
        self.updated_by = user_id
    end

end
