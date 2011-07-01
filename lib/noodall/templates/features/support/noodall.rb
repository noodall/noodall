#Load Noodall specific stuff
require 'noodall/permalinks'
World(Noodall::Permalinks)

Before do
  # Create the home page
  Home.create! :title => 'home', :publish => true, :body => "Hello"
end
