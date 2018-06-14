require 'rails_helper'

RSpec.describe "feedback_answers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedback_answers/#{feedback_answer.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:feedback_answer) { create(:feedback_answer) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:feedback_answer, feedback_answer, json_item)
    end
  end
end
