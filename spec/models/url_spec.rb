require 'rails_helper'

describe Url, type: :model do

  it { should belong_to(:user) }
  it { should validate_uniqueness_of(:title) }

end
