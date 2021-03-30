require 'rails_helper'

RSpec.describe "Residential Check", :type => :feature do
    context "When you go to /pages/residential" do
        it "Displays the residential page" do
            visit '/pages/residential'
            expect(page).to have_text('Elevate Safety, Speed and Style in Residential Buildings')
        end
    end
end

RSpec.describe "Index Check", :type => :feature do
    context "When you go to the home page" do
        it "Displays the home page" do
            visit '/'
            expect(page).to have_text('Elevate Safety, Speed and Style')
        end
    end
end