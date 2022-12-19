desc 'Validates sample rake task arguments'
task sample: :skip_prod do
  abort('ERROR: Sample rake tasks only accept one argument - the number of samples to load') if ARGV.length > 1

  # Suppress missing task error
  ARGV.each { |a| task a.to_sym }
end
