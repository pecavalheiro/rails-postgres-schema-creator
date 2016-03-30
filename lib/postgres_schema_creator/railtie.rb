require 'postgres_schema_creator/version'
require 'rails'

module PostgresSchemaCreator
  class Railtie < Rails::Railtie
    railtie_name :postgres_schema_creator

    rake_tasks do
      load 'tasks/postgres_schema_creator.rake'
    end
  end
end
