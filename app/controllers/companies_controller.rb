class CompaniesController < ApplicationController
  before_action :company_find, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_show(@company)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company = Company.update(company_params)
      redirect_to company_show_path(@company)
    else
      render :new
    end
  end

  def destroy
    if @company.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :vat)
  end

  def company_find
    @company = Company.find(params[:id])
  end
end
