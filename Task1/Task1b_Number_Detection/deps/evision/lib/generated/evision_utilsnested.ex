defmodule Evision.Utilsnested do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Utilsnested` struct.

  - **ref**. `reference()`

    The underlying erlang resource variable.

  """
  @type t :: %__MODULE__{
    ref: reference()
  }
  @enforce_keys [:ref]
  defstruct [:ref]
  alias __MODULE__, as: T

  @doc false
  def __to_struct__({:ok, %{class: :Utilsnested, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Utilsnested, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **flag**: `bool`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  testEchoBooleanFunction(flag) -> retval
  ```

  """
  @spec testEchoBooleanFunction(boolean()) :: boolean() | {:error, String.t()}
  def testEchoBooleanFunction(flag) when is_boolean(flag)
  do
    positional = [
      flag: Evision.Internal.Structurise.from_struct(flag)
    ]
    :evision_nif.utils_nested_testEchoBooleanFunction(positional)
    |> __to_struct__()
  end
end
