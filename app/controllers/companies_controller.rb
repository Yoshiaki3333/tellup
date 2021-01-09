class CompaniesController < ApplicationController
    
    def index
        @list = List.find(params[:list_id])
        @company = Company.new
        @companies = @list.companies.all
        @company = @company.contacts.last
    end
    
    def show
        @list = List.find(params[:list_id])
        @company = Company.find(params[:id])
        @contact = Contact.new
        @contacts = @company.contacts.order('created_at DESC')
    end
    
    def new
        @list = List.find(params[:list_id])
        @company = Company.new
    end
    
    def create
        @list = List.find(params[:list_id])
        Company.create(company_params)
        redirect_to list_companies_path
    end
    
    def edit
        @company = Company.find(params[:id])
        @list = @company.list
    end
    
    def update
        company = Company.find(params[:id])
        company.update(company_params)
        redirect_to list_company_path
    end
    
    def destroy
        company = Company.find(params[:id])
        company.destroy
        redirect_to list_companies_path
    end
    
    def search
        if params[:name].present?
            @companies = Company.where('name LIKE ?', "%#{params[:name]}%")
        else
            @companies = Company.none
        end
    end
    
    def import
        @list = List.find(params[:list_id])
        @list.companies.import(params[:file])
        redirect_back(fallback_location: root_path)
    end
    
    private
    def company_params
        params.require(:company).permit(:name, :adress, :tell).merge(list_id: params[:list_id])
    end
    
end
