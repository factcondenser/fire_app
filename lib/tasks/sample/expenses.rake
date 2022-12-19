namespace :sample do
  desc 'Loads sample expenses'
  task expenses: :sample do
    SampleExpense.load(count: ARGV[0])
  end
end
