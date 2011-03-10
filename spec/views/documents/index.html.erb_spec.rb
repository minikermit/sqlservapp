require 'spec_helper'

describe "documents/index.html.erb" do
  before(:each) do
    assign(:documents, [
      stub_model(Document,
        :type => 1,
        :name => "Name",
        :description => "MyText",
        :position => 1,
        :link_url => "Link Url",
        :document => "Document",
        :draft => false
      ),
      stub_model(Document,
        :type => 1,
        :name => "Name",
        :description => "MyText",
        :position => 1,
        :link_url => "Link Url",
        :document => "Document",
        :draft => false
      )
    ])
  end

  it "renders a list of documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Document".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
