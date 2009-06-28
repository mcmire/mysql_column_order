module Mcmire
  module MysqlColumnOrder
    def add_column_options!(sql, options)
      super
      if options[:after]
        sql << " AFTER #{quote_column_name(options[:after])}"
      elsif options[:first]
        sql << " FIRST"
      end
      sql << " "+options[:options] if options[:options]
    end
  end
end