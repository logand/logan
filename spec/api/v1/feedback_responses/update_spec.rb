require 'rails_helper'

RSpec.describe "feedback_responses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/feedback_responses/#{feedback_response.id}", payload
  end

  describe 'basic update' do
    let!(:feedback_response) { create(:feedback_response) }

    let(:payload) do
      {
        data: {
          id: feedback_response.id.to_s,
          type: 'feedback_responses',
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
      }.to change { feedback_response.reload.attributes }
      assert_payload(:feedback_response, feedback_response, json_item)

      # ... assert updates attributes ...
    end
  end
end
