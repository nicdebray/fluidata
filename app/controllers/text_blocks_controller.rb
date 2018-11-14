class TextBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text_block, only: [:show, :edit, :update, :destroy]

  def new
    @text_block = Text_block.new
  end

  def show
  end

  def index
  end

  def create
    @text_block = Text_block.new(text_block_params)
    @text_block.user = current_user
    if @text_block.save
      redirect_to text_blocks_path
    else
      render :new
    end
  end

  def update
    if @text_block.update(text_block_params)
      redirect_to text_blocks_path(@text_block)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @text_block.destroy
    if @text_block.destroy
      redirect_to text_blocks_path
    else
      render :new
    end
  end

  private

  def set_text_block
    @text_block = Text_block.find(params[:id])
  end

  def text_block_params
    params.require(:text_block).permit(:content, :order, :report_id)
  end

end
