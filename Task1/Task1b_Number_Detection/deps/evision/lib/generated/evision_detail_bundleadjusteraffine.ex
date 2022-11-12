defmodule Evision.Detail.BundleAdjusterAffine do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BundleAdjusterAffine` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BundleAdjusterAffine", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BundleAdjusterAffine", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.BundleAdjusterAffine`


  Python prototype (for reference): 
  ```python3
  BundleAdjusterAffine() -> <detail_BundleAdjusterAffine object>
  ```

  """
  @spec bundleAdjusterAffine() :: Evision.Detail.BundleAdjusterAffine.t() | {:error, String.t()}
  def bundleAdjusterAffine() do
    positional = [
    ]
    :evision_nif.detail_detail_BundleAdjusterAffine_BundleAdjusterAffine(positional)
    |> __to_struct__()
  end
end
