class AddPostsAssociationToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.integer :posts_counter, default: 0
      t.has_many :posts
    end

    change_table :posts do |t|
      t.belongs_to :author, foreign_key: {to_table: :users}, index: true, counter_cache: :posts_counter
      t.has_many :comments
      t.has_many :likes
    end
  end
end
