require 'spec_helper'

describe "links/edit.html.erb" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :new_record? => false,
      :title => "MyString",
      :url => "MyString",
      :position => 1,
      :category_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    rendered.should have_selector("form", :action => link_path(@link), :method => "post") do |form|
      form.should have_selector("input#link_title", :name => "link[title]")
      form.should have_selector("input#link_url", :name => "link[url]")
      form.should have_selector("input#link_position", :name => "link[position]")
      form.should have_selector("input#link_category_id", :name => "link[category_id]")
    end
  end
end
