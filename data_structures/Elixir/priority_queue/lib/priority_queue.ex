defmodule PriorityQueue do
  def init({a,x}) do
    [{a,x}]
  end

  def push(queue, value) when is_tuple(value) do
    queue |> List.insert_at(-1, value)
  end

  def push(queue, value) do
    queue |> List.insert_at(-1, {value, 0})
  end

  def peek([]), do: []

  def peek(queue) do
    queue |> get_highest_priority_element |> elem(0)
  end

  def shift([]), do: []

  def shift(queue) do
    index = get_highest_priority_element_index(queue)
    {value, pq } = queue |> List.pop_at(index)
    {elem(value,0), pq}
  end

  defp get_highest_priority_element(queue) do
    highest_priority = get_highest_priority(queue)
    queue |> Enum.find(&(elem(&1,1) == highest_priority))
  end

  defp get_highest_priority_element_index(queue) do
    highest_priority = get_highest_priority(queue)
    queue |> Enum.find_index(&(elem(&1,1) == highest_priority))
  end

  defp get_highest_priority(queue) do
    {_, priority} = queue |> Enum.sort_by(&(elem(&1,1))) |> Enum.at(-1)
    priority
  end
end
