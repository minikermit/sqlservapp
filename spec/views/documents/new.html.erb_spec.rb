require 'spec_helper'

describe "documents/new.html.erb" do
  before(:each) do
    assign(:document, stub_model(Document,
      :type => 1,
      :name => "MyString",
      :description => "MyText",
      :position => 1,
      :link_url => "MyString",
      :document => "MyString",
      :draft => false
    ).as_new_record)
  end

  it "renders new document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => documents_path, :method => "post" do
      assert_select "input#document_type", :name => "document[type]"
      assert_select "input#document_name", :name => "document[name]"
      assert_select "textarea#document_description", :name => "document[description]"
      assert_select "input#document_position", :name => "document[position]"
      assert_select "input#document_link_url", :name => "document[link_url]"
      assert_select "input#document_document", :name => "document[document]"
      assert_select "input#document_draft", :name => "document[draft]"
    end
  end
end
