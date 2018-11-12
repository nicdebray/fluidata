class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.new
    authorize @report
  end

  def show
  end

  def index
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    authorize @report
    if @report.save
      redirect_to reports_path
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @report.destroy
    if @report.destroy
      redirect_to reports_path
    else
      render :new
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
    authorize @report
  end

  def report_params
    params.require(:report).permit(:name, :user_id)
  end

end
