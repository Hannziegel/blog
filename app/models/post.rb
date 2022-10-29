class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_create :increase_counter

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increase_counter
    author.increment!(:posts_counter)
  end
end