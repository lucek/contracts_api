module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken        < StandardError; end
  class InvalidToken        < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid,           with: :unprocessable
    rescue_from ExceptionHandler::MissingToken,        with: :unprocessable
    rescue_from ExceptionHandler::InvalidToken,        with: :unprocessable
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: Message.not_found }, :not_found)
    end
  end

  private

  def unprocessable(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
