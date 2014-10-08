class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			Tool.import(params[:tool_import_file])
			Employee.import(params[:employee_import_file])
			redirect_to "/companies"
		else 
			render :new 
		end 
	end

	def show
		@company = Company.find(params[:id])	
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])

		if @company.update_attributes(company_params)
			redirect_to @company
		else
			render :edit
		end
	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy
		redirect_to companies_url
	end

	private

	def company_params
		params.require(:company).permit(:name, :address, :city, :state, :zip, :country, :email, :telephone, :contact_person)
	end

end
