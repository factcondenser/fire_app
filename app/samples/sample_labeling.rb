class SampleLabeling < ApplicationSample
  DEPENDENCIES = [*Labeling::LABELABLE_TYPES, 'Label'].freeze

  def load
    count.times do
      random_labelable_id, random_labelable_type = random_labelable
      create(:labeling, label_id: random_label_id, labelable_id: random_labelable_id, labelable_type: random_labelable_type)
    end
  end

  private

  def random_label_id
    random_label_offset = rand(label_count)
    Label.offset(random_label_offset).pick(:id)
  end

  def random_labelable
    labelable_klass = Labeling::LABELABLE_TYPES.sample.constantize
    labelable_count = labelable_klass.count
    random_labelable_offset = rand(labelable_count)
    labelable_id = labelable_klass.offset(random_labelable_offset).pick(:id)
    [labelable_id, labelable_klass.name]
  end

  def label_count
    @label_count ||= Label.count
  end
end
