class SampleLabel < ApplicationSample
  DEPENDENCIES = %w[User].freeze

  def load
    create_list(:label, count, user_id: random_id_for(User))
  end
end
