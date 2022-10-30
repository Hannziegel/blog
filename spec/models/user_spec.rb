require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    subject do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from England.',
                  posts_counter: 0)
    end

    it 'Validation of names is working' do
      expect(subject).to be_valid
    end

    it 'If try to create a user withouth name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'check if posts counter validation is working' do
      expect(subject.posts_counter).to be_a_kind_of(Numeric)
    end
  end
end
