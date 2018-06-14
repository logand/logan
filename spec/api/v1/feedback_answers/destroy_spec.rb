require 'rails_helper'

RSpec.describe "feedback_answers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/feedback_answers/#{feedback_answer.id}"
  end

  describe 'basic destroy' do
    let!(:feedback_answer) { create(:feedback_answer) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { FeedbackAnswer.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
