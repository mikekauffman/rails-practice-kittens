class CategorizationsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = Categorization.new
    @categories = Category.all
  end

  def create
    Categorization.create!(kitten_id: params[:kitten_id], category_id: params[:categorization][:category_id])
    redirect_to root_path
  end
end