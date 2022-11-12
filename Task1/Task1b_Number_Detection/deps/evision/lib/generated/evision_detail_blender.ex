defmodule Evision.Detail.Blender do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.Blender` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.Blender", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.Blender", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Blends and returns the final pano.
  ##### Return
  - **dst**: `Evision.Mat`.

    Final pano

  - **dst_mask**: `Evision.Mat`.

    Final pano mask




  Python prototype (for reference): 
  ```python3
  blend(dst, dst_mask) -> dst, dst_mask
  ```

  """
  @spec blend(Evision.Detail.Blender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def blend(self, dst, dst_mask) when (is_struct(dst, Evision.Mat) or is_struct(dst, Nx.Tensor)) and (is_struct(dst_mask, Evision.Mat) or is_struct(dst_mask, Nx.Tensor))
  do
    positional = [
      dst: Evision.Internal.Structurise.from_struct(dst),
      dst_mask: Evision.Internal.Structurise.from_struct(dst_mask)
    ]
    :evision_nif.detail_detail_Blender_blend(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **type**: `int`

  ##### Keyword Arguments
  - **try_gpu**: `bool`.

  ##### Return
  - **retval**: `Evision.Detail.Blender`



  Python prototype (for reference): 
  ```python3
  createDefault(type[, try_gpu]) -> retval
  ```

  """
  @spec createDefault(integer(), [{atom(), term()},...] | nil) :: Evision.Detail.Blender.t() | {:error, String.t()}
  def createDefault(type, opts) when is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.detail_detail_Blender_createDefault_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **type**: `int`

  ##### Keyword Arguments
  - **try_gpu**: `bool`.

  ##### Return
  - **retval**: `Evision.Detail.Blender`



  Python prototype (for reference): 
  ```python3
  createDefault(type[, try_gpu]) -> retval
  ```

  """
  @spec createDefault(integer()) :: Evision.Detail.Blender.t() | {:error, String.t()}
  def createDefault(type) when is_integer(type)
  do
    positional = [
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.detail_detail_Blender_createDefault_static(positional)
    |> __to_struct__()
  end

  @doc """
  Processes the image.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Source image

  - **mask**: `Evision.Mat`.

    Source image mask

  - **tl**: `Point`.

    Source image top-left corners





  Python prototype (for reference): 
  ```python3
  feed(img, mask, tl) -> None
  ```

  """
  @spec feed(Evision.Detail.Blender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: :ok | {:error, String.t()}
  def feed(self, img, mask, tl) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_tuple(tl)
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      mask: Evision.Internal.Structurise.from_struct(mask),
      tl: Evision.Internal.Structurise.from_struct(tl)
    ]
    :evision_nif.detail_detail_Blender_feed(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Prepares the blender for blending.

  ##### Positional Arguments
  - **corners**: `[Point]`.

    Source images top-left corners

  - **sizes**: `[Size]`.

    Source image sizes





  Python prototype (for reference): 
  ```python3
  prepare(corners, sizes) -> None
  ```

  """
  @spec prepare(Evision.Detail.Blender.t(), list({number(), number()}), list({number(), number()})) :: :ok | {:error, String.t()}
  def prepare(self, corners, sizes) when is_list(corners) and is_list(sizes)
  do
    positional = [
      corners: Evision.Internal.Structurise.from_struct(corners),
      sizes: Evision.Internal.Structurise.from_struct(sizes)
    ]
    :evision_nif.detail_detail_Blender_prepare(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dst_roi**: `Rect`


  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  prepare(dst_roi) -> None
  ```

  """
  @spec prepare(Evision.Detail.Blender.t(), {number(), number(), number(), number()}) :: :ok | {:error, String.t()}
  def prepare(self, dst_roi) when is_tuple(dst_roi)
  do
    positional = [
      dst_roi: Evision.Internal.Structurise.from_struct(dst_roi)
    ]
    :evision_nif.detail_detail_Blender_prepare(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
