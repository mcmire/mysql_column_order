require 'helper'

ActiveRecord::Migration.suppress_messages do
  ActiveRecord::Schema.define do
    create_table :posts, :options => "ENGINE=MEMORY", :force => true do |t|
      t.string :title
      t.timestamps
    end
  end
end

class Post < ActiveRecord::Base
end

Protest.describe "mysql_column_order" do
  test ":after option" do
    Post.connection.add_column(:posts, :body, :string, :after => :title)
    Post.reset_column_information
    Post.columns.map(&:name).should == ["id", "title", "body", "created_at", "updated_at"]
  end
  test ":first option" do
    Post.connection.add_column(:posts, :parent_id, :integer, :first => true)
    Post.reset_column_information
    Post.columns.map(&:name).should == ["parent_id", "id", "title", "body", "created_at", "updated_at"]
  end
end