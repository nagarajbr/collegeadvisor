class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @master_domain_items = MasterDomainItem.where("master_domain_id in (2,3,4,5,6,7,8)")
     @education  = Education.new

  end

  # GET /educations/1/edit
  def edit
      @master_domain_items = MasterDomainItem.where("master_domain_id in (2,3,4,5,6,7,8)")
  end

  # POST /educations
  # POST /educations.json
  def create
    @master_domain_items = MasterDomainItem.where("master_domain_id in (2,3,4,5,6,7,8)")
    @education = Education.new(education_params)
    @education.client_id = session[:student]
    @education.created_by = current_user.id
    @education.updated_by = current_user.id
    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    @education.updated_by = current_user.id
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_course
    @master_domain_items = MasterDomainItem.where(master_domain_id: params[:domain_id])
    
     respond_to do |format|
      format.js
    end
       
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      if params[:id].present?
      @education = Education.find(params[:id])
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:school_name, :attendance_type, :effective_beg_date, :effective_end_date, :major_study, :high_grade_level, :expected_grad_date, :degree_obtained, :created_by, :updated_by , education_details_attributes: EducationDetail.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
