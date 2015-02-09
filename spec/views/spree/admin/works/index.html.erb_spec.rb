require 'spec_helper'

describe "spree/admins/index" do
  before(:each) do
    assign(:spree_admin_works, [
      stub_model(Spree::Admin::Work),
      stub_model(Spree::Admin::Work)
    ])
  end

  it "renders a list of spree/admins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
