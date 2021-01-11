class ContactsController < ApplicationController
    
    def index
        
    end
    
    def new
        @contact = Contact.new
        @company = Company.find(params[:company_id])
        @list = @company.list        
    end
    
    def create
        contact = Contact.create!(contact_params)
        @company = contact.company
        @list = @company.list
        redirect_to "/lists/#{@list.id}/companies/#{@company.id}"
    end
    
    def destroy
        contact = Contact.find(params[:id])
        contact.destroy if contact.user.id == current_user.id
        redirect_back(fallback_location: root_path)
    end
    
    def edit
        @contact = Contact.find(params[:id])
        @company = @contact.company
        @list = @company.list
        
    end
    
    def update
        @contact = Contact.find(params[:id])
        @contact.update(contact_params)
        company = @contact.company
        list = company.list
        redirect_to "/lists/#{list.id}/companies/#{company.id}"
    end
    
    private
    def contact_params
        params.require(:contact).permit(:person, :result, :detail, :updated_at)
        .merge(company_id: params[:company_id], user_id: current_user.id, list_id: params[:list_id])
    end
end
