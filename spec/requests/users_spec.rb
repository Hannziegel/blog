require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  context 'Correct template was rendered' do
    describe 'Render /' do
      it 'Should render to index template' do
        get '/'
        expect(response).to render_template(:index)
      end
    end

    describe 'Render /users/show' do
      it 'should render the template' do
        get '/users/show'
        expect(response.body).to render_template(:show)
      end
    end
  end

  context 'Includes correct placeholder' do
    describe 'index placeholder' do
      it 'Should include the text Find me in app/views/users/index.html.erb' do
        get '/'
        expect(response.body).to include('Find me in app/views/users/index.html.erb')
      end
    end

    describe 'show placeholder' do
      it 'Should include the text Find me in app/views/users/show.html.erb' do
        get '/users/show'
        expect(response.body).to include('Find me in app/views/users/show.html.erb')
      end
    end
  end
end
