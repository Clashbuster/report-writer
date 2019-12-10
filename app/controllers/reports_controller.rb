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
        # byebug
        # curret_user
        # @report = Report.new(report_params)
        # accident_date =  params['accident'].values.join('-')
        # report_date = []
        # report_date << params['report']['datetime_of_report(1i)']
        # report_date << params['report']['datetime_of_report(2i)']
        # report_date << params['report']['datetime_of_report(3i)']
        # report_date << params['report']['datetime_of_report(4i)']
        # report_date << params['report']['datetime_of_report(5i)']

        # @accident = Accident.create(datetime_of_accident: accident_date)

        # @report.user_id = session[:user_id]
        # @report.accident_id = @accident.id
        # @report.datetime_of_report = report_date.join('-')
        # @report.contractor_name = params[:report][:contractor_name]
        # @report.vehicle_used = params[:report][:vehicle_used]
        # @report.location = params[:report][:location]
        # @report.employee_description = params[:report][:employee_description]
        # @report.utility_line = params[:report][:utility_line]
        # @accident.save
        # @report.save
        # byebug

        @report = Report.new(report_params)
        @accident = Accident.new(accident_params)
        @accident.save
        @report.user_id = session[:user_id]
        @report.accident_id = @accident.id
        @report.save
        
        redirect_to reports_path
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
    params.require(:report).permit(:datetime_of_report, :contractor_name, :vehicle_used, :location, :employee_description, :utility_line, :user_id, :accident_id, pre_damage_pictures: [], post_damage_pictures: [])
    end

    def accident_params
        params.require(:accident).permit(:datetime_of_accident)
    end

      def locate_report
        # byebug
        @report = Report.find(params[:id])
    end

    def curret_user
        @user = User.find(session[:user_id])
    end

end
