When /^(?:|I )click a "([^"]*)" component slot$/ do |slot_name|
  @_slot_type = slot_name.downcase
  within('ol#slot-list') do
    click_link "#{slot_name} Slot"
  end
end

When /^(?:|I )select the "([^\"]+)" component$/ do |component_name|
  within "#fancybox-inner" do
    select component_name, :from => 'Select the type of component'
  end
end

When /^(?:|I )fill in the following within the component:$/ do |fields|
  within "#fancybox-inner" do
    fields.rows_hash.each do |name, value|
      When %{I fill in "#{name}" with "#{value}"}
    end
  end
end

Given /^I am placing a component in a (.*) slot$/ do |slot|
  begin
    Home.send("#{slot.downcase}_slots", 1)
  rescue Exception => e
    # Hides validation errors if the slot already exists
  end

  node = Home.create!(:title => "Test Node")

  visit noodall_admin_node_path(node)
  within('ol#slot-list') do
    click_link "#{slot} Slot"
  end
end

Then /^I should be able choose from the components (.*)$/ do |components|
  components.split(',').map(&:strip).each do |component|
    Then %{I select the "#{component}" component}
  end
end

Then /^I add some images from the asset library$/ do
  5.times do |i|
    Factory(:asset, :title => "Image #{i}")
  end
  page.find(:css, 'span.add-multi-asset').click
  3.times do |i|
    within "#browser-list li:nth(#{i + 1})" do
      click_link "Add"
    end
  end
  page.find(:css, 'li.action a').click
  sleep 2
end

Then /^I add some assets to from the asset library$/ do
  2.times do |i|
    Factory(:txt_asset, :title => "Text Asset #{i}")
  end
  3.times do |i|
    Factory(:zip_asset, :title => "Zip Asset #{i}")
  end
  page.find(:css, 'span.add-multi-asset').click
  sleep 1
  within "#asset-browser" do
    within "#browser-list li[title='Text Asset 0']" do
      click_link "Add"
    end
    within "#browser-list li[title='Zip Asset 1']" do
      click_link "Add"
    end
    within "#browser-list li[title='Zip Asset 2']" do
      click_link "Add"
    end
  end
  page.find(:css, 'li.action a').click
  sleep 2
end

Then /^should see a list of the files I selected$/ do
  page.should have_css(".downloads li a", :count => 3)
  page.should have_css(".downloads li a[href$='.txt']", :count => 1)
  page.should have_css(".downloads li a[href$='.zip']", :count => 2)
end


When /^(?:|I )press "([^"]*)" within the component$/ do |button|
  within "#fancybox-inner" do
    click_button(button)
  end
  sleep 2
end

When /^(?:|I )select an image from the asset library$/ do
  asset = Factory(:asset, :title => "My Image")
  page.find(:css, 'span.select-file').click
  sleep 1
  click_link "Add"
  sleep 5
end
