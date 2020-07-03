defmodule Stack do
  def init(state) do
    [state]
  end
  def push(stack, data) do
    List.insert_at(stack, -1, data)
  end

  def insert_at(stack, index, value), do: List.insert_at(stack, index, value)
  def pop(stack), do: List.pop_at(stack, -1)
end
