namespace :sample do
  desc 'Loads sample users'
  task users: :sample do
    SampleUser.load(ARGV)
  end
end
