require 'rspec'
require_relative '../src/home'
require_relative '../src/usuario'

describe 'Dynamic Matcher' do

  class UsuariosHome
    include Home
  end

  before :each do
    @home = UsuariosHome.new

    maria = Usuario.new("Maria", 20, true)
    jose = Usuario.new("Jose", 55, true)
    josefa = Usuario.new("Josefa", 55, true)

    @home.instance_eval {
      add (Usuario.new("Juan", 33, true))
      add (Usuario.new("Pedro", 10, false))
      add (maria)
      add (Usuario.new("Paula", 30, false))
      add (jose)
      add (josefa)
      add (Usuario.new("Antonio", 55, false))
    }

    @maria = maria
    @jose = jose
    @josefa = josefa
  end

  it 'puede buscar las entidades que matchean con una property' do
    resultado = @home.buscar_nombre("Maria")

    resultado.size.should == 1
    resultado[0].should == @maria
  end

  it 'puede buscar entidades por varias properties' do
    resultado = @home.buscar_edad_verificado(55, true)

    resultado.size.should == 2
    resultado[0].should == @jose
    resultado[1].should == @josefa
  end

end