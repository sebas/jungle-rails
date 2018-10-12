class Admin::CategoriesController < ApplicationController

  basic_auth_user = ENV["BASIC_AUTH_USER"]
  basic_auth_secret = ENV["BASIC_AUTH_SECRET"]

  http_basic_authenticate_with name: basic_auth_user, password: basic_auth_secret
  
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
