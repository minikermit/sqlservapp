require 'spec_helper'

describe "documents/show.html.erb" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :type => 1,
      :name => "Name",
      :description => "MyText",
      :position => 1,
      :link_url => "Link Url",
      :document => "Document",
      :draft => false
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
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Document/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
