require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
  it "title should not be too long" do
    post = Post.new(title: "a" * 1001)
    expect(post.valid?).to eq(false)
  end

  it "comments counter should be an integer greater than or equal to 0" do
    post = Post.new(comments_counter: -1)
    expect(post.valid?).to eq(false)
  end

  it "likes counter should be an integer greater than or equal to 0" do
    post = Post.new(likes_counter: -1)
    expect(post.valid?).to eq(false)
  end

  it "should update author posts counter after create, destroy, and update" do
    author = User.create(name: 'John Doe')

    post = Post.create(title: 'My first post', author: author)
    expect(author.posts_counter).to eq(1)

    post2 = Post.create(title: 'My second post', author: author)
    expect(author.posts_counter).to eq(2)

    post2.destroy

    expect(author.posts_counter).to eq(1)

    post3 = Post.create(title: 'My third post', author: author)

    expect(author.posts_counter).to eq(2)

  end
end

context 'associations and methods' do
  it "five recent comments should return the 5 most recent comments" do
      user = User.create(name: 'User 1')
      post = Post.create(author: user, title: 'Post 1')
     comment1 = Comment.create(author: user, post: post, text: 'Comment 1')
     comment2 = Comment.create(author: user, post: post, text: 'Comment 2')
     comment3 = Comment.create(author: user, post: post, text: 'Comment 3')
     comment4 = Comment.create(author: user, post: post, text: 'Comment 4')
     comment5 = Comment.create(author: user, post: post, text: 'Comment 5')
     comment6 = Comment.create(author: user, post: post, text: 'Comment 6')
      expect(post.five_recent_comments).to eq [comment6, comment5, comment4, comment3, comment2]
  end
end
end
