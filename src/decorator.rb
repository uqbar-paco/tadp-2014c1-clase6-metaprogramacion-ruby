module Decorator

  attr_accessor :decorado

  def initialize(decorado)
    @decorado = decorado
  end

  def method_missing(nombre, *args, &block)
    decorado.send(nombre, *args, &block)
  end

  def respond_to_missing?(nombre, include_all)
    super || @decorado.respond_to?(nombre, include_all)
  end

end