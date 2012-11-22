class BillsController < ApplicationController

	layout 'admin'
	
	before_filter :confirm_logged_in

	def index

	end

	def list
		@inventories = Inventory.search(params[:search], params[:page])
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def new
		@inventory = Inventory.new
	end

	def create
		@inventory = Inventory.new(params[:inventory])
		if @inventory.save
			redirect_to(:action => 'list')	
		else
			render('new')
		end
	end

	def edit
		@inventory = Inventory.find(params[:id])
	end

	def update
		@inventory = Inventory.find(params[:id])
		if @inventory.update_attributes(params[:inventory])
			redirect_to(:action => 'list')	
		else
			render('edit')
		end
	end

	def delete
		@inventory = Inventory.find(params[:id])
	end

	def destroy
		inventory = Inventory.find(params[:id])
		inventory.destroy
		flash[:notice] = "Schedule destroyed."
		redirect_to(:action => 'list')
	end
end
