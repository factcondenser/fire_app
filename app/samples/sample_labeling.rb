class SampleLabeling < ApplicationSample
  dependencies Label, *Labeling.labelable_types

  def load
    count.times do
      labelable_klass = Labeling.labelable_types.sample

      Retriable.retriable(on: ActiveRecord::RecordInvalid, tries: 5, base_interval: 0) do
        create(:labeling, label_id: random_id_for(Label), labelable_id: random_id_for(labelable_klass), labelable_type: labelable_klass.name)
      end
    end
  end
end
