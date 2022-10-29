class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def last_three_posts
    post.last(3)
  end
end
