class ClientsController < ApplicationController
  before_filter :require_user
  
  def index
    @clients = Client.all
    respond_to do |format|
      format.html
      format.js { auto_complete_for_client_name(:limit => params[:limit]) }
    end
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
  
  private
  
  def auto_complete_for_client_name(options = {})
    query = '%' + params[:q].downcase + '%'
    find_options = {
      :conditions => ["LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", query, query],
      :order => "last_name ASC",
      :select => "first_name, last_name",
      :limit => 10 }.merge!(options)
    @items = Client.find(:all, find_options).collect(&:name)
    render :text => @items.join("\n")
  end
  
end
