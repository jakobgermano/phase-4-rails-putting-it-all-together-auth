class RecipesController < ApplicationController
  before_action :authorize
  def index
   render json: Recipe.all
 end

 
   def create
      recipe = @current_user.recipes.create!(recipe_params)
      render json: recipe, status: :created
  end


 

 private

 def recipe_params
   params.permit(:title, :instructions, :minutes_to_complete)
 end

end
  

#   def index 
#      recipes = Recipe.all
#      if session[:user_id]
#       render json: recipes, status: :created
#      else
#       render json: {errors: recipes.errors.full_messages}, status: :unprocessable_entity
#      end
#   end

#   def create
#      user = User.find_by(id: session[:user_id])
#      recipe = user.recipes.create(recipe_params)

#      if recipe.valid?
#         recipe.save
#         render json: recipe, status: :created
#      else
#         render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
#      end

#   end

#   private

#   def recipe_params
#      params.permit(:title, :instructions, :minutes_to_complete, :user_id )
#   end

#   def authorize
#     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
#   end

# end
