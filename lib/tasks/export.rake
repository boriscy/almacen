namespace :db do
  desc "Exports data in yaml"

  task "export" => :environment do
    ActiveRecord::Base.establish_connection(:development)
    skip_tables = ["schema_migrations"]
    #(ActiveRecord::Base.connection.tables - skip_tables).each"
  end

  task "import" do
  end
end
