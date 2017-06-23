require 'rails_helper'
  
RSpec.describe 'Pages API', type: :request do

  let!(:pages) { create_list(:page, 5) }
  let(:page_id) { pages.first.id }


  describe 'GET /api/pages' do

    before { get '/api/pages' }

    it 'returns pages' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST /api/pages' do

    let(:valid_attributes) { { page: { url: 'http://example.com' } } }

    context 'when the request is valid' do
      before { post '/api/pages', params: valid_attributes }

      it 'creates a page' do
        expect(json['url']).to eq('http://example.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/pages', params: { page: { url: '' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
      expect(response.body)
          .to match(/Validation failed: Url can't be blank/)
      end
    end
  end  
end