require 'rails_helper'

RSpec.describe "feedback_questions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/feedback_questions/#{feedback_question.id}"
  end

  describe 'basic destroy' do
    let!(:feedback_question) { create(:feedback_question) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { FeedbackQuestion.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
