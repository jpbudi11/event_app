class CoordinatorsessionsController < ApplicationController
  
    def new
    end

    def create
          event_coordinator = EventCoordinator.find_by_email(params[:coordinatorsession][:email].downcase)
          if event_coordinator && event_coordinator.authenticate(params[:coordinatorsession][:password])
            coordinator_sign_in event_coordinator
            redirect_to event_coordinator
          else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
          end
    end

    def destroy
      coordinator_sign_out
      redirect_to root_url
    end
    
  
  
end
