class CompaniesController < ApplicationController
    
    def index
        @company = Company.new
        @companies = Company.all
        @company = @company.contacts.last
    
    end
    
    def show
        @list = List.find(params[:list_id])
        @company = Company.find(params[:id])
        @contact = Contact.new
        @contacts = @company.contacts.order('created_at DESC')
    end
    
    def search
        if params[:area].present?
            @companies = Company.where('area LIKE ?', "%#{params[:area]}%")
        else
            @companies = Company.none
        end
    end
    
    def import
        @list = List.find(params[:list_id])
        @list.company.import(params[:file])
        redirect_to root_path
    end
end
