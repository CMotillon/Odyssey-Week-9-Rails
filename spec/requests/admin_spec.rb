require 'rails_helper'

RSpec.describe "Admin Check", :type => :feature do
    context "When you go to /interventions/intervention or /admin" do
        it "It redirects if you're not an admin" do
            visit '/interventions/intervention'
            expect(page).to have_text('Log in')

            visit '/admin' 
            expect(page).to have_text('Log in')
        end
    end
end