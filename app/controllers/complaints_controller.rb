class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    # debugger
    @complaint = Complaint.new(complaint_params)
    hash = {"Plumber"=>1, "Electrician"=>2, "Carpenter"=>3, "English" => 1, "Hindi" =>2 , "Telugu"=>3, "Hyderabad"=>1, "Bangalore"=>2, "Mumbai"=>3}
    # byebug
    @complaint.technician= hash[complaint_params["technician"]]
    @complaint.city= hash[complaint_params["city"]]
    @complaint.language= hash[complaint_params["language"]]
    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      # def if_admin
      #   user_signed_in? && current_user.admin?
      # end
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:technician, :summary, :landmark, :area, :city, :time, :pincode, :date, :language)
    end
end
