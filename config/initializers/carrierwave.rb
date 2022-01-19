require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_directory = "instacram2"
    config.fog_credentials = {
            provider: 'AWS',
            aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
            aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
            region: 'ap-southeast-1',
            path_style: true
        }
        
    end
end