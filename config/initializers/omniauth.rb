Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1532382067022209', '33b2d798b3a8162461c0f79861249bc7'
end