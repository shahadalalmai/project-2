class HomeController < ApplicationController

    before_action :authenticate_patient!
    def index
        @patient = current_patient
    end
end