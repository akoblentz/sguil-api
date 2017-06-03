# spec/requests/todos_spec.rb

require 'rails_helper'
require 'date'

RSpec.describe 'Events API', type: :request do
  # init test data
  let!(:events) { create_list(:event, 10) }
  let(:event_id) { events.first.id }

  # Test suite for get
  describe 'GET /events' do
    
    # make http get request
    before { get '/events' }

    it 'returns events' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # test for get /events/:id
  describe 'GET /events/:id' do
    before { get "/events/#{event_id}" }
    
    context 'when the record exists' do
      it 'returns the event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(event_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:event_id) { 12 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  # Test suite for POST /events
  describe 'POST /events' do
  
    #valid event
    let(:valid_attributes) { { sid: 3, cid: 550, signature: 'ET POLICY curl User-Agent Outbound', timestamp: DateTime.new(2017,6,2), status: 0, src_ip: 3232236084, dst_ip: 1386590618, src_port: 49272, dst_port: 80, ip_proto: 6 } }

    context 'when the request is valid' do
      before { post '/events', params: valid_attributes }
    
      it 'creates an event' do
        expect(json['sid']).to eq(3)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/events', params: { sid: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Cid can't be blank/)
      end
    end
  end

  # Test suite for PUT /events/:id
  describe 'PUT /events/:id' do
    let(:valid_attributes) { { sid: 3 } }
    context 'when the record exists' do
      before { put "/events/#{event_id}", params: valid_attributes }
      it 'updates the record' do
        expect(response.body).to be_empty
      end
      
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /events/:id
  describe 'DELETE /events/:id' do
    before { delete "/events/#{event_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
