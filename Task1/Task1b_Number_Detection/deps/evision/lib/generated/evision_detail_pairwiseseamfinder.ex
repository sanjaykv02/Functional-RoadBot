defmodule Evision.Detail.PairwiseSeamFinder do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.PairwiseSeamFinder` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.PairwiseSeamFinder", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.PairwiseSeamFinder", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **corners**: `[Point]`

  ##### Return
  - **masks**: `[Evision.Mat]`


  Python prototype (for reference): 
  ```python3
  find(src, corners, masks) -> masks
  ```

  """
  @spec find(Evision.Detail.PairwiseSeamFinder.t(), list(Evision.Mat.maybe_mat_in()), list({number(), number()}), list(Evision.Mat.maybe_mat_in())) :: list(Evision.Mat.t()) | {:error, String.t()}
  def find(self, src, corners, masks) when is_list(src) and is_list(corners) and is_list(masks)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      corners: Evision.Internal.Structurise.from_struct(corners),
      masks: Evision.Internal.Structurise.from_struct(masks)
    ]
    :evision_nif.detail_detail_PairwiseSeamFinder_find(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
