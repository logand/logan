require 'rails_helper'

RSpec.describe "feedback_answers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/feedback_answers/#{feedback_answer.id}", payload
  end

  describe 'basic update' do
    let!(:feedback_answer) { create(:feedback_answer) }

    let(:payload) do
      {
        data: {
          id: feedback_answer.id.to_s,
          type: 'feedback_answers',
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
      }.to change { feedback_answer.reload.attributes }
      assert_payload(:feedback_answer, feedback_answer, json_item)

      # ... assert updates attributes ...
    end
  end
end
