class AppointmentsController < ApplicationController
  before_filter :require_user

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
end
