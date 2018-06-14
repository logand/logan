require 'rails_helper'

RSpec.describe "feedback_responses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_responses/#{feedback_response.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_response) { create(:feedback_response) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:feedback_response, feedback_response, json_item)
    end
  end
end
