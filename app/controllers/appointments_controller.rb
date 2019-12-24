class AppointmentsController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_patient 

  def index
    redirect_to :controller => "home", :action => "index"
  end

  def show
    @appt = @patient.appointments.find(params[:id])
    puts "HEY APPT"
    puts @appt.id

  # when the user is trying to look for un booked appt
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "home", :action => "index"
    return
  

  end

  def new
    # I need to specify the patient
    # the patient is @patient which is also current_patient, brought the variable from patient controller
    #@appt = @patient.appointments.new # just to create an empty record for the current patient
    @appt = @patient.appointments.new
  end

  def create
    #Appointment.create(appt_params) # dealing with the model Appointment to create a new appt for the current patient with his id after permitting it in the below private method
    @patient.appointments.create(appt_params)
    redirect_to home_path
  end

  def edit
    #@patient = Patient.find(params[:patient_id])
    #@appt = Appointment.find(params[:id]) # the appt the patient clicked on to edit to display it in the edit form
    @appt = @patient.appointments.find(params[:id])
    puts "HEY I CLICKED ON EDIT"
    puts @appt.clinic
  end

  def update
    #@appt = Appointment.find(params[:id])  # the appt the patient is perfoming an update method on, took the id of the appt from the url
    @appt = @patient.appointments.find(params[:id])
    puts "HEY AM TRYING TO UPDATE"
    @appt.update(appt_params)
    redirect_to home_path
  end


  def destroy
    #@cp = Patient.find(params[:patient_id])
    #Appointment.find(params[:id]).destroy
    @patient.appointments.find(params[:id]).destroy
    redirect_to home_path

    #puts @cp.name
    #puts @cp_apt.clinic
  end

  private 
  def appt_params
    params.require(:appointment).permit(:patient_id, :clinic, :date, :time)
  end

  def set_patient
    @patient = current_patient
  end

end
