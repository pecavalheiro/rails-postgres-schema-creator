task :create_schema do
  db_conf = Rails.configuration.database_configuration[Rails.env]

  conn = ActiveRecord::Base.connection
  if db_conf['adapter'] == 'postgresql' && db_conf['schema_search_path']
    schema_name = db_conf['schema_search_path']
    schemas = conn.select_values("
    SELECT
      *
    FROM
      pg_namespace
    WHERE
      nspname != 'information_schema'
      AND nspname NOT LIKE 'pg%'")

    if schemas.include?(schema_name)
      puts "#{schema_name} already exists"
    else
      conn.execute "create schema #{schema_name}"
    end
  end
end

Rake::Task["db:create"].enhance do
  Rake::Task[:create_schema].invoke
end
