require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "defaults to not high priority" do
    todo = Todo.create!(description: "Default priority todo")

    assert_not todo.high_priority
  end
end
