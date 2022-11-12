defmodule Evision.Detail.NoBundleAdjuster do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.NoBundleAdjuster` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.NoBundleAdjuster", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.NoBundleAdjuster", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.NoBundleAdjuster`


  Python prototype (for reference): 
  ```python3
  NoBundleAdjuster() -> <detail_NoBundleAdjuster object>
  ```

  """
  @spec noBundleAdjuster() :: Evision.Detail.NoBundleAdjuster.t() | {:error, String.t()}
  def noBundleAdjuster() do
    positional = [
    ]
    :evision_nif.detail_detail_NoBundleAdjuster_NoBundleAdjuster(positional)
    |> __to_struct__()
  end
end
