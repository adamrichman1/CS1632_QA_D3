require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

error Sinatra::NotFound do
  erb :invalid_page
end

post '/truth' do
  # Get params
  truth_symbol = params['truth_symbol'].to_s
  false_symbol = params['false_symbol'].to_s
  size = params['size'].to_s

  # Check for default values
  if truth_symbol == ""
    truth_symbol = "T"
  end
  if false_symbol == ""
    false_symbol = "F"
  end
  if size == ""
    size = "3"
  end
  size = size.to_i
  @size = size

  # Create tables
  @table = Hash.new
  @table[truth_symbol] = true
  @table[false_symbol] = false
  @reverse_table = Hash.new
  @reverse_table[true] = truth_symbol
  @reverse_table[false] = false_symbol

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

def display_t_f
  symbols = [@reverse_table[true], @reverse_table[false]]
  symbols.repeated_permutation(@size).to_a
end

def comp_and(row)
  to_ret = true
  row.each do |val|
    puts val
    to_ret &= @table[val]
  end
  @reverse_table[to_ret]
end

def comp_or(row)
  to_ret = false
  row.each do |val|
    to_ret |= @table[val]
  end
  @reverse_table[to_ret]
end

def comp_xor(row)
  count = 0
  row.each do |val|
    if @table[val]
      count += 1
    end
  end
  @reverse_table[count.odd?]
end
