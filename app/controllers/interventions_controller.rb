class InterventionsController < ApplicationController
  before_action :authenticate_user!

  def intervention
    @intervention = Intervention.new
  end

  def intervention_save

    @intervention = Intervention.new(intervention_params)
    @intervention.result = "incomplete"
    @intervention.status = "pending"
    @intervention.author = current_user.id

    @intervention.save!


    if @intervention.save!
      zendesk_send()
      redirect_to '/interventions/intervention'
    end
  end

  def zendesk_send
    client = ZendeskAPI::Client.new do |config|
      config.url = ENV['ZENDESK_URL']
      config.username = ENV['ZENDESK_USERNAME']
      config.token = ENV['ZENDESK_TOKEN']
    end

    @intervention = Intervention.new(intervention_params)
    @intervention.author = current_user.id

    author = Employee.where(user_id: @intervention.author)
    user_email = User.where(id: @intervention.author)

    building = Building.where(id: @intervention.building_id)
    employee = Employee.where(id: @intervention.employee_id)

    ZendeskAPI::Ticket.create!(client, 
        :subject => "#{author.first_name} #{author.last_name} has requested a new intervention", 
        :comment => { 
          :value => "An intervention has been given to #{employee.first_name} #{employee.last_name} for Building #{building.id}. The building address is: #{building.address_building}"
          }, 
        :requester => { 
            "name": author.last_name,
            "email": user_email.email       
          },
        :priority => "normal",
        :type => "task"
      )
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

  def intervention_params
    params.fetch(:intervention, {}).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
  end 
end
