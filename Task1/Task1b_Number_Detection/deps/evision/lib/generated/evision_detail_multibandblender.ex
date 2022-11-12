defmodule Evision.Detail.MultiBandBlender do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.MultiBandBlender` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.MultiBandBlender", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.MultiBandBlender", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **try_gpu**: `int`.
  - **num_bands**: `int`.
  - **weight_type**: `int`.

  ##### Return
  - **self**: `Evision.Detail.MultiBandBlender`



  Python prototype (for reference): 
  ```python3
  MultiBandBlender([, try_gpu[, num_bands[, weight_type]]]) -> <detail_MultiBandBlender object>
  ```

  """
  @spec multiBandBlender([{atom(), term()},...] | nil) :: Evision.Detail.MultiBandBlender.t() | {:error, String.t()}
  def multiBandBlender(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_MultiBandBlender_MultiBandBlender(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **try_gpu**: `int`.
  - **num_bands**: `int`.
  - **weight_type**: `int`.

  ##### Return
  - **self**: `Evision.Detail.MultiBandBlender`



  Python prototype (for reference): 
  ```python3
  MultiBandBlender([, try_gpu[, num_bands[, weight_type]]]) -> <detail_MultiBandBlender object>
  ```

  """
  @spec multiBandBlender() :: Evision.Detail.MultiBandBlender.t() | {:error, String.t()}
  def multiBandBlender() do
    positional = [
    ]
    :evision_nif.detail_detail_MultiBandBlender_MultiBandBlender(positional)
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
  @spec blend(Evision.Detail.MultiBandBlender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def blend(self, dst, dst_mask) when (is_struct(dst, Evision.Mat) or is_struct(dst, Nx.Tensor)) and (is_struct(dst_mask, Evision.Mat) or is_struct(dst_mask, Nx.Tensor))
  do
    positional = [
      dst: Evision.Internal.Structurise.from_struct(dst),
      dst_mask: Evision.Internal.Structurise.from_struct(dst_mask)
    ]
    :evision_nif.detail_detail_MultiBandBlender_blend(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec feed(Evision.Detail.MultiBandBlender.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: :ok | {:error, String.t()}
  def feed(self, img, mask, tl) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_tuple(tl)
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      mask: Evision.Internal.Structurise.from_struct(mask),
      tl: Evision.Internal.Structurise.from_struct(tl)
    ]
    :evision_nif.detail_detail_MultiBandBlender_feed(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  numBands() -> retval
  ```

  """
  @spec numBands(Evision.Detail.MultiBandBlender.t()) :: integer() | {:error, String.t()}
  def numBands(self) do
    positional = [
    ]
    :evision_nif.detail_detail_MultiBandBlender_numBands(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec prepare(Evision.Detail.MultiBandBlender.t(), {number(), number(), number(), number()}) :: :ok | {:error, String.t()}
  def prepare(self, dst_roi) when is_tuple(dst_roi)
  do
    positional = [
      dst_roi: Evision.Internal.Structurise.from_struct(dst_roi)
    ]
    :evision_nif.detail_detail_MultiBandBlender_prepare(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`



  Python prototype (for reference): 
  ```python3
  setNumBands(val) -> None
  ```

  """
  @spec setNumBands(Evision.Detail.MultiBandBlender.t(), integer()) :: :ok | {:error, String.t()}
  def setNumBands(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.detail_detail_MultiBandBlender_setNumBands(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
