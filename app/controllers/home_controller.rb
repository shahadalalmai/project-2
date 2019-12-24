class HomeController < ApplicationController

    before_action :authenticate_patient!
    def index
        @patient = current_patient
        puts "HEY PATIENT"
        #puts @patient.appointments
        @apt = @patient.appointments # grabbing all appts for this patient
        #puts patient_session
    end




end