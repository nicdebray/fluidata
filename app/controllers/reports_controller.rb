class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:destroy, :edit, :update, :show]

  def new
    @report = Report.new

  end

  def show

  end

  def index
    @reports = Report.all
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save
      redirect_to user_reports_path
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to user_report_path(@report)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @report.destroy
    if @report.destroy
      redirect_to user_reports_path
    else
      render :new
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])

  end

  def report_params
    params.require(:report).permit(:name, :user_id)
  end

end
