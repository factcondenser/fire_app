class SampleLabeling < ApplicationSample
  DEPENDENCIES = ['Label', *Labeling::LABELABLE_TYPES].freeze

  def load
    count.times do
      labelable_klass = Labeling::LABELABLE_TYPES.sample.constantize
      create(:labeling, label_id: random_id_for(Label), labelable_id: random_id_for(labelable_klass), labelable_type: labelable_klass.name)
    end
  end
end
