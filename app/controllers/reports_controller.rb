class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:destroy, :edit, :update, :show]

  def new
    @report = Report.new
  end

  def show
    @text_block = TextBlock.new
    respond_to do |format|
      format.pdf{ render(template: 'reports/pdf') }
      format.html
      format.json
    end
  end

  def index
    @report = Report.new
    @reports = Report.where('name LIKE ?', "%#{params[:term]}%")
    @reports1 = Report.where(starred: true).order(updated_at: :desc)
    @reports2 = Report.where(starred: false).order(updated_at: :desc)
  end

  def toggle_starred
    set_report
    @report.starred = !@report.starred
    @report.save
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save
      redirect_to user_report_path(current_user, @report)
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

  def get_pdf
    @report = Report.find(params[:id])
    send_data render_to_string pdf: "report", template: "reports/pdf.pdf", encoding: "UTF-8"
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:name, :user_id, :term)
  end

end
