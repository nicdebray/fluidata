class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:destroy, :edit, :update, :show]

  def new
    @report = Report.new
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Company Detail Report', layout: 'pdf_layout.html'
      end
    end
  end

  def index
    @reports1 = Report.where(starred: true).order(:updated_at)
    @reports2 = Report.where(starred: false).order(:updated_at)
  end

  def toggle_starred
    set_report
    @report.starred = !@report.starred
    @report.save
    respond_to do |format|
      format.js
    end
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
