class InterventionsController < ApplicationController
  def intervention
      @intervention = Intervention.new
  end

  def building_select
    p params["customer_id"]
      @buildings = Building.where(customer_id: params["customer_id"])
      respond_to do |format |
         format.json {
             render json: {
                 buildings: @buildings
             }
         }
      end
  end

  def battery_select
    p params["building_id"]
      @batteries = Battery.where(building_id: params["building_id"])
      respond_to do |format |
        format.json {
            render json: {
                batteries: @batteries
            }
        }
      end
  end

  def column_select
    p params["battery_id"]
    @columns = Column.where(battery_id: params["battery_id"])
    respond_to do |format |
       format.json {
           render json: {
               columns: @columns
           }
       }
    end
  end

  def elevator_select
    p params["column_id"]
    @elevators = Elevator.where(column_id: params["column_id"])
    respond_to do |format |
       format.json {
           render json: {
               elevators: @elevators
           }
       }
    end
  end
end
