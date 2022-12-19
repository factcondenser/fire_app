namespace :sample do
  desc 'Loads sample labels'
  task labels: :sample do
    SampleLabel.load(count: ARGV[0])
  end
end
