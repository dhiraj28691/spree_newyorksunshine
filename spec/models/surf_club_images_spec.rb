require File.dirname(__FILE__) + '/../spec_helper'

describe SurfClubImages do
  it "should be valid" do
    SurfClubImages.new.should be_valid
  end
end
