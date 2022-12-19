namespace :db do
  desc 'Loads all samples'
  task sample: :sample do
    SampleExpense.load(count: 50)
    SampleIncome.load(count: 50)
    SampleLabel.load(count: 5)
    SampleLabeling.load(count: 20)
  end
end
