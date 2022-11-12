defmodule Evision.Detail.AffineBasedEstimator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.AffineBasedEstimator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.AffineBasedEstimator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.AffineBasedEstimator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.AffineBasedEstimator`


  Python prototype (for reference): 
  ```python3
  AffineBasedEstimator() -> <detail_AffineBasedEstimator object>
  ```

  """
  @spec affineBasedEstimator() :: Evision.Detail.AffineBasedEstimator.t() | {:error, String.t()}
  def affineBasedEstimator() do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBasedEstimator_AffineBasedEstimator(positional)
    |> __to_struct__()
  end
end
