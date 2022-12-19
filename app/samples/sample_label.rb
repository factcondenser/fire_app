class SampleLabel < ApplicationSample
  def load
    create_list(:label, count)
  end
end
