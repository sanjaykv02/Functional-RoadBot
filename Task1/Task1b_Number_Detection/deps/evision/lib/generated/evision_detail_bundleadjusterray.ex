defmodule Evision.Detail.BundleAdjusterRay do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BundleAdjusterRay` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BundleAdjusterRay", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BundleAdjusterRay", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.BundleAdjusterRay`


  Python prototype (for reference): 
  ```python3
  BundleAdjusterRay() -> <detail_BundleAdjusterRay object>
  ```

  """
  @spec bundleAdjusterRay() :: Evision.Detail.BundleAdjusterRay.t() | {:error, String.t()}
  def bundleAdjusterRay() do
    positional = [
    ]
    :evision_nif.detail_detail_BundleAdjusterRay_BundleAdjusterRay(positional)
    |> __to_struct__()
  end
end
