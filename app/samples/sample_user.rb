class SampleUser < ApplicationSample
  def load
    create_list(:user, count)
  end
end
