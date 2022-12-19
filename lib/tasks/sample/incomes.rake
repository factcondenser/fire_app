namespace :sample do
  desc 'Loads sample incomes'
  task incomes: :sample do
    SampleIncome.load(count: ARGV[0])
  end
end
