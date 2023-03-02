class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :author, foreign_key: {to_table: :users}, index: true, counter_cache: true
      t.string :title
      t.string :text

      t.timestamps
    end
    has_many :likes
    has_many :comments
  end
end
