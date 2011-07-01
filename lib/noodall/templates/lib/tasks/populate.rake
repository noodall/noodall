namespace :db do

  task :seed => :environment do
    require "#{Rails.root}/db/seeds"
  end

  task :populate => :seed do
    # Create some sub pages
  end
end
