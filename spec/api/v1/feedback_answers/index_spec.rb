require 'rails_helper'

RSpec.describe "feedback_answers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_answers",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_answer1) { create(:feedback_answer) }
    let!(:feedback_answer2) { create(:feedback_answer) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([feedback_answer1.id, feedback_answer2.id])
      assert_payload(:feedback_answer, feedback_answer1, json_items[0])
      assert_payload(:feedback_answer, feedback_answer2, json_items[1])
    end
  end
end
