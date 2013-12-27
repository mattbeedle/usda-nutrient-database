module Database
  def setup_database(db_name, db_config)
    setup_pg(db_name, db_config) if RUBY_PLATFORM == 'ruby'
    setup_jdbc(db_name, db_config) if RUBY_PLATFORM == 'java'
  end

  def setup_pg(db_name, db_config)
    begin
      ActiveRecord::Base.establish_connection(db_name)
      ActiveRecord::Base.connection
    rescue PG::ConnectionBad
      ActiveRecord::Base.establish_connection db_config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database db_config['database']
      ActiveRecord::Base.establish_connection db_config
    end
  end

  def setup_jdbc(db_name, db_config)
    begin
      ActiveRecord::Base.establish_connection(db_name)
      ActiveRecord::Base.connection
    rescue ActiveRecord::JDBCError
      ActiveRecord::Base.establish_connection db_config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database db_config['database']
      ActiveRecord::Base.establish_connection db_config
    end
  end
end
