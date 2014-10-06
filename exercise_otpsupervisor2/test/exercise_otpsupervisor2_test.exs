defmodule ExerciseOtpsupervisor2Test do
  use ExUnit.Case

  test "poping all initial elements of the stack" do
    assert Stack.Server.pop == 99
    assert Stack.Server.pop == "Ruben"
    assert Stack.Server.pop == 9
  end
end
