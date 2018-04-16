class CompaniesController < ApplicationController
before_action :find_company, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @company = Company.new
  end

  def create
    sweetalert_success('Your resource is created and available.', 'Successfully created', persistent: 'Awesome!')
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @company.archived!
    redirect_to users_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj, :street_number, :address1, :address2, :zip_code, :city, :state)
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
