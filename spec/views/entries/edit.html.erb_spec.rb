require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "input#entry_content[name=?]", "entry[content]"
      assert_select "input#entry_user_id[name=?]", "entry[user_id]"
    end
  end
end
