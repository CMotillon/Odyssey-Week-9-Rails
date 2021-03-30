require 'rails_helper'

RSpec.describe "Admin Check", :type => :feature do
    context "When you go to /interventions/intervention" do
        it "Redirects if you're not an admin" do
            visit '/interventions/intervention'
            expect(page).to have_text('Log in')
        end
    end

    context "When you go to /admin" do
        it "Redirects if you're not an admin" do
            visit '/admin' 
            expect(page).to have_text('Log in')
        end
    end
end