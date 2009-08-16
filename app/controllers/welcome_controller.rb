class WelcomeController < ApplicationController
  def index
    @upcoming_appointments = Appointment.upcoming
    @recent_appointments   = Appointment.recent.reverse  # Reverse to most recent first
    @new_clients           = Client.all(:order => 'created_at DESC', :limit => 10)
  end
end
