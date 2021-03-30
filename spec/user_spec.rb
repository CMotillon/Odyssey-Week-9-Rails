require 'rails_helper'

RSpec.describe User, :type => :model do
    context 'When you create a user' do
        it 'Validates that you entered an email' do
            user = User.new(email: nil)
            expect(user).to_not be_valid
        end
    end
end 