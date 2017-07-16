OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, 'ac8f498208e0e64e1950', '97c703b83fc7b352170223d2e913abf8f2679087'
end
