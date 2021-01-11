class ListsController < ApplicationController
    
    def index
        @list = List.new
        @lists = List.all
        @list = @list.companies.all
    end
    
    def show
        @list = List.find(params[:id])
        @companies = @list.companies.all
    end
    
    def new
        @list = List.new
    end
    
    def create
        List.create(list_params)
        redirect_to root_path
    end
    
    private
    def list_params
        params.require(:list).permit(:project_name, :name)
    end
    
end
