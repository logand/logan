require 'rails_helper'

RSpec.describe "feedback_questions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/feedback_questions/#{feedback_question.id}", payload
  end

  describe 'basic update' do
    let!(:feedback_question) { create(:feedback_question) }

    let(:payload) do
      {
        data: {
          id: feedback_question.id.to_s,
          type: 'feedback_questions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        make_request
      }.to change { feedback_question.reload.attributes }
      assert_payload(:feedback_question, feedback_question, json_item)

      # ... assert updates attributes ...
    end
  end
end
