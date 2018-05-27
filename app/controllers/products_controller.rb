class ProductsController < ApplicationController
  def index
    @section = Section.find(params[:section_id])
    if params.has_key? :count
      @products = Product.where(section_id: params[:section_id], count: params[:count])
    else
      @products = @section.products
    end
  end

  def new
    @section = Section.find(params[:section_id])
    @product = Product.new
  end

  def edit
    @section = Section.find(params[:section_id])
    @product = @section.products.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @section = Section.find(params[:section_id])
  end

  def create
    @section = Section.find(params[:section_id])
    @product = @section.products.new(product_params)

    if @product.save
      redirect_to section_products_path(params[:section_id], @product)
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to section_product_path(params[:section_id], @product)
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to section_products_path(params[:section_id])
  end

  def increase
    @product = Product.find(params[:id])
    @product.count += 1
    @product.save
    redirect_to section_product_path(params[:section_id], params[:id])
  end

  def decrease
    @product = Product.find(params[:id])
    @product.count -= 1
    @product.save
    redirect_to section_product_path(params[:section_id], params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:description, :count)
  end
end
