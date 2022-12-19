namespace :sample do
  desc 'Loads sample labelings'
  task labelings: :sample do
    SampleLabeling.load(count: ARGV[0])
  end
end
