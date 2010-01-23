# mysql_column_order

## Summary

A Rails plugin that allows you to keep your schema organized as your app evolves by letting you insert a new column after another one.

## Usage

This plugin adds options to `add_column` for:

* AFTER *column_name*
* FIRST

So, in a migration, you could write:

    add_column :posts, :published, :boolean, :default => 0, :null => false, :after => :body
    #=> ALTER TABLE `posts` ADD COLUMN `published` TINYINT(1) NOT NULL DEFAULT 0 AFTER `body`
    
    add_column :posts, :id, :primary_key, :null => false, :first => true
    #=> ALTER TABLE `posts` ADD COLUMN `id` PRIMARY KEY NOT NULL FIRST

Conceptually, there's no reason this plugin can't work in other DBMSes that support `AFTER`, `FIRST`, or other column options. At present, however, it plugs into ActiveRecord's MySQL adapter only.

## Compatibility

This has been tested successfully with ActiveRecord 2.3.5, 2.2.3, 2.1.2, and 2.0.5.

## Installation

    script/plugin install git://github.com/mcmire/mysql_column_order.git

## Support

If you find a bug or have a feature request, I want to know about it! Feel free to file a [Github issue](http://github.com/mcmire/ar_attr_lazy/issues), or do one better and fork the [project on Github](http://github.com/mcmire/ar_attr_lazy) and send me a pull request or patch. Be sure to add tests if you do so, though.

You can also [email me](mailto:elliot.winkler@gmail.com), or [find me on Twitter](http://twitter.com/mcmire).

## Author/License

[Original implementation](http://elhumidor.blogspot.com/2009/06/specifying-column-order-in-activerecord.html) by John Hume (thank you!).

(c) 2009-2010 Elliot Winkler. See LICENSE for details.