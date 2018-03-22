class InvitationsController < Devise::InvitationsController
 #after_action :update_user_account, :only => [:create]

  def create
    super
    User.where(email: params[:user][:email]).update_all(:company_id => current_user.company_id , :role => 0 , :last_name => params[:user][:last_name] ,:first_name => params[:user][:first_name])
    @client = Client.where("upper(ltrim(last_name)) = ? and upper(ltrim(first_name)) = ?",(params[:user][:last_name]).strip.upcase,(params[:user][:first_name]).strip.upcase)  
    if @client.present?
    else
      @client = Client.new
      @client.last_name = (params[:user][:last_name]).strip
      @client.first_name = (params[:user][:first_name]).strip
      @client.created_by = 1 #User.where(email: params[:user][:email]).first.id
      @client.updated_by = 1 #User.where(email: params[:user][:email]).first.id
      @client.save
    end
  

       
        # @from    = params[:from]
        # @subject = params[:invite_subject]
        # @content = params[:invite_content]
        
        # @user = User.invite!(params[:user], current_user) do |u|
        #   u.skip_invitation = true
        # end


        # NotificationMailer.invite_message(@user, @from, @subject, @content).deliver if @user.errors.empty?
        # @user.invitation_sent_at = Time.now.utc # mark invitation as delivered

        # if @user.errors.empty?
        #   flash[:notice] = "successfully sent invite to #{@user.email}"
        #   respond_with @user, :location => root_path
        # else
        #   render :new
        # end

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