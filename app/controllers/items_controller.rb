class ItemsController < ApplicationController

	before_action :find_item, only: [:edit, :destroy, :update]

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	def update
		if @item.update(item_params)
			redirect_to root_path
		else
			render 'edit'
		end

	end
		
	private

		def item_params
			params.require(:item).permit(:title, :description)
		end

		def find_item
			@item = Item.find(params[:id])
		end

end
