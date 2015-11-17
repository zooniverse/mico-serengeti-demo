require 'mico/api/client'
if Rails.application.secrets.mico_api_username.present?
  Mico::Api::Client.auth = {
    username: Rails.application.secrets.mico_api_username,
    password: Rails.application.secrets.mico_api_password
  }
end
