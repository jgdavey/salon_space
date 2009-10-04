class AppointmentsController < ApplicationController
  before_filter :require_user
  auto_complete_for :client, :first_name, :select => "first_name, last_name"

  def index
    @appointments = Appointment.all
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end
  
  def new
    @appointment = Appointment.new
  end
  
  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      flash[:notice] = "Successfully created appointment."
      redirect_to appointments_path
    else
      render :new
    end
  end
  
  def edit
    @appointment = Appointment.find(params[:id])
  end
  
  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      flash[:notice] = "Successfully updated appointment."
      redirect_to appointments_path
    else
      render :edit
    end
  end
  
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = "Successfully destroyed appointment."
    redirect_to appointments_url
  end
  
  # GET /appointments/1/auto_complete_for_client_name?q=name
  def auto_complete_for_client_name
    find_options = {
      :conditions => [ "LOWER(first_name) LIKE ?", '%' + params[:q].downcase + '%' ],
      :order => "first_name ASC",
      :select => "first_name, last_name",
      :limit => 10 }
    @items = Client.find(:all, find_options).collect(&:name)
    render :text => @items.join("\n")
  end
end
