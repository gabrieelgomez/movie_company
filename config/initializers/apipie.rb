Apipie.configure do |config|
  config.app_name                = 'MovieCompany'
  config.api_base_url            = '/v1'
  config.doc_base_url            = '/apipie'
  config.translate               = false
  config.default_locale          = nil
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
