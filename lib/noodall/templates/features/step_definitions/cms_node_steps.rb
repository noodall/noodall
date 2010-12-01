module DehumanizeClassName
  # Convert a human readable class name into a class "my class" => MyClass
  def dehumanize(human_name)
    human_name.parameterize('_').pluralize.classify.constantize
  end
end

World(DehumanizeClassName)

Given /^I am editing content$/ do
  @_content = Factory(:content_page, :parent => Factory(:landing_page, :publish => true))
  visit noodall_admin_node_path(@_content)
end

When /^I am editing the (.*)$/ do |model|
  @_content = dehumanize(model).last
  visit noodall_admin_node_path(@_content)
end

Then /^I should be able to place components in (\d+) (.*) slots$/ do |number, slot_type|
  page.should have_css("#slot-list .#{slot_type}-slot", :count => number.to_i)
end

When /^I create a new root$/ do
  visit new_noodall_admin_node_path
end

When /^I create a new child under a (.*)$/ do |template_title|
  template = template_title.downcase.gsub(' ','_')
  #create the ancester
  parent = Factory(template.to_sym)

  visit noodall_admin_node_nodes_path(parent)
  click_link 'New'
end


Then /^I should be able select a template from the following:$/ do |table|
  table.hashes.each do |row|
    Then %{I should be able select a template from "#{row['Template']}"}
  end
end

Then /^I should be able select a template from "([^\"]*)"$/ do |templates|
  templates.split(',').map(&:strip).each do |template|
    choose(template)
  end
end

When /^(?:I|a website visitor) visit(?:s|) the (content|event|sport|landing|sports landing) page$/ do |type|
  visit node_path(@_content)
end

Given /^an? ((?:[A-Z][a-z\-]*[ _]*)+)exists$/ do |template_title|
  class_name = template_title.strip.gsub(' ','_').classify
  @_content = Factory(class_name.tableize.singularize.to_sym, :publish => true)
end

Given /^the "([^\"]*)" ((?:[A-Z][a-z\-]*[ _]*)+)exists$/ do |node_title, template_title|
  class_name = template_title.strip.gsub(' ','_').classify
  @_content = Factory(class_name.tableize.singularize.to_sym, :title => node_title, :body => node_title, :publish => true)
end

Given /^the ((?:[A-Z][a-z\-]*[ _]*)+)has (\d+) ((?:[A-Z][a-z\-]*[ _]*)+)?children$/ do |parent_class_name, count, child_class_name|
  parent_class_name = parent_class_name.strip.gsub(' ','_').classify
  child_class_name = child_class_name.to_s.strip.gsub(' ','_').classify
  child_class_name = Noodall::Node.first.class.name if child_class_name.blank?

  assert @_content.is_a?(parent_class_name.constantize)
  child_factory_name = child_class_name.tableize.singularize

  @_content_children ||= []
  count.to_i.times do
    @_content_children << Factory(child_factory_name.to_sym, :publish => true, :parent => @_content)
  end
end

Given /^each child has (\d+) children$/ do |count|
  @_content_children.each do |child|
    count.to_i.times do
      Factory(:content_page, :parent => child, :publish => true)
    end
  end
end
