require 'rails_helper'

RSpec.describe "Index Check", :type => :feature do
    context "When you go to /" do
        it "Displays the home page" do
            visit '/'
            expect(page).to have_text('Elevate Safety, Speed and Style')
        end
    end
end