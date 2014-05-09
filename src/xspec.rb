class Especificacion

  def initialize(&config)
    instance_eval(&config)
  end

  def esperar(&validaciones)
    @validaciones = validaciones
  end

  def siendo(&valores)
    @valores = valores.call
  end

  def validar
    @valores.each { |valor|
      valor.instance_eval &@validaciones
    }
  end

end

class Object

  def especificacion(&config)
    especificacion = Especificacion.new(&config)
    especificacion.validar
  end

  def mayorQue(valor)
    MayorQue.new(valor)
  end

  def menorQue(valor)
    MenorQue.new(valor)
  end

  def ser(validator)
    validator
  end

  def deberia(validator)
    validator.validar(self)
  end

end

module Validador
  def initialize(derecha)
    @derecha = derecha
  end

  def validar(izquierda)
    if !cumple(izquierda, @derecha)
      raise ValidationException.new "#{izquierda} no es #{nombre} que #{@derecha}"
    end
  end
end

class ValidationException < Exception; end

class MayorQue
  include Validador

  def cumple(izquierda, derecha)
    izquierda > derecha
  end

  def nombre
    'mayor'
  end
end

class MenorQue
  include Validador

  def cumple(izquierda, derecha)
    izquierda < derecha
  end

  def nombre
    'menor'
  end
end