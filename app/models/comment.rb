class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :increase_counter

  private

  def increase_counter
    post.increment!(:comments_counter)
  end

  def decrease_counter
    author.decrement!(:comments_counter)
  end
end
