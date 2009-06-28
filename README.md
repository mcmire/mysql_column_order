# mysql_column_order

## Summary

Plugin for Ruby on Rails that extends migrations so you can specify an order when
you're adding a new column, as well as other options that ALTER TABLE accepts.

## Usage

This plugin adds options for:

* AFTER *column_name*
* FIRST
* any other options, in freeform

So:

    add_column :posts, :published, :boolean, :default => 0, :null => false, :after => :body
    #=> ALTER TABLE `posts` ADD COLUMN `published` TINYINT(1) NOT NULL DEFAULT 0 AFTER `body`
    
    add_column :posts, :id, :primary_key, :null => false, :first => true
    #=> ALTER TABLE `posts` ADD COLUMN `id` PRIMARY KEY NOT NULL FIRST
    
    change_column :comments, :body, :text, :options => "CHARACTER SET utf8 COLLATE utf8_unicode_ci"
    #=> ALTER TABLE `comments` CHANGE COLUMN `body` TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci

## Installation

    script/plugin install git://github.com/mcmire/mysql_column_order.git

## Support

If you find any bugs with this plugin, feel free to:

* file a bug report in the [Issues area on Github](http://github.com/mcmire/mysql_column_order/issues)
* fork the [project on Github](http://github.com/mcmire/mysql_column_order) and send me a pull request
* email me (*firstname* dot *lastname* at gmail dot com)

## Author/License

Adapted from [John Hume's patch](http://elhumidor.blogspot.com/2009/06/specifying-column-order-in-activerecord.html) by Elliot Winkler.
Released under the MIT license.