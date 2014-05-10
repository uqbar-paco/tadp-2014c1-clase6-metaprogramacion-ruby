
class Usuario

  attr_accessor :nombre, :edad, :verificado

  def initialize(nombre, edad, verificado)
    @nombre = nombre
    @edad = edad
    @verificado = verificado
  end

end