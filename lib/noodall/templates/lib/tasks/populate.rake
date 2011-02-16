namespace :db do

  task :seed => :environment do
    require 'db/seeds'
  end

  task :populate => :seed do
    # Create some sub pages
  end
end
