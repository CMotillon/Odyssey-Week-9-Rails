require 'rails_helper'

RSpec.describe "Form Check", :type => :feature do
    context "When you create a form" do
        lead = Lead.new(
            name: "RSpec Test",
            company_name: "RSpec Company",
            email: "rspec@test.ca",
            phone: "1231231234",
            project_name: "RSpec Project",
            project_description: "RSpec Description",
            department: "RSpec",
            message: "RSpec Message"
        )

        it "It expects it to be a form and the fields are filled up correctly" do
            p lead
            expect(lead).not_to be(nil)
            expect(lead).to be_a(Lead)
            expect(lead.name).to be_a_kind_of(String)
        end
    end
end