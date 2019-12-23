class AppointmentController < ApplicationController
  
  def index
  end

  def new
    # I need to specify the patient
    @appt = current_patient.appointments.new # just to create an empty record
  end

  def edit
  end
end
