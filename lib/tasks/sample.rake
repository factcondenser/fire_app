desc 'Suppresses missing task error for sample rake task arguments'
task sample: :skip_prod do
  ARGV.each { |a| task a.to_sym }
end
