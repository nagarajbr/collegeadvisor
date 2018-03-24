class InvitationsController < Devise::InvitationsController
 #after_action :update_user_account, :only => [:create]

  def create
    #params[:user][:name] = params[:user][:first_name] + ' ' + params[:user][:last_name]
    #super
     User.invite!(:email =>   params[:user][:email] , :name => params[:user][:first_name] + ' ' + params[:user][:last_name] )
    User.where(email: params[:user][:email]).update_all(:company_id => current_user.company_id , :role => 0 , :last_name => params[:user][:last_name] ,:first_name => params[:user][:first_name])
    @client = Client.where("upper(ltrim(last_name)) = ? and upper(ltrim(first_name)) = ?",(params[:user][:last_name]).strip.upcase,(params[:user][:first_name]).strip.upcase)  
    if @client.present?
    else
      @client = Client.new
      @client.last_name = (params[:user][:last_name]).strip
      @client.first_name = (params[:user][:first_name]).strip
      @client.created_by = User.where(email: params[:user][:email]).first.id
      @client.updated_by = User.where(email: params[:user][:email]).first.id
      @client.save
    end
    redirect_to users_path
   end

  def edit
   super
  end

   def update
       super
   end

  # def update_user_account
  # 	  @user = User.find_by_email(params[:user][:email])
  #     @user.update_attributes(:company_id => current_user.company_id , :role => 1 )
  # end
end

private
# add :name to strong params
def update_resource_params
   params.require(:devise_model).permit(:email, :password,:password_confirmation, :invitation_token)
end

# def accept_resource
#     super
#     rails.logger.debug("-----#{resource}")
# end