class AccidentsController < ApplicationController
    
    # def new
    #     @accident = Accident.new
    # end

    def index
        @accidents = Accident.all
    end

    def show
        @accident = Accident.find(params[:id])
    end

    def accident_params
        params.require(:accident).permit(:user_id, :accident_id, :date_of_report, :time_of_report, :contractor_name, :vehicle_used, :location, :employee_description)
      end


end
