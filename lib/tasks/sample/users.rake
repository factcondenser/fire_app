namespace :sample do
  desc 'Loads sample users'
  task users: :sample do
    SampleUser.load(count: ARGV[0])
  end
end
