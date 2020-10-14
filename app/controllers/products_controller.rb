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
		#code to manage existing products
		@product = Product.new(product_params)	
		if product = Product.find_by(name: @product.name)
			new_qunatity = @product.quantity
			quantity = product.quantity + new_qunatity
			product.update(:quantity => quantity)
			flash[:notice] = "Product was successfully updated"
			return redirect_to product
		else
			#@product = Product.new(product_params)	
			@product.save
			flash[:notice] = "Product was successfully added"
			return redirect_to @product
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
		params.require(:product).permit(:name, :detail, :quantity, :expiry_date)
	end
end
