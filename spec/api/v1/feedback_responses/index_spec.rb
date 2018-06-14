require 'rails_helper'

RSpec.describe "feedback_responses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_responses",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_response1) { create(:feedback_response) }
    let!(:feedback_response2) { create(:feedback_response) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([feedback_response1.id, feedback_response2.id])
      assert_payload(:feedback_response, feedback_response1, json_items[0])
      assert_payload(:feedback_response, feedback_response2, json_items[1])
    end
  end
end
