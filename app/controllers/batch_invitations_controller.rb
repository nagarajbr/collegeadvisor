require 'csv'

class BatchInvitationsController < ApplicationController
 
  before_action :authenticate_user!

 
  def new
    @batch_invitation = BatchInvitation.new()
    
  end

  def create
   
    unless file_uploaded?
      flash[:alert] = "You must upload a file"
      render :new
      return
    end

    begin
      csv = CSV.parse(params[:batch_invitation][:user_names_and_emails].read, headers: true)
    rescue CSV::MalformedCSVError => e
      flash[:alert] = "Couldn't understand that file: #{e.message}"
      render :new
      return
    end
    if csv.size < 1 # headers: true means .size is the number of data rows
      flash[:alert] = "CSV had no rows."
      render :new
      return
    elsif %w(First_name Last_name Email).any? { |required_header| csv.headers.exclude?(required_header) }
      flash[:alert] = "CSV must have headers including 'First_name' ,'Last_name' and 'Email'"
      render :new
      return
    end

    
    csv.each do |row|
      
      User.invite!(:email =>  row["Email"] , :name => row["First_name"] +' ' + row["Last_name"] )
      User.where(email: row["Email"]).update_all(:company_id => current_user.company_id , :role => 0 , :last_name => row["Last_name"] ,:first_name => row["First_name"])
    @client = Client.where("upper(ltrim(last_name)) = ? and upper(ltrim(first_name)) = ?",(row["Last_name"]).strip.upcase,(row["First_name"]).strip.upcase)  
    if @client.present?
    else
      @client = Client.new
      @client.last_name = (row["Last_name"]).strip
      @client.first_name = (row["First_name"]).strip
      @client.created_by = User.where(email: row["Email"]).first.id
      @client.updated_by = User.where(email: row["Email"]).first.id
      @client.save
      
    end
   end
    flash[:notice] = "Users created"
    redirect_to users_path
  end

  def show
    @batch_invitation = BatchInvitation.find(params[:id])
 
  end

  private

  def recent_batch_invitations
    @_recent_batch_invitations ||= BatchInvitation.where("created_at > '#{3.days.ago}'").order("created_at desc")
  end

  def file_uploaded?
    if params[:batch_invitation].nil? || params[:batch_invitation][:user_names_and_emails].nil?
      false
    elsif ! params[:batch_invitation][:user_names_and_emails].respond_to?(:read)
      # IO objects should respond to `read`
      false
    else
      true
    end
  end

  def grant_default_permissions(batch_invitation)
    SupportedPermission.default.each do |default_permission|
      batch_invitation.supported_permissions << default_permission
    end
  end
end
