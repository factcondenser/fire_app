class ApplicationSample
  include FactoryBot::Syntax::Methods

  DEFAULT_COUNT = 1

  def self.load(argv)
    abort('ERROR: Sample rake tasks only accept one argument - the number of samples to load') if argv.length > 1

    before = klass.count
    new(argv[0]).load
    after = klass.count

    puts "Loaded #{after - before} #{klass} sample(s) - new count: #{after}"
  end

  def self.klass
    @klass ||= name.delete_prefix('Sample').constantize
  end
  private_class_method :klass

  def initialize(count)
    @count = parse_count(count)
  end
  private_class_method :new

  private

  attr_reader :count

  def parse_count(raw_count)
    return DEFAULT_COUNT if raw_count.blank?
    return raw_count.to_i if raw_count.to_i.positive?

    abort('ERROR: The first argument must be an integer greater than 0')
  end
end
