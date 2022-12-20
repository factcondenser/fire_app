class ApplicationSample
  include FactoryBot::Syntax::Methods

  DEFAULT_COUNT = 1
  DEPENDENCIES = [].freeze

  class << self
    def load(count:)
      abort("ERROR: Loading #{klass.name} samples requires that at least one record exist for each of the following - #{dependencies}") unless valid?

      before = klass.count
      new(count).load
      after = klass.count

      puts "Loaded #{after - before} #{klass} sample(s) - new count: #{after}"
    end

    private

    def valid?
      dependencies.all? { |dep| dep.constantize.exists? }
    end

    def dependencies
      self::DEPENDENCIES
    end

    def klass
      @klass ||= name.delete_prefix('Sample').constantize
    end
  end

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

  def random_id_for(klass)
    random_offset = rand(count_for(klass))
    klass.offset(random_offset).pick(:id)
  end

  def count_for(klass)
    iv = "@#{klass.name.underscore}_count"
    instance_variable_get(iv) || instance_variable_set(iv, klass.count)
  end
end
