require 'spec_helper'

describe "links/new.html.erb" do
  before(:each) do
    assign(:link, stub_model(Link,
      :new_record? => true,
      :title => "MyString",
      :url => "MyString",
      :position => 1,
      :category_id => 1
    ))
  end

  it "renders new link form" do
    render

    rendered.should have_selector("form", :action => links_path, :method => "post") do |form|
      form.should have_selector("input#link_title", :name => "link[title]")
      form.should have_selector("input#link_url", :name => "link[url]")
      form.should have_selector("input#link_position", :name => "link[position]")
      form.should have_selector("input#link_category_id", :name => "link[category_id]")
    end
  end
end
