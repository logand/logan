require 'rails_helper'

RSpec.describe "feedback_questions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_questions",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_question1) { create(:feedback_question) }
    let!(:feedback_question2) { create(:feedback_question) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([feedback_question1.id, feedback_question2.id])
      assert_payload(:feedback_question, feedback_question1, json_items[0])
      assert_payload(:feedback_question, feedback_question2, json_items[1])
    end
  end
end
