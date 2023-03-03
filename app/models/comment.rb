class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :post,
        foreign_key: :post_id,
        class_name: :Post

    def update_post_comments_counter
        self.post.comments_counter = self.post.comments.count
        self.post.save
    end
end
