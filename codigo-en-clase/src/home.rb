class Matcher

  def initialize(properties)
    @properties = properties
  end

  def matches(instance)
    @properties.all? {
        |key, value|
      instance.send(key) == value
    }
  end

end

module Home

  attr_accessor :entities

  def initialize
    @entities = []
  end

  def add(entity)
    @entities << entity
  end

  def buscar(matcher)
    entities.select { |entity|
      matcher.matches(entity)
    }
  end

  def method_missing(name, *params, &block)
    string_name = name.to_s
    buscar_prefix = 'buscar_'
    if (string_name
    .start_with? buscar_prefix)

      properties =
          string_name[buscar_prefix.size..-1]
          .split('_')
          .map {|string| string.to_sym}

      matcher = Matcher.new(Hash[properties.zip(params)])
      buscar(matcher)
    else
      super
    end
  end

  def respond_to_missing?(*args)
    true
  end

end