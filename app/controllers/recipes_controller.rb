class RecipesController < ApplicationController
    before_action :authenticate_user!

    
    def index
        if params[:search] == nil
            @recipes= Recipe.all
        elsif params[:search] == ''
            @recipes= Recipe.all
        else
            #部分検索
            @recipes = Recipe.where("menu LIKE ? ",'%' + params[:search] + '%')
        end
      
    
        
        
        @syusais = Recipe.where(category: "syusai")
        @hukusais = Recipe.where(category: "hukusai")
        @sirumonos = Recipe.where(category: "sirumono")
        @sonotas = Recipe.where(category: "sonota")
    end
    

    def new
        @recipe = Recipe.new
    end
    
    def create
        recipe = Recipe.new(recipe_params)
        recipe.user_id = current_user.id
      if recipe.save
          redirect_to :action => "index"
      else
          redirect_to :action => "new"
      end
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        recipe = Recipe.find(params[:id])
        if recipe.update(recipe_params)
          redirect_to :action => "show", :id => recipe.id
        else
          redirect_to :action => "index"
        end
    end

    def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
        redirect_to action: :index
    end
    
    private
    def recipe_params
        params.require(:recipe).permit(:menu, :material, :process, :image, :category)
    end
    
end