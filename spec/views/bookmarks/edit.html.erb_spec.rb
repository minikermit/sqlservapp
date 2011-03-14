require 'spec_helper'

describe "bookmarks/edit.html.erb" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :type => 1,
      :name => "MyString",
      :summary => "MyText",
      :location => "MyString",
      :target => "MyString",
      :position => 1
    ))
  end

  it "renders the edit bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookmarks_path(@bookmark), :method => "post" do
      assert_select "input#bookmark_type", :name => "bookmark[type]"
      assert_select "input#bookmark_name", :name => "bookmark[name]"
      assert_select "textarea#bookmark_summary", :name => "bookmark[summary]"
      assert_select "input#bookmark_location", :name => "bookmark[location]"
      assert_select "input#bookmark_target", :name => "bookmark[target]"
      assert_select "input#bookmark_position", :name => "bookmark[position]"
    end
  end
end
