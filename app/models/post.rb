class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_create :increase_counter

  validates :title, presence: true, length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates :comments_counter, numericality: { greater_than_or_equal: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal: 0 }

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increase_counter
    author.increment!(:posts_counter)
  end
end
