require 'rails_helper'

RSpec.describe "feedback_questions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_questions/#{feedback_question.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_question) { create(:feedback_question) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:feedback_question, feedback_question, json_item)
    end
  end
end
