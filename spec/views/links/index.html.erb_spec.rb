require 'spec_helper'

describe "links/index.html.erb" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :position => 1,
        :category_id => 1
      ),
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :position => 1,
        :category_id => 1
      )
    ])
  end

  it "renders a list of links" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Url".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
