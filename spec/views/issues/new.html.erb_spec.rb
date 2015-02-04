require 'rails_helper'

RSpec.describe "issues/new", :type => :view do
  before(:each) do
    assign(:issue, Issue.new(
      :name => "MyText",
      :type => "MyText",
      :user => nil,
      :team => nil
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do

      assert_select "textarea#issue_name[name=?]", "issue[name]"

      assert_select "textarea#issue_type[name=?]", "issue[type]"

      assert_select "input#issue_user_id[name=?]", "issue[user_id]"

      assert_select "input#issue_team_id[name=?]", "issue[team_id]"
    end
  end
end
