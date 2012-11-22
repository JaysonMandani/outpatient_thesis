class DemoController < ApplicationController
 
  def index
    @title = "Teen Wolf"
  end 
 

  def hello
    @array = [1,2,3,4,5]
    @id = params[:id].to_i
    @page = params[:page].to_i
    #render(:text => "Hello Everyone!")
  end

 

end
