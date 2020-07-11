defmodule PriorityQueueTest do
  use ExUnit.Case
  doctest PriorityQueue

  setup do
    {:ok, queue: PriorityQueue.init({"a", 1})}
  end
  test "Inits the Queue" do
    assert PriorityQueue.init({"a", 1}) == [{"a", 1}]
  end

  test "Push the Queue with priority 2", context do
    queue = context[:queue]
    assert PriorityQueue.push(queue, {"b", 2}) == [{"a", 1},{"b", 2}]
  end

  test "Push the Queue without specifying priority", context do
    queue = context[:queue]
    assert PriorityQueue.push(queue, "z") == [{"a", 1},{"z", 0}]
  end

  test "Peek the Queue to reveal the next element", context do
    queue = context[:queue]
    queue = PriorityQueue.push(queue, {"b", 2})
    queue = PriorityQueue.push(queue, {"c", 1})
    assert PriorityQueue.peek(queue) == "b"
  end

  test "Shift Queue to remove the highest priority element", context do
    queue = context[:queue]
    queue = PriorityQueue.push(queue, {"b", 2})
    queue = PriorityQueue.push(queue, {"c", 1})
    queue = PriorityQueue.push(queue, {"d", 15})
    queue = PriorityQueue.push(queue, {"e", 5})

    assert PriorityQueue.shift(queue) == {"d", [{"a",1}, {"b", 2}, {"c", 1}, {"e", 5}]}
  end

  # Empty Queue test

  test "Peek empty Queue" do
    queue = []
    assert PriorityQueue.peek(queue) == []
  end

  test "Shift empty Queue" do
    queue = []
    assert PriorityQueue.shift(queue) == []
  end

end
