class Post < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :comments,
        foreign_key: :post_id,
        class_name: :Comment

    has_many :likes,
        foreign_key: :post_id,
        class_name: :Like
end

