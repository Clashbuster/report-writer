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

    private

    def accident_params
        params.require(:accident).permit(:time_of_accident, :date_of_accident)
      end

      def locate_account
        # byebug
        @account = Account.find(params[:id])
    end


end
