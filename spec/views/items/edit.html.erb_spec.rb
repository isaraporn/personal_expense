require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :new_record? => false,
      :name => "MyString",
      :category_id => 1,
      :expense => 1.5
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => item_path(@item), :method => "post" do
      assert_select "input#item_name", :name => "item[name]"
      assert_select "input#item_category_id", :name => "item[category_id]"
      assert_select "input#item_expense", :name => "item[expense]"
    end
  end
end
