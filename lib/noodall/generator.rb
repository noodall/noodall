require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Noodall

  class AppBuilder < Rails::AppBuilder

    def database_yml
      template "config/database.yml", "config/database.yml"
    end

    def javascripts
      copy_file "public/javascripts/application.js"
    end

    def test
      directory 'features'
      directory 'spec'
    end

    def lib
      super
      copy_file "lib/tasks/populate.rake"
    end

    def config
      super
      copy_file "config/sitemap.yml"
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
