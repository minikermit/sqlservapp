require 'spec_helper'

describe "issues/index.html.erb" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :title => "Title",
        :opened_by => 1,
        :priority => 1,
        :status => 1,
        :comments => "MyText",
        :assigned_to => 1
      ),
      stub_model(Issue,
        :title => "Title",
        :opened_by => 1,
        :priority => 1,
        :status => 1,
        :comments => "MyText",
        :assigned_to => 1
      )
    ])
  end

  it "renders a list of issues" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
