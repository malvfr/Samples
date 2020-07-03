defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "init the stack" do
    val = "a"
    assert Stack.init(val) == [val]
  end

  test "push value to stack" do
    stack = Stack.init("a")
    assert Stack.push(stack, "b") == ["a", "b"]
  end

  test "pop stack" do
    stack = Stack.init("a")
    stack = Stack.push(stack, "b")
    stack = Stack.push(stack, "c")

    assert Stack.pop(stack) == {"c", ["a", "b"]}
  end

  test "insert to stack at desired index" do
    stack = Stack.init("a")
    stack = Stack.push(stack, "b")
    stack = Stack.push(stack, "c")
    stack = Stack.push(stack, "d")

    index = 2
    assert Stack.insert_at(stack, index , "z") == ["a", "b", "z", "c", "d"]
  end
end
