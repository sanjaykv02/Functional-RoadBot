defmodule Evision.Detail.GraphCutSeamFinder do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.GraphCutSeamFinder` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.GraphCutSeamFinder", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.GraphCutSeamFinder", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **cost_type**: `String`

  ##### Keyword Arguments
  - **terminal_cost**: `float`.
  - **bad_region_penalty**: `float`.

  ##### Return
  - **self**: `Evision.Detail.GraphCutSeamFinder`



  Python prototype (for reference): 
  ```python3
  GraphCutSeamFinder(cost_type[, terminal_cost[, bad_region_penalty]]) -> <detail_GraphCutSeamFinder object>
  ```

  """
  @spec graphCutSeamFinder(binary(), [{atom(), term()},...] | nil) :: Evision.Detail.GraphCutSeamFinder.t() | {:error, String.t()}
  def graphCutSeamFinder(cost_type, opts) when is_binary(cost_type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      cost_type: Evision.Internal.Structurise.from_struct(cost_type)
    ]
    :evision_nif.detail_detail_GraphCutSeamFinder_GraphCutSeamFinder(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cost_type**: `String`

  ##### Keyword Arguments
  - **terminal_cost**: `float`.
  - **bad_region_penalty**: `float`.

  ##### Return
  - **self**: `Evision.Detail.GraphCutSeamFinder`



  Python prototype (for reference): 
  ```python3
  GraphCutSeamFinder(cost_type[, terminal_cost[, bad_region_penalty]]) -> <detail_GraphCutSeamFinder object>
  ```

  """
  @spec graphCutSeamFinder(binary()) :: Evision.Detail.GraphCutSeamFinder.t() | {:error, String.t()}
  def graphCutSeamFinder(cost_type) when is_binary(cost_type)
  do
    positional = [
      cost_type: Evision.Internal.Structurise.from_struct(cost_type)
    ]
    :evision_nif.detail_detail_GraphCutSeamFinder_GraphCutSeamFinder(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **corners**: `[Point]`
  - **masks**: `[Evision.Mat]`



  Python prototype (for reference): 
  ```python3
  find(src, corners, masks) -> None
  ```

  """
  @spec find(Evision.Detail.GraphCutSeamFinder.t(), list(Evision.Mat.maybe_mat_in()), list({number(), number()}), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def find(self, src, corners, masks) when is_list(src) and is_list(corners) and is_list(masks)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      corners: Evision.Internal.Structurise.from_struct(corners),
      masks: Evision.Internal.Structurise.from_struct(masks)
    ]
    :evision_nif.detail_detail_GraphCutSeamFinder_find(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
