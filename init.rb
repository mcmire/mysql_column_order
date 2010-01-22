if defined?(ActiveRecord::ConnectionAdapters::MysqlAdapter)
  require 'mcmire/mysql_column_order'
  ActiveRecord::ConnectionAdapters::MysqlAdapter.class_eval { include Mcmire::MysqlColumnOrder }
end