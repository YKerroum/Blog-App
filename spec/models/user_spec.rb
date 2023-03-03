require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'name should be present' do
      user = User.new(name: nil)
      expect(user.valid?).to eq(false)
    end

    it 'posts counter should be a number' do
      user = User.new(posts_counter: 'string')
      expect(user.valid?).to eq(false)
    end

    it 'posts counter should be greater than or equal to 0' do
      user = User.new(posts_counter: -1)
      expect(user.valid?).to eq(false)
    end
  end

  context 'associations and methods' do
    it 'three recent posts should return the most recent three posts' do
      user = User.create(name: 'User 1')
      Post.create(author: user, title: 'Post 1', content: 'Content 1')
      post2 = Post.create(author: user, title: 'Post 2', content: 'Content 2')
      post3 = Post.create(author: user, title: 'Post 3', content: 'Content 3')
      post4 = Post.create(author: user, title: 'Post 4', content: 'Content 4')

      expect(user.three_recent_posts).to_be [post4, post3, post2]
    end
  end
end
