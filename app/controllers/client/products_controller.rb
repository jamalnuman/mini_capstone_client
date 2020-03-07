class Client::ProductsController < ApplicationController

  def index 
    response = HTTP.get("http://localhost:3000/api/products")
    @products = response.parse
    render 'index.html.erb'
  end

  def new 
    render 'new.html.erb' #the new request is not sending anything to the backend..so the controller action is simple ..the new action is sending a request to the create action 
  end

  def create
    client_params = {
                    name: params[:name],
                    description: params[:description],
                    price: params[:price]
                    }


    response = HTTP.post(
                        "http://localhost:3000/api/products", 
                        form: client_params
                        )
    #render "create.html.erb"
    product = response.parse
    # p product
    redirect_to "/client/products/#{product["id"]}" #this makes a new webrequest..this will automatically go through the entire cycle one more time and render the show page for the new product by itself 

  end

  def show
    response = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.parse
    render 'show.html.erb'
  end

  def edit
    response = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    # @recipe_id = params[:id] #the keyword of params only resides in the controller
    @product = response.parse
    render 'edit.html.erb'
  end

  def update
    client_params = {
                    name: params[:name],
                    description: params[:description],
                    price: params[:price]
                    }


    response = HTTP.patch(
                        "http://localhost:3000/api/products/#{params[:id]}", #remember to send this id with the update action and to send the correct verb of patch for the update 
                        form: client_params
                        )
    #render "create.html.erb"
    product = response.parse
    # p product
    redirect_to "/client/products/#{product["id"]}" #this makes a new webrequest..this will automatically go through the entire cycle one more time and render the show page for the new product by itself 
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/products/#{params[:id]}")
    redirect_to '/client/products' #these are the routes that you are being redirected which will call the controller and then the show/index page
  end
end
