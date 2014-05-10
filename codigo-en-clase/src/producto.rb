class Producto

  attr_accessor :nombre, :categoria, :precio

  def initialize(nombre, categoria, precio)
    @nombre = nombre
    @categoria = categoria
    @precio = precio
  end

  def hola
    'hola'
  end

end

