require 'spec_helper'

describe "links/show.html.erb" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "Title",
      :url => "Url",
      :position => 1,
      :category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("Url".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
