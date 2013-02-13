class InventoriesController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in
	before_filter :find_schedules
	before_filter :find_pendings
	before_filter :find_user
	before_filter :load

	def load
    	@inventories = Inventory.search(params[:search], params[:page])
    	@inventory = Inventory.new
  	end

	def index
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def create
		@inventory = Inventory.new(params[:inventory])
		if @inventory.save
			flash[:success] = "Successfully created record."
			@inventories = Inventory.search(params[:search], params[:page])
		end
	end

	def edit
		@inventory = Inventory.find(params[:id])
	end

	def update
		@inventory = Inventory.find(params[:id])
		if @inventory.update_attributes(params[:inventory])
			flash[:success] = "Successfully updated record."
			@inventories = Inventory.search(params[:search], params[:page])
		end
	end

	def destroy
		@inventory = Inventory.find(params[:id]).destroy
		flash[:success] = "Inventory destroyed."
		@inventories = Inventory.search(params[:search], params[:page])
	end

end
