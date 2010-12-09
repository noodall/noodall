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
end

When /^(?:|I )press "([^"]*)" within the component$/ do |button|
  within "#fancybox-inner" do
    click_button(button)
  end
  sleep 1
end

When /^(?:|I )select an image from the asset library$/ do
  asset = Factory(:asset, :title => "My Image")
  page.find(:css, 'span.select-file').click
  click_link "Add"
  sleep 5
end
