defmodule Evision.Detail.BundleAdjusterAffinePartial do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BundleAdjusterAffinePartial` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BundleAdjusterAffinePartial", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BundleAdjusterAffinePartial", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.BundleAdjusterAffinePartial`


  Python prototype (for reference): 
  ```python3
  BundleAdjusterAffinePartial() -> <detail_BundleAdjusterAffinePartial object>
  ```

  """
  @spec bundleAdjusterAffinePartial() :: Evision.Detail.BundleAdjusterAffinePartial.t() | {:error, String.t()}
  def bundleAdjusterAffinePartial() do
    positional = [
    ]
    :evision_nif.detail_detail_BundleAdjusterAffinePartial_BundleAdjusterAffinePartial(positional)
    |> __to_struct__()
  end
end
