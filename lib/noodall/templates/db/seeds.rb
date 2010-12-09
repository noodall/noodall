# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
User.create!(:name => "Mr Admin", :email => "hello@wearebeef.co.uk", :password => "passw0rd", :password_confirmation => "passw0rd", :groups => ['admin'])
Home.create!(:title => "Home", :publish => true, :body => "Welcome")
