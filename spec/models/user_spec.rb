require 'rails_helper'

describe User, type: :model do

  it { should validate_uniqueness_of(:email_address) }
  
end
