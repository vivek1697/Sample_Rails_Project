class ProductsController < ApplicationController
	
	def index
		@products = Product.all

	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		
		@product = Product.new(product_params)

		products = Product.all
		products.each do |product|
			if product.name = @product.name
				new_qunatity = @product.quantity
				quantity = product.quantity + new_qunatity
				product.update(:quantity => quantity)
				return redirect_to product_path(product)
			else
				@product.save
				return redirect_to @product
			end
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if(@product.update(product_params))
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end


	private def product_params
		params.require(:product).permit(:name, :detail, :quantity)
	end
end
