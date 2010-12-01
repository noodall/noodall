Given /^I am signed in(?: as an? (.*))?$/ do |role|
  role ||= 'user'
  role = role.strip.gsub(/\W/,'_')

  user = Factory(role)
  Given %{I sign in as "#{user.email}/#{user.password}"}
end

Then /^I should see a list of users$/ do
  page.should have_css('tbody tr', :count => 20)
end

# Database

Given /^a user exists with the attrubutes:$/ do |fields|
  user = Factory :user, fields.rows_hash
end

Given /^I sign in as a (.+)$/ do |role|
  user = create_model(role).first
  user.confirm_email!
  Given %{I sign in as "#{user.email}\/#{user.password}"}
end

# Actions

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  When %{I go to the sign in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^I sign out$/ do
  visit destroy_user_session_path
end

Then /^the user should (not )?be able to sign in as "(.*)\/(.*)"$/ do |yes_no, email, password|
  Given %{I sign out}
  And %{I sign in as "#{email}/#{password}"}
  if yes_no.blank?
    Then %{I should see "Signed in successfully"}
  else
    Then %{I should see "Invalid email or password."}
  end
end


