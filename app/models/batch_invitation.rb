class BatchInvitation 
include ActiveModel::Model
  

  
  attr_accessor :user_names_and_emails

  
  #alidates :user_id, presence: true



  def all_successful?
    batch_invitation_users.failed.count == 0
  end

  def enqueue
    NoisyBatchInvitation.make_noise(self).deliver_later
    BatchInvitationJob.perform_later(self.id)
  end

  # def perform(options = {})
  #   self.batch_invitation_users.unprocessed.each do |bi_user|
  #     bi_user.invite(user, supported_permission_ids)
  #   end
  #   self.outcome = "success"
  #   self.save!
  # rescue StandardError => e
  #   self.update_column(:outcome, "fail")
  #   raise
  #nd
end
