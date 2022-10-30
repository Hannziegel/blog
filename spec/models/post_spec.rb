require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should belong_to(:author) }
  end

  describe 'Validations' do
    it do
      should validate_numericality_of(:comments_counter)
      should validate_numericality_of(:likes_counter)
    end

    it do
      @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.new(author: @user, title: 'title', text: 'text', likes_counter: 0, comments_counter: 0)

      should validate_presence_of(:title)
      expect(@post).to be_valid
    end
  end
end
