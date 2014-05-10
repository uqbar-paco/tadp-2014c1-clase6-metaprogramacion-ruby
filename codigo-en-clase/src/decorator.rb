module Decorator

  def initialize(decorado)
    @decorado = decorado
  end

  def method_missing(name, *args, &block)
    @decorado.send(name, *args, &block)
  end

  def respond_to_missing?(nombre, bool)
    @decorado.respond_to?(nombre, bool)
  end

end