Rails.application.config.generators do |g|
  g.helper = false
  g.orm :active_record, primary_key_type: :uuid
  g.request_specs false
  g.system_specs true
end
