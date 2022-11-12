defmodule Evision.Detail.BundleAdjusterReproj do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BundleAdjusterReproj` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BundleAdjusterReproj", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BundleAdjusterReproj", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Detail.BundleAdjusterReproj`


  Python prototype (for reference): 
  ```python3
  BundleAdjusterReproj() -> <detail_BundleAdjusterReproj object>
  ```

  """
  @spec bundleAdjusterReproj() :: Evision.Detail.BundleAdjusterReproj.t() | {:error, String.t()}
  def bundleAdjusterReproj() do
    positional = [
    ]
    :evision_nif.detail_detail_BundleAdjusterReproj_BundleAdjusterReproj(positional)
    |> __to_struct__()
  end
end
