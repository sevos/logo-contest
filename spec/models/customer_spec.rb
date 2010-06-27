require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :nip => "value for nip",
      :address => "value for address"
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end
end
