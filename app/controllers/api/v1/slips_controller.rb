class Api::V1::SlipsController < RestPlanningController
    
    def index
        render :json => Slip.all
    end
    
    def show
        render :json => Slip.find(params[:id])
    end
    
    def create
        slip = {
            :arrival_date => params[:arrival_date]
        }
        slip = Slip.new(slip)
        slip.save
        render :status => 201, :json => slip
    end
    
    def update
        slip = Slip.find(params[:id])
        attributes = {
            :arrival_date => params[:arrival_date]
        }
        slip.update_attributes(attributes)
        render :json => slip
    end
  
    def destroy
        # find the slip, get the boat_id and destroy it
        slip = Slip.find(params[:id])
        boat_id = slip.boat_id
        slip.destroy
        
        # find a boat and set it at sea
        if boat_id.present?
            boat = Boat.find(boat_id)
            boat.at_sea = true
            boat.save
        end
        
        head :no_content
    end

end