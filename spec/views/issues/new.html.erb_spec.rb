require 'spec_helper'

describe "issues/new.html.erb" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :title => "MyString",
      :opened_by => 1,
      :priority => 1,
      :status => 1,
      :comments => "MyText",
      :assigned_to => 1
    ).as_new_record)
  end

  it "renders new issue form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => issues_path, :method => "post" do
      assert_select "input#issue_title", :name => "issue[title]"
      assert_select "input#issue_opened_by", :name => "issue[opened_by]"
      assert_select "input#issue_priority", :name => "issue[priority]"
      assert_select "input#issue_status", :name => "issue[status]"
      assert_select "textarea#issue_comments", :name => "issue[comments]"
      assert_select "input#issue_assigned_to", :name => "issue[assigned_to]"
    end
  end
end
