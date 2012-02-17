# Given /^I am logged in$/ do
#   #create an admin
#   Given %{I go to the sign in page}
#   fill in email
#   finll in password
#   click submit button
# end

Given /^"([^"]*)" admin exists$/ do |arg1|
  Admin.create!(:email => "nickmeccia@gmail.com", :password => "awesome", :password_confirmation => "awesome")
end

