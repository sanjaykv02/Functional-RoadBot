defmodule Evision.AlignMTB do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.AlignMTB` struct.

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
  def __to_struct__({:ok, %{class: :AlignMTB, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :AlignMTB, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Calculates shift between two images, i. e. how to shift the second image to correspond it with the
  first.


  ##### Positional Arguments
  - **img0**: `Evision.Mat`.

    first image

  - **img1**: `Evision.Mat`.

    second image


  ##### Return
  - **retval**: `Point`



  Python prototype (for reference): 
  ```python3
  calculateShift(img0, img1) -> retval
  ```

  """
  @spec calculateShift(Evision.AlignMTB.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {number(), number()} | {:error, String.t()}
  def calculateShift(self, img0, img1) when (is_struct(img0, Evision.Mat) or is_struct(img0, Nx.Tensor)) and (is_struct(img1, Evision.Mat) or is_struct(img1, Nx.Tensor))
  do
    positional = [
      img0: Evision.Internal.Structurise.from_struct(img0),
      img1: Evision.Internal.Structurise.from_struct(img1)
    ]
    :evision_nif.alignMTB_calculateShift(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Computes median threshold and exclude bitmaps of given image.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    input image


  ##### Return
  - **tb**: `Evision.Mat`.

    median threshold bitmap

  - **eb**: `Evision.Mat`.

    exclude bitmap




  Python prototype (for reference): 
  ```python3
  computeBitmaps(img[, tb[, eb]]) -> tb, eb
  ```

  """
  @spec computeBitmaps(Evision.AlignMTB.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def computeBitmaps(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.alignMTB_computeBitmaps(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes median threshold and exclude bitmaps of given image.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    input image


  ##### Return
  - **tb**: `Evision.Mat`.

    median threshold bitmap

  - **eb**: `Evision.Mat`.

    exclude bitmap




  Python prototype (for reference): 
  ```python3
  computeBitmaps(img[, tb[, eb]]) -> tb, eb
  ```

  """
  @spec computeBitmaps(Evision.AlignMTB.t(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def computeBitmaps(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.alignMTB_computeBitmaps(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getCut() -> retval
  ```

  """
  @spec getCut(Evision.AlignMTB.t()) :: boolean() | {:error, String.t()}
  def getCut(self) do
    positional = [
    ]
    :evision_nif.alignMTB_getCut(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getExcludeRange() -> retval
  ```

  """
  @spec getExcludeRange(Evision.AlignMTB.t()) :: integer() | {:error, String.t()}
  def getExcludeRange(self) do
    positional = [
    ]
    :evision_nif.alignMTB_getExcludeRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMaxBits() -> retval
  ```

  """
  @spec getMaxBits(Evision.AlignMTB.t()) :: integer() | {:error, String.t()}
  def getMaxBits(self) do
    positional = [
    ]
    :evision_nif.alignMTB_getMaxBits(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **dst**: `[Evision.Mat]`
  - **times**: `Evision.Mat`
  - **response**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  process(src, dst, times, response) -> None
  ```

  """
  @spec process(Evision.AlignMTB.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def process(self, src, dst, times, response) when is_list(src) and is_list(dst) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      dst: Evision.Internal.Structurise.from_struct(dst),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.alignMTB_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Short version of process, that doesn't take extra arguments.

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images

  - **dst**: `[Evision.Mat]`.

    vector of aligned images





  Python prototype (for reference): 
  ```python3
  process(src, dst) -> None
  ```

  """
  @spec process(Evision.AlignMTB.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def process(self, src, dst) when is_list(src) and is_list(dst)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      dst: Evision.Internal.Structurise.from_struct(dst)
    ]
    :evision_nif.alignMTB_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **value**: `bool`



  Python prototype (for reference): 
  ```python3
  setCut(value) -> None
  ```

  """
  @spec setCut(Evision.AlignMTB.t(), boolean()) :: :ok | {:error, String.t()}
  def setCut(self, value) when is_boolean(value)
  do
    positional = [
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.alignMTB_setCut(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **exclude_range**: `int`



  Python prototype (for reference): 
  ```python3
  setExcludeRange(exclude_range) -> None
  ```

  """
  @spec setExcludeRange(Evision.AlignMTB.t(), integer()) :: :ok | {:error, String.t()}
  def setExcludeRange(self, exclude_range) when is_integer(exclude_range)
  do
    positional = [
      exclude_range: Evision.Internal.Structurise.from_struct(exclude_range)
    ]
    :evision_nif.alignMTB_setExcludeRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **max_bits**: `int`



  Python prototype (for reference): 
  ```python3
  setMaxBits(max_bits) -> None
  ```

  """
  @spec setMaxBits(Evision.AlignMTB.t(), integer()) :: :ok | {:error, String.t()}
  def setMaxBits(self, max_bits) when is_integer(max_bits)
  do
    positional = [
      max_bits: Evision.Internal.Structurise.from_struct(max_bits)
    ]
    :evision_nif.alignMTB_setMaxBits(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Helper function, that shift Mat filling new regions with zeros.

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    input image

  - **shift**: `Point`.

    shift value


  ##### Return
  - **dst**: `Evision.Mat`.

    result image




  Python prototype (for reference): 
  ```python3
  shiftMat(src, shift[, dst]) -> dst
  ```

  """
  @spec shiftMat(Evision.AlignMTB.t(), Evision.Mat.maybe_mat_in(), {number(), number()}, [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def shiftMat(self, src, shift, opts) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor)) and is_tuple(shift) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      shift: Evision.Internal.Structurise.from_struct(shift)
    ]
    :evision_nif.alignMTB_shiftMat(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Helper function, that shift Mat filling new regions with zeros.

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    input image

  - **shift**: `Point`.

    shift value


  ##### Return
  - **dst**: `Evision.Mat`.

    result image




  Python prototype (for reference): 
  ```python3
  shiftMat(src, shift[, dst]) -> dst
  ```

  """
  @spec shiftMat(Evision.AlignMTB.t(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: Evision.Mat.t() | {:error, String.t()}
  def shiftMat(self, src, shift) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor)) and is_tuple(shift)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      shift: Evision.Internal.Structurise.from_struct(shift)
    ]
    :evision_nif.alignMTB_shiftMat(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
