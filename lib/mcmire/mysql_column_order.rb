module Mcmire
  module MysqlColumnOrder
    # Adds options for:
    # 
    # * AFTER <tt>column_name</tt>
    # * FIRST
    # * any other options, in freeform
    # 
    # == Examples
    # 
    #   add_column :posts, :published, :boolean, :default => 0, :null => false, :after => :body
    #   #=> ALTER TABLE `posts` ADD COLUMN `published` TINYINT(1) NOT NULL DEFAULT 0 AFTER `body`
    #   
    #   add_column :posts, :id, :primary_key, :null => false, :first => true
    #   #=> ALTER TABLE `posts` ADD COLUMN `id` PRIMARY KEY NOT NULL FIRST
    #
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