require 'rails_helper'

RSpec.describe "issues/edit", :type => :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :name => "MyText",
      :type => "MyText",
      :user => nil,
      :team => nil
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "textarea#issue_name[name=?]", "issue[name]"

      assert_select "textarea#issue_type[name=?]", "issue[type]"

      assert_select "input#issue_user_id[name=?]", "issue[user_id]"

      assert_select "input#issue_team_id[name=?]", "issue[team_id]"
    end
  end
end
