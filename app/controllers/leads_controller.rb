class LeadsController < ApplicationController
    require 'rake'
    Rails.application.load_tasks
    
    def create

        puts params
        leads = Lead.new
        leads.name = params[:name]
        leads.company_name = params[:company_name]
        leads.email = params[:email]
        leads.phone = params[:phone]
        leads.project_name = params[:project_name]
        leads.project_description = params[:project_description]
        leads.department = params[:department]
        leads.message = params[:message]
        leads.attachment = params[:attachment]
        leads.save!

        $company_name = leads.company_name
        $attachment = leads.attachment

        if leads.save
            redirect_to '/dropbox/auth_callback'
            load File.join(Rails.root, 'lib', 'tasks', 'sync.rake')
            Rake::Task['warehouse:sync'].execute
        end
    end

    def leads_
        render '/'
    end
  
    def show
        redirect_to '/admin/lead'
    end

end
