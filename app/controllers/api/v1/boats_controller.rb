require 'securerandom'

class Api::V1::BoatsController < RestPlanningController
    
    def index
        render :json => Boat.all
    end
    
    def show
        render :json => Boat.find(params[:id])
    end
    
    def create
        boat = {
            :name => params[:name],
            :length => params[:length],
            :boat_type => params[:boat_type],
            :at_sea => true
        }
        boat = Boat.new(boat)
        boat.save
        render :status => 201, :json => boat
    end
    
    def update
        boat = Boat.find(params[:id])
        attributes = {
            :name => params[:name],
            :length => params[:length],
            :boat_type => params[:boat_type],
            :at_sea => params[:at_sea]
        }
        boat.update_attributes(attributes)
        
        if boat.at_sea === true
            # find the slip, get the boat_id and destroy it
            slip = Slip.find_by_boat_id(boat.id)
            
            if slip.present?
                slip.boat_id = nil
                slip.arrival_date = nil
                slip.save
            end
        end
        
        if boat.at_sea === false and Slip.where(:boat_id => boat.id).count < 1
            # find any empty slips
            slip = Slip.where(:boat_id => nil).first
            # if exists
            if slip.present?
                slip.boat_id = boat.id
                slip.arrival_date = Time.now
                slip.save
            else
                number = SecureRandom.random_number(100)
                Slip.create(:boat_id => boat.id, :number => number)
            end
        end
        
        render :json => boat
    end
  
    def destroy
        # find the boat
        boat = Boat.find(params[:id])
        boat_id = boat.id
        boat.destroy
        
        # find the slip, get the boat_id and set the boat_id to nil
        slip = Slip.find_by_boat_id(boat_id)
        
        if slip.present?
            slip.boat_id = nil
            slip.arrival_date = nil
            slip.save
        end
        
        head :no_content
    end

end