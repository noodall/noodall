Then /^I should only see the links to the (\d+) Landing Page children$/ do |count|
  page.should have_selector("#navigation li:contains('Play Sport') > ul > li > a", :count => count.to_i)
end

Then /^when I hover over a child$/ do
  # selenium no do :(
end

Then /^I should see links to the child’s children$/ do
  page.should have_selector("#navigation li > ul > li > ul > li > a")
end

Given /^I hover my mouse over "([^"]*)" in the main navigation$/ do |text|
  page.should have_selector("#navigation a", :text => text)
end

Then /^I should see the links to the (\d+) children$/ do |count|
  page.should have_selector("#navigation li:contains('#{@_content.title}') > ul > li", :count => count.to_i)
end
