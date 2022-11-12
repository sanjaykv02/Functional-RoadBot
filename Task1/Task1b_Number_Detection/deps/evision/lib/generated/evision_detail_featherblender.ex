defmodule Evision.Detail.FeatherBlender do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.FeatherBlender` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.FeatherBlender", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.FeatherBlender", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **sharpness**: `float`.

  ##### Return
  - **self**: `Evision.Detail.FeatherBlender`



  Python prototype (for reference): 
  ```python3
  FeatherBlender([, sharpness]) -> <detail_FeatherBlender object>
  ```

  """
  @spec featherBlender([{atom(), term()},...] | nil) :: Evision.Detail.FeatherBlender.t() | {:error, String.t()}
  def featherBlender(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_FeatherBlender_FeatherBlender(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **sharpness**: `float`.

  ##### Return
  - **self**: `Evision.Detail.FeatherBlender`



  Python prototype (for reference): 
  ```python3
  FeatherBlender([, sharpness]) -> <detail_FeatherBlender object>
  ```

  """
  @spec featherBlender() :: Evision.Detail.FeatherBlender.t() | {:error, String.t()}
  def featherBlender() do
    positional = [
    ]
    :evision_nif.detail_detail_FeatherBlender_FeatherBlender(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **dst**: `Evision.Mat`
  - **dst_mask**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  blend(dst, dst_mask) -> dst, dst_mask
  ```

  """
  @spec blend(Evision.Detail.FeatherBlender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def blend(self, dst, dst_mask) when (is_struct(dst, Evision.Mat) or is_struct(dst, Nx.Tensor)) and (is_struct(dst_mask, Evision.Mat) or is_struct(dst_mask, Nx.Tensor))
  do
    positional = [
      dst: Evision.Internal.Structurise.from_struct(dst),
      dst_mask: Evision.Internal.Structurise.from_struct(dst_mask)
    ]
    :evision_nif.detail_detail_FeatherBlender_blend(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **masks**: `[Evision.Mat]`
  - **corners**: `[Point]`

  ##### Return
  - **retval**: `Rect`
  - **weight_maps**: `[Evision.Mat]`


  Python prototype (for reference): 
  ```python3
  createWeightMaps(masks, corners, weight_maps) -> retval, weight_maps
  ```

  """
  @spec createWeightMaps(Evision.Detail.FeatherBlender.t(), list(Evision.Mat.maybe_mat_in()), list({number(), number()}), list(Evision.Mat.maybe_mat_in())) :: {{number(), number(), number(), number()}, list(Evision.Mat.t())} | {:error, String.t()}
  def createWeightMaps(self, masks, corners, weight_maps) when is_list(masks) and is_list(corners) and is_list(weight_maps)
  do
    positional = [
      masks: Evision.Internal.Structurise.from_struct(masks),
      corners: Evision.Internal.Structurise.from_struct(corners),
      weight_maps: Evision.Internal.Structurise.from_struct(weight_maps)
    ]
    :evision_nif.detail_detail_FeatherBlender_createWeightMaps(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **img**: `Evision.Mat`
  - **mask**: `Evision.Mat`
  - **tl**: `Point`



  Python prototype (for reference): 
  ```python3
  feed(img, mask, tl) -> None
  ```

  """
  @spec feed(Evision.Detail.FeatherBlender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: :ok | {:error, String.t()}
  def feed(self, img, mask, tl) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_tuple(tl)
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      mask: Evision.Internal.Structurise.from_struct(mask),
      tl: Evision.Internal.Structurise.from_struct(tl)
    ]
    :evision_nif.detail_detail_FeatherBlender_feed(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dst_roi**: `Rect`



  Python prototype (for reference): 
  ```python3
  prepare(dst_roi) -> None
  ```

  """
  @spec prepare(Evision.Detail.FeatherBlender.t(), {number(), number(), number(), number()}) :: :ok | {:error, String.t()}
  def prepare(self, dst_roi) when is_tuple(dst_roi)
  do
    positional = [
      dst_roi: Evision.Internal.Structurise.from_struct(dst_roi)
    ]
    :evision_nif.detail_detail_FeatherBlender_prepare(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`



  Python prototype (for reference): 
  ```python3
  setSharpness(val) -> None
  ```

  """
  @spec setSharpness(Evision.Detail.FeatherBlender.t(), number()) :: :ok | {:error, String.t()}
  def setSharpness(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.detail_detail_FeatherBlender_setSharpness(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  sharpness() -> retval
  ```

  """
  @spec sharpness(Evision.Detail.FeatherBlender.t()) :: number() | {:error, String.t()}
  def sharpness(self) do
    positional = [
    ]
    :evision_nif.detail_detail_FeatherBlender_sharpness(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
