require 'rails_helper'

RSpec.describe "Pages Check", :type => :feature do
    context "When you go to /pages/residential" do
        it "It displays the residential page" do
            visit '/pages/residential'
            expect(page).to have_text('Elevate Safety, Speed and Style in Residential Buildings')
        end
    end

    context "When you go to /" do
        it "It displays the home page" do
            visit '/'
            expect(page).to have_text('Elevate Safety, Speed and Style')
        end
    end
end
