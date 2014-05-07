require 'rspec'
require_relative '../src/decorator'

describe 'Decorator' do

  class StringLoco < Decorator

    def dame_5
      5
    end

  end

  before :each do
    @decorator = StringLoco.new("hola")
  end

  it 'deberia llamar metodos originales sin parametros' do
    @decorator.size.should == 4
  end

  it 'deberia romper si llamo a metodos que el objeto original no tiene' do
    expect {
      @decorator.otra_cosa
    }.to raise_error(NoMethodError)
  end

  it 'puede llamar a los metodos con parametros' do
    (@decorator + " mundo").should == "hola mundo"
    @decorator.concat(" mundito").should == "hola mundito"
    @decorator[2].should == "l"
  end

  it 'deberia responder que entiende / no entiende los metodos que entiende su decorado' do
    @decorator.respond_to?(:pepita).should == false
    @decorator.respond_to?(:size).should == true
  end

  it 'puede obtener un metodo que entiende el decorado' do
    metodo = @decorator.method(:concat)
    metodo.call(" otra cosa").should == "hola otra cosa"
  end

  it 'puede usar metodos propios' do
    @decorator.dame_5.should == 5
  end

  it 'deberia responder que entiende metodos propios' do
    @decorator.respond_to?(:dame_5).should == true
  end

  it 'deberia retornar metodos propios' do
    @decorator.method(:dame_5).call.should == 5
  end

end