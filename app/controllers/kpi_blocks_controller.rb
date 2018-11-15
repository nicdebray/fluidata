class KpiBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kpi_block, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.find(params[:report_id])
    @kpi_block = KpiBlock.new
  end

  def show
  end

  def index
  end

  def create
    @report = Report.find(params[:report_id])
    @kpi_block = KpiBlock.new(kpi_block_params)
    @kpi_block.report = Report.find(params[:report_id])
    if @kpi_block.save
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def update
    if @kpi_block.update(kpi_block_params)
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @kpi_block.destroy
    if @kpi_block.destroy
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  private

  def set_kpi_block
    @kpi_block = KpiBlock.find(params[:id])
  end

  def kpi_block_params
    params.require(:kpi_block).permit(:kpi_type, :order, :start_date, :end_date, :report_id)
  end

end
