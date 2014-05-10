require 'rspec'
require_relative '../src/filtro'

describe 'Lista Filtrada' do

  it 'si tengo dos lista y solo una esta filtrada, la otra no se altera' do
    positivo = proc {|numero| numero > 0}
    negativo = proc {|number| number < 0}

    otra_lista = []
    otra_lista.filtrada &positivo
    otra_lista.<<(-5)
    otra_lista.should == []

    otra_lista << 8 << 9
    otra_lista.should == [8,9]

    solo_positivos = [].filtrada &positivo
    solo_negativos = [].filtrada &negativo

    solo_positivos.<<( -5)
    solo_positivos.should == []

    solo_positivos.<<(-5).should == solo_positivos

    solo_positivos
      .<<( -5)
      .<<( 45)
      .<<( 8)
    solo_positivos.should == [45, 8]


    solo_negativos << 8 << -5 << 45 << -9
    solo_negativos.should == [-5, -9]

    otros = []
    otros << -5 << 45 << 8
    otros.should == [-5, 45, 8]
  end

  it 'asdf' do

    lista = []
    lista.instance_eval {
      push 5
      push 9
      push 55
    }

    lista.should == [5,9,55]

  end


end