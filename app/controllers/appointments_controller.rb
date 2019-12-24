class AppointmentsController < ApplicationController
  
  def index
  end

  def new
    # I need to specify the patient
    # the patient is @patient which is also current_patient, brought the variable from patient controller
    #@appt = @patient.appointments.new # just to create an empty record for the current patient
    @appt = Appointment.new
  end

  def create
    Appointment.create(appt_params) # dealing with the model Appointment to create a new appt for the current patient with his id after permitting it in the below private method
    redirect_to home_path
  end

  def edit
    #@patient = Patient.find(params[:patient_id])
    @appt = Appointment.find(params[:id]) # the appt the patient clicked on to edit to display it in the edit form
    puts "HEY I CLICKED ON EDIT"
    puts @appt.clinic
  end

  def update
    @appt = Appointment.find(params[:id])  # the appt the patient is perfoming an update method on, took the id of the appt from the url
    puts "HEY AM TRYING TO UPDATE"
    @appt.update(appt_params)
    redirect_to home_path
  end


  def destroy
    #@cp = Patient.find(params[:patient_id])
    Appointment.find(params[:id]).destroy
    redirect_to home_path

    #puts @cp.name
    #puts @cp_apt.clinic
  end

  private def appt_params
    params.require(:appointment).permit(:patient_id, :clinic, :date, :time)
  end

end
