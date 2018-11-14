class GraphBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_graph_block, only: [:show, :edit, :update, :destroy]

  def new
    @graph_block = Graph_block.new
  end

  def show
  end

  def index
  end

  def create
    @graph_block = Graph_block.new(graph_block_params)
    @graph_block.user = current_user
    if @graph_block.save
      redirect_to graph_blocks_path
    else
      render :new
    end
  end

  def update
    if @graph_block.update(graph_block_params)
      redirect_to graph_blocks_path(@graph_block)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @graph_block.destroy
    if @graph_block.destroy
      redirect_to graph_blocks_path
    else
      render :new
    end
  end

  private

  def set_graph_block
    @graph_block = Graph_block.find(params[:id])
  end

  def graph_block_params
    params.require(:graph_block).permit(:content, :order, :report_id)
  end

end
