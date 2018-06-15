# Define how to query and persist a given model.
# Further Resource documentation: https://jsonapi-suite.github.io/jsonapi_compliable/JsonapiCompliable/Resource.html
class FeedbackQuestionResource < ApplicationResource
  # Used for associating this resource with a given input.
  # This should match the 'type' in the corresponding serializer.
  type :feedback_questions
  # Associate to a Model object so we know how to persist.
  model FeedbackQuestion

  has_many :feedback_answers,
  foreign_key: :feedback_question_id,
  resource: FeedbackAnswerResource,
  scope: -> { FeedbackAnswer.all }
end
