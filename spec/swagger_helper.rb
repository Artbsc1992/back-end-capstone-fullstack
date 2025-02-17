require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      'components' => {
        securitySchemes: {
          token: {
            type: :apiKey,
            name: 'Authorization',
            in: :header
          }
        }
      },
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://stadium-api-rails.herokuapp.com',
          variables: {
            defaultHost: {
              default: 'https://stadium-api-rails.herokuapp.com/'
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :yaml
end
