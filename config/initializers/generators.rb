Rails.application.config.generators do |g|
  g.helper = false
  g.jbuilder = false
  g.orm :active_record, primary_key_type: :uuid
  g.request_specs false
  g.routing_specs false
  g.view_specs false
end
