require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
  end

  context 'Correct template was rendered' do
    describe 'Render /users/:user_id/posts/:id' do
      it 'Shoul render to index template' do
        get '/users/:user_id/posts'
        expect(response).to render_template(:index)
      end
    end

    describe 'show placeholder' do
      it 'should include the text' do
        get '/users/:user_id/posts/:id'
        expect(response.body).to include('Find me in app/views/posts/show.html.erb')
      end
    end
  end
end
