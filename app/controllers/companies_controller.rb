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
			if !params[:tool_import_file].blank?
				Tool.import(params[:tool_import_file])
			end
			if !params[:employee_import_file].blank?
				Employee.import(params[:employee_import_file])
			end
			redirect_to "/companies/edit"
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
			redirect_to '/companies/edit'
		else
			render :edit
		end
	end


	private

	def company_params
		params.require(:company).permit(:name, :address, :city, :state, :zip, :country, :email, :telephone, :contact_person)
	end

end
