class KpiBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kpi_block, only: [:show, :edit, :update, :destroy]

  def new
    @kpi_block = Kpi_block.new
    authorize @kpi_block
  end

  def show
  end

  def index
  end

  def create
    @kpi_block = Kpi_block.new(kpi_block_params)
    @kpi_block.user = current_user
    authorize @kpi_block
    if @kpi_block.save
      redirect_to kpi_blocks_path
    else
      render :new
    end
  end

  def update
    if @kpi_block.update(kpi_block_params)
      redirect_to kpi_blocks_path(@kpi_block)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @kpi_block.destroy
    if @kpi_block.destroy
      redirect_to kpi_blocks_path
    else
      render :new
    end
  end

  private

  def set_kpi_block
    @kpi_block = kpi_block.find(params[:id])
    authorize @kpi_block
  end

  def kpi_block_params
    params.require(:kpi_block).permit(:kpi_type, :order, :start_date, :end_date, :report_id)
  end

end
