class Admin::ProductsController < ApplicationController
  basic_auth_user = ENV["BASIC_AUTH_USER"]
  basic_auth_secret = ENV["BASIC_AUTH_SECRET"]
  logger.debug "+++ Sebas #{basic_auth_user} and #{basic_auth_secret} ***"

  http_basic_authenticate_with name: basic_auth_user, password: basic_auth_secret

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: "Product created!"
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: "Product deleted!"
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end
end
