require 'rspec'
require_relative '../src/xspec'

describe 'xSpec' do

  it 'puede comparar por mayor con nombres "expresivos"' do
    (4 + 3).deberia(ser(mayorQue(5)))
    (4 + 3).deberia ser mayorQue 5
  end

  it 'si la comparación falla, lanza una excepción' do
    expect {
      4.deberia ser mayorQue 9
    }.to raise_error ValidationException
  end

  it 'puede comparar multiples valores contra una misma validación' do
    especificacion {
      esperar do
        length > 3
      end
      siendo do
        ['abcdef', 'abcdefghj']
      end
    }
  end

  it 'falla si comparar multiples valores y alguno no cumple' do
    expect {

      especificacion {
        esperar do
          length > 3
        end
        siendo do
          ['abcde', 'a', 'abcdefofdswagen']
        end
      }
      
    }.to raise_error ValidationException
  end

end