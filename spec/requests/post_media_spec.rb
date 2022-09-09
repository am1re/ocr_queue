require 'rails_helper'

RSpec.describe 'MediaProcess', type: :request do
  describe 'POST /media' do
    context 'with valid url' do
      before do
        post '/api/v1/media', params: { fileUrl: 'http://example.com/file.png' }
      end

      it 'returns created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid url' do
      before do
        post '/api/v1/media', params: { fileUrl: 'some_invalid_url' }
      end

      it 'returns a bad request status' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with invalid file format' do
      before do
        post '/api/v1/media', params: { fileUrl: 'http://example.com/file.gif' }
      end

      it 'returns a bad request status' do
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with empty fileUrl param' do
      before do
        post '/api/v1/media', params: { fileUrl: '' }
      end

      it 'returns a bad request status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end

