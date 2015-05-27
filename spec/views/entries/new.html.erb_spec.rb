require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_content[name=?]", "entry[content]"
      assert_select "input#entry_user_id[name=?]", "entry[user_id]"
    end
  end
end
