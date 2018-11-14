class TextBlocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text_block, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.find(params[:report_id])
    @text_block = TextBlock.new
  end

  def show
  end

  def index
    @text_blocks = TextBlock.all
  end

  def create
    @report = Report.find(params[:report_id])
    @text_block = TextBlock.new(text_block_params)
    @text_block.report = Report.find(params[:report_id])
    if @text_block.save
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def update
    if @text_block.update(text_block_params)
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @text_block.destroy
    if @text_block.destroy
      redirect_to user_report_path(current_user, @report)
    else
      render :new
    end
  end

  private

  def set_text_block
    @text_block = TextBlock.find(params[:id])
  end

  def text_block_params
    params.require(:text_block).permit(:content, :order, :report_id)
  end

end
