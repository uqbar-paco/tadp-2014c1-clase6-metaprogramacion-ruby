require 'rspec'
require_relative '../src/collection_utils'

describe 'Singleton class' do

  it 'puedo solo agregar metodos a una instancia y no a todas las de una clase' do
    una_lista = []
    otra_lista = []

    una_lista.instance_eval {
      def pepe
        3
      end
    }

    una_lista.pepe.should == 3

    expect {otra_lista.pepe}.to raise_error NoMethodError
  end

  it 'puedo agregar metodos a todas las instancias de una clase' do
    una_lista = []
    otra_lista = []
    expect { una_lista.jose }.to raise_error NoMethodError
    expect { otra_lista.jose }.to raise_error NoMethodError

    Array.class_eval {
      def jose
        12
      end
    }

    una_lista.jose.should == 12
    otra_lista.jose.should == 12
  end

end

describe 'Lista Filtrada' do

  before :each do
    # filtrar por solo números? (limitar a solo números en la lista)
    @lista = [].filtrada { |elemento|
      elemento > 5
    }
  end

  it 'si tengo dos lista y solo una esta filtrada, la otra no se altera' do
    positivo = proc {|numero| numero > 0}

    solo_positivos = [].filtrada &positivo
    solo_positivos << -5 << 45 << 8
    solo_positivos.should == [45, 8]

    otros = []
    otros << -5 << 45 << 8
    otros.should == [-5, 45, 8]

  end

  it 'puede agregar elementos que cumplen con su predicado' do
    @lista << 9 << 21
    @lista.should == [9, 21]
  end

  it 'no agrega elementos que no complen con su predicado' do
    @lista << 9 << 4 << 33 << 2
    @lista.should == [9, 33]
  end

end