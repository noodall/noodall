Given /^the (.*) is within in a tree of content$/ do |model|
  @_content = dehumanize(model).last
  root = Factory(:landing_page, :publish => true)
  # sub pages
  4.times do |i|
    Factory(:landing_page, :parent => root, :publish => true)
  end
  @_content.parent = Factory(:landing_page, :title => "The Parent", :parent => root, :position => 2, :publish => true)
  @_content.title = @_content.name = "My Thing in the tree"
  @_content.publish = true
  @_content.save

  4.times do |i|
    Factory(:content_page, :parent => @_content, :publish => true)
  end
end

Then /^I should see the tree navigation$/ do
  page.should have_css("#section-nav")
end

Then /^the tree should be opened to the current page$/ do
  page.should have_css("#section-nav li > ul > li:contains('My Thing in the tree') > ul li", :count => 4)
end

