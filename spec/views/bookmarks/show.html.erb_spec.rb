require 'spec_helper'

describe "bookmarks/show.html.erb" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :type => 1,
      :name => "Name",
      :summary => "MyText",
      :location => "Location",
      :target => "Target",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
