require File.dirname(__FILE__) + '/../spec_helper'
 
describe AppointmentsController do
#  integrate_views
  
  before(:each) do
    @appointment = Factory(:appointment)
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Appointment.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Appointment.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Appointment.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(appointments_url)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Appointment.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Appointment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Appointment.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Appointment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Appointment.first
    response.should redirect_to(appointment_url(assigns[:appointment]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    appointment = Appointment.first
    delete :destroy, :id => appointment
    response.should redirect_to(appointments_url)
    Appointment.exists?(appointment.id).should be_false
  end
end
