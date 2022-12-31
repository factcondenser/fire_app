class SampleLabel < ApplicationSample
  dependencies User

  def load
    create_list(:label, count, user_id: random_id_for(User))
  end
end
