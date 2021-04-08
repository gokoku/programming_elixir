defmodule MyParse do
  def calculate(str) do
    [n1, res] = number_digits(str, 0)
    [op, res] = operator(res, [])
    [n2, []] = number_digits(res, 0)
    op(n1, op, n2)
  end

  def op(n1, op, n2) when op == ?+, do: n1 + n2
  def op(n1, op, n2) when op == ?-, do: n1 - n2
  def op(n1, op, n2) when op == ?*, do: n1 * n2
  def op(n1, op, n2) when op == ?/, do: n1 / n2

  def number_digits([], value), do: [value, []]
  def number_digits([space | tail], value) when space == ?\s, do: [value, tail]
  def number_digits([digit | tail], value)
  when digit in '0123456789' do
    number_digits(tail, value*10 + digit - ?0)
  end
  def number_digits([ non_digit | _ ], _), do: raise "Invalid digit #{non_digit}"

  def operator([space | tail], op) when space == ?\s, do: [op, tail]
  def operator([operator | tail], _) when operator in '+-*/' do
    operator(tail, operator)
  end
  def operator([non_operator | _], _), do: raise "Invalid operator #{non_operator}"
end