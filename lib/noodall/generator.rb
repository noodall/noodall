require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'generators/rspec/install/install_generator'
require 'generators/devise/install_generator'
require 'generators/cucumber/install/install_generator'

module Noodall

  class AppBuilder < Rails::AppBuilder

    def database_yml
      template "config/database.yml", "config/database.yml"
    end

    def javascripts
      get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
    end

    def test
#      say("Installing rspec from generator", :yellow)
#      invoke Rspec::Generators::InstallGenerator

#      say("Installing cucumber from generator", :yellow)
#      generate('cucumber:install')
    end

  end

  class AppGenerator < Rails::Generators::AppGenerator

    def self.source_root
      @_source_root ||= File.expand_path('../templates', __FILE__)
    end

    def builder
      @builder ||= begin
        builder_class = AppBuilder
        builder_class.send(:include, Rails::ActionMethods)
        builder_class.new(self)
      end
    end
  end
end
