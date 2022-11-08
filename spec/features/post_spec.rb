require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  before :each do
    @user_one = User.create(name: 'Nunes', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Brazil.')

    @post_one = Post.create(author: @user_one, title: 'Hello', text: 'This is my first post')
    @post_two = Post.create(author: @user_one, title: 'Title 2', text: 'This is my second post')

    @comment_one = Comment.create(post: @post_one, author: @user_one, text: 'Hi Aron!' )
    @comment_two = Comment.create(post: @post_one, author: @user_one, text: 'Hi Karla!' )
  end


  describe "post/index" do
    before(:each) do
      visit "/users/#{@user_one.id}/posts"
    end

    it "I can see the user's profile picture." do
      expect(page).to have_tag('img', :src => "#{@user_one.photo}")
    end

    it "I can see the user's username." do
      expect(page).to have_content(@user_one.name)
    end

    it "I can see the number of posts the user has written." do
      expect(page).to have_content(@user_one.posts_counter)
    end

    it "I can see a post's title." do
      expect(page).to have_content(@post_one.title)
    end

    it "I can see some of the post's body." do
      expect(page).to have_content(@post_one.text)
    end

    it "I can see the first comments on a post." do
      expect(page).to have_content(@comment_one.text)
    end

    it "I can see how many comments a post has." do
      expect(page).to have_content(@post_one.comments_counter)
    end

    it "I can see how many likes a post has." do
      expect(page).to have_content(@post_one.likes_counter)
    end

    it "I can see a section for pagination if there are more posts than fit on the view." do
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_link(@post_two)
      expect(current_path).to eql(user_post_path(@user_one, @post_two))
    end
  end

  describe "post/show" do
    before(:each) do
      visit "users/#{@user_one.id}/posts/#{@user_one.last_three_posts[0].id}"
    end
  end
end
