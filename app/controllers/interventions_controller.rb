class InterventionsController < ApplicationController
  before_action :authenticate_user!

  def intervention
    @intervention = Intervention.new
  end

  def intervention_save

    @intervention = Intervention.new(intervention_info)
    @intervention.result = "incomplete"
    @intervention.status = "pending"
    @intervention.author = current_user.id

    @intervention.save!

    if @intervention.save
      zendesk_send()
      redirect_to '/interventions/intervention'
    end
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

  def intervention_info
    params.fetch(:intervention, {}).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
  end 

  def zendesk_send
    client = ZendeskAPI::Client.new do |config|
      config.url = ENV['ZENDESK_URL']
      config.username = ENV['ZENDESK_USERNAME']
      config.token = ENV['ZENDESK_TOKEN']
    end

    ZendeskAPI::Ticket.create!(client,
      :subject => "Intervention requested by: " + current_user.email ,
      :comment => "An intervention has been requested for Customer ID:  #{intervention_info[:customer_id]} 
      at Building ID:  #{intervention_info[:building_id]}  
      Battery ID:  #{intervention_info[:battery_id]} 
      Column ID:  #{intervention_info[:column_id]} 
      Elevator ID:  #{intervention_info[:elevator_id]} 
      Required Employee ID:  #{intervention_info[:employee_id]} 
      Description:  #{intervention_info[:report]}  ",
      :priority => "urgent",
      :type => "problem")
  end
end
