require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :index
end

error Sinatra::NotFound do
  erb :invalid_page
end

post '/truth' do
  truth_symbol = params['truth_symbol'].to_s
  false_symbol = params['false_symbol'].to_s
  size = params['size'].to_i

  if symbols_invalid(truth_symbol, false_symbol, size)
    erb :invalid_parameters
  else
    erb :truth, locals: { truth_symbol: truth_symbol, false_symbol:
        false_symbol, size: size }
  end
end

def symbols_invalid(truth_symbol, false_symbol, size)
  if truth_symbol.length != 1 ||
     false_symbol.length != 1 ||
     truth_symbol.eql?(false_symbol) ||
     size < 2
    true
  else
    false
  end
end
