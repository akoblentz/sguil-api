require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should validate_presence_of(:sid) }
  it { should validate_presence_of(:cid) }
end
