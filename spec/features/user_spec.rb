require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before :each do
    @user_one = User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from New York.')
    @user_two = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Amsterdam.')

    3.times do
    Post.create(author: @user_one, title: 'Title', text: 'This is my post')
    end

    3.times do
    Post.create(author: @user_two, title: 'Title', text: 'This is my post')
    end
    end

    it "to show all usernames" do
    visit '/'
    expect(page).to have_content(@user_one.name)
    end
end