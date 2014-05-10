require 'rspec'
require_relative '../src/decorator'
require_relative '../src/producto'

describe 'Decorator' do

  class DescuentoDel20
    include Decorator

    def precio
      @decorado.precio * 0.8
    end

    def nombre
      @decorado.nombre + ' (20% off)'
    end
  end

  before :each do
    @producto = DescuentoDel20.new(Producto.new('Carpeta', 'Escolares', 100))
  end

  it 'deberia llamar metodos originales' do
    @producto.categoria.should == 'Escolares'
  end

  it 'puede usar metodos propios' do
    @producto.precio.should == 80
    @producto.nombre.should == 'Carpeta (20% off)'
  end

  it 'deberia romper si llamo a metodos que el objeto original no tiene' do
    expect {
      @producto.otra_cosa
    }.to raise_error(NoMethodError)
  end

  it 'deberia responder que entiende / no entiende los metodos que entiende su decorado' do
    @producto.respond_to?(:otra_cosa).should == false
    @producto.respond_to?(:categoria).should == true
  end

  it 'puede obtener un metodo que entiende el decorado' do
    metodo = @producto.method(:categoria)
    metodo.call.should == "Escolares"
  end

  it 'deberia responder que entiende metodos propios' do
    @producto.respond_to?(:precio).should == true
  end

  it 'deberia retornar metodos propios' do
    @producto.method(:precio).call.should == 80
  end

end