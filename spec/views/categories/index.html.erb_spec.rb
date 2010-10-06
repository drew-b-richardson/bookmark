require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    assign(:categories, [
      stub_model(Category,
        :name => "Name",
        :position => 1
      ),
      stub_model(Category,
        :name => "Name",
        :position => 1
      )
    ])
  end

  it "renders a list of categories" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
