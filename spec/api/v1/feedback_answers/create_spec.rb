require 'rails_helper'

RSpec.describe "feedback_answers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/feedback_answers", payload
  end

  describe 'adding an answer to a question/response' do
    let!(:response) { create(:feedback_response) }
    let!(:question) { create(:feedback_question) }

    let(:payload) do
      {
        data: {
          type: 'feedback_answers',
          attributes: { answer: '55' },
          relationships: {
            feedback_response: {
              data: {
                type: 'feedback_responses', id: response.id.to_s, method: 'update'
              }
            },
            feedback_question: {
              data: {
                type: 'feedback_questions', id: question.id.to_s, method: 'update'
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect {
        make_request
      }.to change { FeedbackAnswer.count }.by(1)
      answer = FeedbackAnswer.last
      expect(answer.answer).to eq('55')
      expect(answer.feedback_question).to eq(question)
      expect(answer.feedback_response).to eq(response)
    end
  end
end
