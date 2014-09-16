require 'spec_helper'

describe "spree/admins/new" do
  before(:each) do
    assign(:spree_admin, stub_model(Spree::Admin::Slide).as_new_record)
  end

  it "renders new spree_admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spree_admin_slides_path, "post" do
    end
  end
end
