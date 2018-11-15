class GraphBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_graph_block, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.find(params[:report_id])
    @graph_block = GraphBlock.new
  end

  def show
  end

  def index
  end

  def create
    @report = Report.find(params[:report_id])
    @graph_block = GraphBlock.new(graph_block_params)
    @graph_block.report = Report.find(params[:report_id])
    if @graph_block.save
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def update
    if @graph_block.update(graph_block_params)
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @graph_block.destroy
    if @graph_block.destroy
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  private

  def set_graph_block
    @report = Report.find(params[:report_id])
    @graph_block = GraphBlock.find(params[:id])
  end

  def graph_block_params
    params.require(:graph_block).permit(:graph_type, :start_date, :end_date, :order, :report_id)
  end

end
