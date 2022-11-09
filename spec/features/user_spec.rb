require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user_one = User.create(name: 'Taylor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from New York.')
    @user_two = User.create(name: 'Ofelia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Amsterdam.')

    3.times do
      Post.create(author: @user_one, title: 'Title', text: 'This is my post')
    end

    3.times do
      Post.create(author: @user_two, title: 'Title', text: 'This is my post')
    end
  end

  describe 'user/index' do
    before(:each) do
      visit '/'
    end

    it 'to show all usernames' do
      expect(page).to have_content(@user_one.name)
    end

    it 'nubers of post tha each user has written' do
      expect(page).to have_content(@user_one.posts_counter)
    end

    it 'show profile picture' do
      expect(page).to have_tag('img', src: @user_one.photo.to_s)
    end

    it 'When click on a user, go to the user page' do
      click_on(@user_one.name)
      expect(current_path).to eql(user_path(@user_one.id))
    end
  end

  describe 'user/show' do
    before(:each) do
      visit "/users/#{@user_one.id}"
    end

    it "I can see the user's profile picture" do
      expect(page).to have_tag('img', src: @user_one.photo.to_s)
    end

    it "I can see the user's username." do
      expect(page).to have_content(@user_one.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user_one.posts_counter)
    end

    it "I can see the user's bio." do
      expect(page).to have_content(@user_one.bio)
    end

    it "I can see the user's first 3 posts." do
      expect(page).to have_content(@user_one.last_three_posts[0].text)
      expect(page).to have_content(@user_one.last_three_posts[1].text)
      expect(page).to have_content(@user_one.last_three_posts[2].text)
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content('See all Posts')
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      expect(page).to have_tag('a', href: user_post_path(@user_one, @user_one.last_three_posts[0].id))
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_on('see-all-posts')
      expect(page).to have_tag('a', href: user_posts_path(@user_one))
    end
  end
end
