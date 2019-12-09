class ReportsController < ApplicationController

    def index
        @reports = Report.all

    end

    def show
        locate_report
    end

    def new
        @report = Report.new
        @user = User.find(session[:user_id])
    end

    def create
        curret_user
        @report = Report.new
        
         if @report.valid?
            @report.save
            redirect_to @report
         else
            flash[:message] = "Form invalid"
            redirect_to new_report_path
        end
    end

    def edit
        locate_report
    end

    def update
        locate_report
        @report.update(report_params)
        redirect_to @report

    end

    def destroy
        locate_report
        @report.destroy
        redirect_to reports_path
    end

    private
     
      def report_params
        params.require(:report).permit(:user_id, :accident_id, :date_of_report, :time_of_report, :contractor_name, :vehicle_used, :location, :employee_description)
      end

      def locate_report
        # byebug
        @report = Report.find(params[:id])
    end

    def curret_user
        @user = User.find(session[:user_id])
    end

end
