class UsersController < ApplicationController
      def likes
        likes = Like.where(user_id: @user.id).pluck(:recipe_id)
        @like_recipes = Recipe.find(likes)
      end

      def show
        @user = User.find(params[:id]) 
      end
    
    private
      def set_user
        @user = User.find(params[:id])
      end
end
