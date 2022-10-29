class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :increase_counter

  private

  def increase_counter
    post.increment!(:likes_counter)
  end
end
