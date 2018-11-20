class KpiBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kpi_block, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.find(params[:report_id])
    @kpi_block = KpiBlock.new
    choice_kpi
  end

  def show
  end

  def index
  end

  def create
    @report = Report.find(params[:report_id])
    @kpi_block = KpiBlock.new(kpi_block_params)
    @kpi_block.start_date = Date.strptime(kpi_block_params[:start_date], '%m/%d/%Y')
    @kpi_block.end_date = Date.strptime(kpi_block_params[:end_date], '%m/%d/%Y')

    @kpi_block.report = Report.find(params[:report_id])
    if @kpi_block.save!
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def update
    if @kpi_block.update(kpi_block_params)
      redirect_to user_report_path(current_user, @report)
      @kpi_block.start_date = Date.strptime(kpi_block_params[:start_date], '%m/%d/%Y')
      @kpi_block.end_date = Date.strptime(kpi_block_params[:end_date], '%m/%d/%Y')
    else
      render :new
    end
  end

  def edit
    choice_kpi
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
    @report = Report.find(params[:report_id])
    @kpi_block = KpiBlock.find(params[:id])
  end

  def kpi_block_params
    params.require(:kpi_block).permit(:kpi_type, :order, :start_date, :end_date, :report_id)
  end


  def choice_kpi
    @items = KpiBlock.items_hash.sort_by { |k, v| k }
  end
end
