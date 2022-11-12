defmodule Evision.Detail.NoSeamFinder do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.NoSeamFinder` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.NoSeamFinder", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.NoSeamFinder", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **arg1**: `[Evision.Mat]`
  - **arg2**: `[Point]`

  ##### Return
  - **arg3**: `[Evision.Mat]`


  Python prototype (for reference): 
  ```python3
  find(arg1, arg2, arg3) -> arg3
  ```

  """
  @spec find(Evision.Detail.NoSeamFinder.t(), list(Evision.Mat.maybe_mat_in()), list({number(), number()}), list(Evision.Mat.maybe_mat_in())) :: list(Evision.Mat.t()) | {:error, String.t()}
  def find(self, arg1, arg2, arg3) when is_list(arg1) and is_list(arg2) and is_list(arg3)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1),
      arg2: Evision.Internal.Structurise.from_struct(arg2),
      arg3: Evision.Internal.Structurise.from_struct(arg3)
    ]
    :evision_nif.detail_detail_NoSeamFinder_find(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
