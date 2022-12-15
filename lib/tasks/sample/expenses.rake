namespace :sample do
  desc 'Loads sample expenses'
  task expenses: %i[sample db:seed] do
    SampleExpense.load(ARGV)
  end
end
