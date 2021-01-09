class ContactsController < ApplicationController
    
    def index
        
    end
    
    def create
        Contact.create!(contact_params)
        redirect_back(fallback_location: root_path)
    end
    
    private
    def contact_params
        params.require(:contact).permit(:person, :result, :detail,).merge(company_id: params[:company_id], user_id: current_user.id, list_id: params[:list_id])
    end
end
