class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "New Client saved!"
      redirect_to @client
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:notice] = "Successfully updated client."
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Successfully removed client."
    redirect_to clients_url
  end
end
