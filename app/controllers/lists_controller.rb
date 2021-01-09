class ListsController < ApplicationController
    
    def index
        @lists = List.all
    end
    
    def show
        @list = List.find(params[:id])
        @companies = @list.companies.all
    end
    
    
end
