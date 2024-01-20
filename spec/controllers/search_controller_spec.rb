require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @searches' do
      search = Search.create(text: 'Test Search', user_ip: '127.0.0.1')
      get :index
      expect(assigns(:searches)).to eq([search])
    end
  end

  describe 'POST #create' do
    it 'creates a new search and returns success' do
      post :create, params: { search_text: 'Test Search' }
      expect(Search.count).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'returns an error if search creation fails' do
      allow_any_instance_of(Search).to receive(:save).and_return(false)
      post :create, params: { search_text: 'Test Search' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['status']).to eq('error')
    end
  end

  describe 'GET #analytics' do
    it 'renders the analytics template' do
      get :analytics
      expect(response).to render_template('analytics')
    end
  end
end