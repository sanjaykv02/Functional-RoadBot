defmodule Evision.Detail.DpSeamFinder do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.DpSeamFinder` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.DpSeamFinder", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.DpSeamFinder", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **costFunc**: `String`

  ##### Return
  - **self**: `Evision.Detail.DpSeamFinder`


  Python prototype (for reference): 
  ```python3
  DpSeamFinder(costFunc) -> <detail_DpSeamFinder object>
  ```

  """
  @spec dpSeamFinder(binary()) :: Evision.Detail.DpSeamFinder.t() | {:error, String.t()}
  def dpSeamFinder(costFunc) when is_binary(costFunc)
  do
    positional = [
      costFunc: Evision.Internal.Structurise.from_struct(costFunc)
    ]
    :evision_nif.detail_detail_DpSeamFinder_DpSeamFinder(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `String`



  Python prototype (for reference): 
  ```python3
  setCostFunction(val) -> None
  ```

  """
  @spec setCostFunction(Evision.Detail.DpSeamFinder.t(), binary()) :: :ok | {:error, String.t()}
  def setCostFunction(self, val) when is_binary(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.detail_detail_DpSeamFinder_setCostFunction(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
