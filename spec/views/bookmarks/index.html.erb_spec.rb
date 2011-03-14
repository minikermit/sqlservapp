require 'spec_helper'

describe "bookmarks/index.html.erb" do
  before(:each) do
    assign(:bookmarks, [
      stub_model(Bookmark,
        :type => 1,
        :name => "Name",
        :summary => "MyText",
        :location => "Location",
        :target => "Target",
        :position => 1
      ),
      stub_model(Bookmark,
        :type => 1,
        :name => "Name",
        :summary => "MyText",
        :location => "Location",
        :target => "Target",
        :position => 1
      )
    ])
  end

  it "renders a list of bookmarks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
