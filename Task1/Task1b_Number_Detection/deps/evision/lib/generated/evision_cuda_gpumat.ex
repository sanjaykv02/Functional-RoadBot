defmodule Evision.CUDA.GpuMat do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA.GpuMat` struct.

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
  def __to_struct__({:ok, %{class: :"CUDA.GpuMat", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"CUDA.GpuMat", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(rows, cols, type, s[, allocator]) -> <cuda_GpuMat object>
  ```

  """
  @spec gpuMat(integer(), integer(), integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(rows, cols, type, s, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and is_tuple(s) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(rows, cols, type, s[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(size, type, s[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(rows, cols, type[, allocator]) -> <cuda_GpuMat object>
  ```


  """
  @spec gpuMat({number(), number()}, integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(size, type, s, opts) when is_tuple(size) and is_integer(type) and is_tuple(s) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(integer(), integer(), integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(rows, cols, type, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(integer(), integer(), integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(rows, cols, type, s) when is_integer(rows) and is_integer(cols) and is_integer(type) and is_tuple(s)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **m**: `Evision.CUDA.GpuMat`
  - **rowRange**: `Range`
  - **colRange**: `Range`

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  GpuMat(m, rowRange, colRange) -> <cuda_GpuMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(size, type, s[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(rows, cols, type[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 4:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(size, type[, allocator]) -> <cuda_GpuMat object>
  ```


  """
  @spec gpuMat({number(), number()}, integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(size, type, opts) when is_tuple(size) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(Evision.CUDA.GpuMat.t(), {integer(), integer()} | :all, {integer(), integer()} | :all) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(m, rowRange, colRange) when is_struct(m, Evision.CUDA.GpuMat) and (is_tuple(rowRange) or rowRange == :all) and (is_tuple(colRange) or colRange == :all)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      rowRange: Evision.Internal.Structurise.from_struct(rowRange),
      colRange: Evision.Internal.Structurise.from_struct(colRange)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end
  @spec gpuMat({number(), number()}, integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(size, type, s) when is_tuple(size) and is_integer(type) and is_tuple(s)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end
  @spec gpuMat(integer(), integer(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **m**: `Evision.CUDA.GpuMat`
  - **roi**: `Rect`

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  GpuMat(m, roi) -> <cuda_GpuMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(size, type[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **arr**: `Evision.Mat`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(arr[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 4:
  

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(arr[, allocator]) -> <cuda_GpuMat object>
  ```


  """
  @spec gpuMat(Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(arr, opts) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(Evision.CUDA.GpuMat.t(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(arr, opts) when is_struct(arr, Evision.CUDA.GpuMat) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(Evision.CUDA.GpuMat.t(), {number(), number(), number(), number()}) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(m, roi) when is_struct(m, Evision.CUDA.GpuMat) and is_tuple(roi)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      roi: Evision.Internal.Structurise.from_struct(roi)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end
  @spec gpuMat({number(), number()}, integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(size, type) when is_tuple(size) and is_integer(type)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **arr**: `Evision.Mat`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(arr[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat(arr[, allocator]) -> <cuda_GpuMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **m**: `Evision.CUDA.GpuMat`

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  GpuMat(m) -> <cuda_GpuMat object>
  ```

  #### Variant 4:
  
  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat([, allocator]) -> <cuda_GpuMat object>
  ```


  """
  @spec gpuMat([{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec gpuMat(Evision.Mat.maybe_mat_in()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(arr) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end
  @spec gpuMat(Evision.CUDA.GpuMat.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(arr) when is_struct(arr, Evision.CUDA.GpuMat)
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end
  @spec gpuMat(Evision.CUDA.GpuMat.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat(m) when is_struct(m, Evision.CUDA.GpuMat)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **allocator**: `GpuMat_Allocator*`.

  ##### Return
  - **self**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  GpuMat([, allocator]) -> <cuda_GpuMat object>
  ```

  """
  @spec gpuMat() :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def gpuMat() do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_GpuMat(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dtop**: `int`
  - **dbottom**: `int`
  - **dleft**: `int`
  - **dright**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  adjustROI(dtop, dbottom, dleft, dright) -> retval
  ```

  """
  @spec adjustROI(Evision.CUDA.GpuMat.t(), integer(), integer(), integer(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def adjustROI(self, dtop, dbottom, dleft, dright) when is_integer(dtop) and is_integer(dbottom) and is_integer(dleft) and is_integer(dright)
  do
    positional = [
      dtop: Evision.Internal.Structurise.from_struct(dtop),
      dbottom: Evision.Internal.Structurise.from_struct(dbottom),
      dleft: Evision.Internal.Structurise.from_struct(dleft),
      dright: Evision.Internal.Structurise.from_struct(dright)
    ]
    :evision_nif.cuda_cuda_GpuMat_adjustROI(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **m**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **type**: `int`.




  Python prototype (for reference): 
  ```python3
  assignTo(m[, type]) -> None
  ```

  """
  @spec assignTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def assignTo(self, m, opts) when is_struct(m, Evision.CUDA.GpuMat) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.cuda_cuda_GpuMat_assignTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **m**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **type**: `int`.




  Python prototype (for reference): 
  ```python3
  assignTo(m[, type]) -> None
  ```

  """
  @spec assignTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def assignTo(self, m) when is_struct(m, Evision.CUDA.GpuMat)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.cuda_cuda_GpuMat_assignTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  channels() -> retval
  ```

  """
  @spec channels(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def channels(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_channels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  clone() -> retval
  ```

  """
  @spec clone(Evision.CUDA.GpuMat.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def clone(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_clone(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **x**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  col(x) -> retval
  ```

  """
  @spec col(Evision.CUDA.GpuMat.t(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def col(self, x) when is_integer(x)
  do
    positional = [
      x: Evision.Internal.Structurise.from_struct(x)
    ]
    :evision_nif.cuda_cuda_GpuMat_col(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **startcol**: `int`
  - **endcol**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  colRange(startcol, endcol) -> retval
  ```

  """
  @spec colRange(Evision.CUDA.GpuMat.t(), integer(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def colRange(self, startcol, endcol) when is_integer(startcol) and is_integer(endcol)
  do
    positional = [
      startcol: Evision.Internal.Structurise.from_struct(startcol),
      endcol: Evision.Internal.Structurise.from_struct(endcol)
    ]
    :evision_nif.cuda_cuda_GpuMat_colRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **r**: `Range`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  colRange(r) -> retval
  ```

  """
  @spec colRange(Evision.CUDA.GpuMat.t(), {integer(), integer()} | :all) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def colRange(self, r) when (is_tuple(r) or r == :all)
  do
    positional = [
      r: Evision.Internal.Structurise.from_struct(r)
    ]
    :evision_nif.cuda_cuda_GpuMat_colRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`
  - **beta**: `double`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha, beta, stream[, dst]) -> dst
  ```

  """
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number(), number(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha, beta, stream, opts) when is_integer(rtype) and is_number(alpha) and is_number(beta) and is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha),
      beta: Evision.Internal.Structurise.from_struct(beta),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`
  - **beta**: `double`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha, beta, stream[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha, stream[, dst]) -> dst
  ```


  """
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha, stream, opts) when is_integer(rtype) and is_number(alpha) and is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number(), number(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha, beta, stream) when is_integer(rtype) and is_number(alpha) and is_number(beta) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha),
      beta: Evision.Internal.Structurise.from_struct(beta),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha, stream[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`

  ##### Keyword Arguments
  - **beta**: `double`.

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha[, dst[, beta]]) -> dst
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, stream[, dst]) -> dst
  ```


  """
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha, opts) when is_integer(rtype) and is_number(alpha) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, stream, opts) when is_integer(rtype) and is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha, stream) when is_integer(rtype) and is_number(alpha) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **alpha**: `double`

  ##### Keyword Arguments
  - **beta**: `double`.

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, alpha[, dst[, beta]]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **rtype**: `int`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype, stream[, dst]) -> dst
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **rtype**: `int`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype[, dst]) -> dst
  ```


  """
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, opts) when is_integer(rtype) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), number()) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, alpha) when is_integer(rtype) and is_number(alpha)
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      alpha: Evision.Internal.Structurise.from_struct(alpha)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype, stream) when is_integer(rtype) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **rtype**: `int`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  convertTo(rtype[, dst]) -> dst
  ```

  """
  @spec convertTo(Evision.CUDA.GpuMat.t(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def convertTo(self, rtype) when is_integer(rtype)
  do
    positional = [
      rtype: Evision.Internal.Structurise.from_struct(rtype)
    ]
    :evision_nif.cuda_cuda_GpuMat_convertTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **mask**: `Evision.Mat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask, stream[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **mask**: `Evision.CUDA.GpuMat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.CUDA.GpuMat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask, stream[, dst]) -> dst
  ```


  """
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, mask, stream, opts) when (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def copyTo(self, mask, stream, opts) when is_struct(mask, Evision.CUDA.GpuMat) and is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **mask**: `Evision.Mat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask, stream[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **mask**: `Evision.CUDA.GpuMat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.CUDA.GpuMat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask, stream[, dst]) -> dst
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **mask**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask[, dst]) -> dst
  ```

  #### Variant 4:
  

  ##### Positional Arguments
  - **mask**: `Evision.CUDA.GpuMat`

  ##### Return
  - **dst**: `Evision.CUDA.GpuMat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask[, dst]) -> dst
  ```

  #### Variant 5:
  

  ##### Positional Arguments
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(stream[, dst]) -> dst
  ```


  """
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, mask, opts) when (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def copyTo(self, mask, opts) when is_struct(mask, Evision.CUDA.GpuMat) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, stream, opts) when is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, mask, stream) when (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def copyTo(self, mask, stream) when is_struct(mask, Evision.CUDA.GpuMat) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **mask**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **mask**: `Evision.CUDA.GpuMat`

  ##### Return
  - **dst**: `Evision.CUDA.GpuMat`.



  Python prototype (for reference): 
  ```python3
  copyTo(mask[, dst]) -> dst
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo(stream[, dst]) -> dst
  ```


  """
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, mask) when (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def copyTo(self, mask) when is_struct(mask, Evision.CUDA.GpuMat)
  do
    positional = [
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec copyTo(Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self, stream) when is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  copyTo([, dst]) -> dst
  ```

  """
  @spec copyTo(Evision.CUDA.GpuMat.t()) :: Evision.Mat.t() | {:error, String.t()}
  def copyTo(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_copyTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`



  Python prototype (for reference): 
  ```python3
  create(rows, cols, type) -> None
  ```

  """
  @spec create(Evision.CUDA.GpuMat.t(), integer(), integer(), integer()) :: :ok | {:error, String.t()}
  def create(self, rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_create(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`



  Python prototype (for reference): 
  ```python3
  create(size, type) -> None
  ```

  """
  @spec create(Evision.CUDA.GpuMat.t(), {number(), number()}, integer()) :: :ok | {:error, String.t()}
  def create(self, size, type) when is_tuple(size) and is_integer(type)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_GpuMat_create(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `void*`


  Python prototype (for reference): 
  ```python3
  cudaPtr() -> retval
  ```

  """
  @spec cudaPtr(Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def cudaPtr(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_cudaPtr(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `GpuMat::Allocator*`


  Python prototype (for reference): 
  ```python3
  defaultAllocator() -> retval
  ```

  """
  @spec defaultAllocator() :: reference() | {:error, String.t()}
  def defaultAllocator() do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_defaultAllocator_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  depth() -> retval
  ```

  """
  @spec depth(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def depth(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_depth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Performs data download from GpuMat (Non-Blocking call)

  ##### Positional Arguments
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.

  This function copies data from device memory to host memory. As being a non-blocking call, this
  function may return even if the copy operation is not finished.
  The copy operation may be overlapped with operations in other non-default streams if \\p stream is
  not the default stream and \\p dst is HostMem allocated with HostMem::PAGE_LOCKED option.


  Python prototype (for reference): 
  ```python3
  download(stream[, dst]) -> dst
  ```

  """
  @spec download(Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def download(self, stream, opts) when is_struct(stream, Evision.CUDA.Stream) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_download(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs data download from GpuMat (Non-Blocking call)

  ##### Positional Arguments
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **dst**: `Evision.Mat`.

  This function copies data from device memory to host memory. As being a non-blocking call, this
  function may return even if the copy operation is not finished.
  The copy operation may be overlapped with operations in other non-default streams if \\p stream is
  not the default stream and \\p dst is HostMem allocated with HostMem::PAGE_LOCKED option.


  Python prototype (for reference): 
  ```python3
  download(stream[, dst]) -> dst
  ```

  """
  @spec download(Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t()) :: Evision.Mat.t() | {:error, String.t()}
  def download(self, stream) when is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_download(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Performs data download from GpuMat (Blocking call)
  ##### Return
  - **dst**: `Evision.Mat`.

  This function copies data from device memory to host memory. As being a blocking call, it is
  guaranteed that the copy operation is finished when this function returns.


  Python prototype (for reference): 
  ```python3
  download([, dst]) -> dst
  ```

  """
  @spec download(Evision.CUDA.GpuMat.t()) :: Evision.Mat.t() | {:error, String.t()}
  def download(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_download(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  elemSize() -> retval
  ```

  """
  @spec elemSize(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def elemSize(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_elemSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  elemSize1() -> retval
  ```

  """
  @spec elemSize1(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def elemSize1(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_elemSize1(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.CUDA.GpuMat.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isContinuous() -> retval
  ```

  """
  @spec isContinuous(Evision.CUDA.GpuMat.t()) :: boolean() | {:error, String.t()}
  def isContinuous(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_isContinuous(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **wholeSize**: `Size`
  - **ofs**: `Point`



  Python prototype (for reference): 
  ```python3
  locateROI(wholeSize, ofs) -> None
  ```

  """
  @spec locateROI(Evision.CUDA.GpuMat.t(), {number(), number()}, {number(), number()}) :: :ok | {:error, String.t()}
  def locateROI(self, wholeSize, ofs) when is_tuple(wholeSize) and is_tuple(ofs)
  do
    positional = [
      wholeSize: Evision.Internal.Structurise.from_struct(wholeSize),
      ofs: Evision.Internal.Structurise.from_struct(ofs)
    ]
    :evision_nif.cuda_cuda_GpuMat_locateROI(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  release() -> None
  ```

  """
  @spec release(Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def release(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_release(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cn**: `int`

  ##### Keyword Arguments
  - **rows**: `int`.

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  reshape(cn[, rows]) -> retval
  ```

  """
  @spec reshape(Evision.CUDA.GpuMat.t(), integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def reshape(self, cn, opts) when is_integer(cn) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      cn: Evision.Internal.Structurise.from_struct(cn)
    ]
    :evision_nif.cuda_cuda_GpuMat_reshape(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cn**: `int`

  ##### Keyword Arguments
  - **rows**: `int`.

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  reshape(cn[, rows]) -> retval
  ```

  """
  @spec reshape(Evision.CUDA.GpuMat.t(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def reshape(self, cn) when is_integer(cn)
  do
    positional = [
      cn: Evision.Internal.Structurise.from_struct(cn)
    ]
    :evision_nif.cuda_cuda_GpuMat_reshape(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **y**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  row(y) -> retval
  ```

  """
  @spec row(Evision.CUDA.GpuMat.t(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def row(self, y) when is_integer(y)
  do
    positional = [
      y: Evision.Internal.Structurise.from_struct(y)
    ]
    :evision_nif.cuda_cuda_GpuMat_row(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **startrow**: `int`
  - **endrow**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  rowRange(startrow, endrow) -> retval
  ```

  """
  @spec rowRange(Evision.CUDA.GpuMat.t(), integer(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def rowRange(self, startrow, endrow) when is_integer(startrow) and is_integer(endrow)
  do
    positional = [
      startrow: Evision.Internal.Structurise.from_struct(startrow),
      endrow: Evision.Internal.Structurise.from_struct(endrow)
    ]
    :evision_nif.cuda_cuda_GpuMat_rowRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **r**: `Range`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  rowRange(r) -> retval
  ```

  """
  @spec rowRange(Evision.CUDA.GpuMat.t(), {integer(), integer()} | :all) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def rowRange(self, r) when (is_tuple(r) or r == :all)
  do
    positional = [
      r: Evision.Internal.Structurise.from_struct(r)
    ]
    :evision_nif.cuda_cuda_GpuMat_rowRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **allocator**: `GpuMat_Allocator*`



  Python prototype (for reference): 
  ```python3
  setDefaultAllocator(allocator) -> None
  ```

  """
  @spec setDefaultAllocator(reference()) :: :ok | {:error, String.t()}
  def setDefaultAllocator(allocator) when (is_reference(allocator) or is_struct(allocator))
  do
    positional = [
      allocator: Evision.Internal.Structurise.from_struct(allocator)
    ]
    :evision_nif.cuda_cuda_GpuMat_setDefaultAllocator_static(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **s**: `Scalar`
  - **mask**: `Evision.Mat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s, mask, stream) -> retval
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **s**: `Scalar`
  - **mask**: `Evision.CUDA.GpuMat`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s, mask, stream) -> retval
  ```


  """
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, Evision.Mat.maybe_mat_in(), Evision.CUDA.Stream.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s, mask, stream) when is_tuple(s) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s),
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s, mask, stream) when is_tuple(s) and is_struct(mask, Evision.CUDA.GpuMat) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s),
      mask: Evision.Internal.Structurise.from_struct(mask),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **s**: `Scalar`
  - **mask**: `Evision.Mat`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s, mask) -> retval
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **s**: `Scalar`
  - **mask**: `Evision.CUDA.GpuMat`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s, mask) -> retval
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **s**: `Scalar`
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s, stream) -> retval
  ```


  """
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, Evision.Mat.maybe_mat_in()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s, mask) when is_tuple(s) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, Evision.CUDA.GpuMat.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s, mask) when is_tuple(s) and is_struct(mask, Evision.CUDA.GpuMat)
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, Evision.CUDA.Stream.t()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s, stream) when is_tuple(s) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **s**: `Scalar`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  setTo(s) -> retval
  ```

  """
  @spec setTo(Evision.CUDA.GpuMat.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def setTo(self, s) when is_tuple(s)
  do
    positional = [
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.cuda_cuda_GpuMat_setTo(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Size`


  Python prototype (for reference): 
  ```python3
  size() -> retval
  ```

  """
  @spec size(Evision.CUDA.GpuMat.t()) :: {number(), number()} | {:error, String.t()}
  def size(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_size(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  step1() -> retval
  ```

  """
  @spec step1(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def step1(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_step1(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **mat**: `Evision.CUDA.GpuMat`



  Python prototype (for reference): 
  ```python3
  swap(mat) -> None
  ```

  """
  @spec swap(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def swap(self, mat) when is_struct(mat, Evision.CUDA.GpuMat)
  do
    positional = [
      mat: Evision.Internal.Structurise.from_struct(mat)
    ]
    :evision_nif.cuda_cuda_GpuMat_swap(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  type() -> retval
  ```

  """
  @spec type(Evision.CUDA.GpuMat.t()) :: integer() | {:error, String.t()}
  def type(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_type(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  updateContinuityFlag() -> None
  ```

  """
  @spec updateContinuityFlag(Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def updateContinuityFlag(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_GpuMat_updateContinuityFlag(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Performs data upload to GpuMat (Non-Blocking call)

  ##### Positional Arguments
  - **arr**: `Evision.Mat`
  - **stream**: `Evision.CUDA.Stream`


  This function copies data from host memory to device memory. As being a non-blocking call, this
  function may return even if the copy operation is not finished.
  The copy operation may be overlapped with operations in other non-default streams if \\p stream is
  not the default stream and \\p dst is HostMem allocated with HostMem::PAGE_LOCKED option.

  Python prototype (for reference): 
  ```python3
  upload(arr, stream) -> None
  ```

  #### Variant 2:
  Performs data upload to GpuMat (Non-Blocking call)

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`
  - **stream**: `Evision.CUDA.Stream`


  This function copies data from host memory to device memory. As being a non-blocking call, this
  function may return even if the copy operation is not finished.
  The copy operation may be overlapped with operations in other non-default streams if \\p stream is
  not the default stream and \\p dst is HostMem allocated with HostMem::PAGE_LOCKED option.

  Python prototype (for reference): 
  ```python3
  upload(arr, stream) -> None
  ```


  """
  @spec upload(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in(), Evision.CUDA.Stream.t()) :: :ok | {:error, String.t()}
  def upload(self, arr, stream) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor)) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_upload(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec upload(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t(), Evision.CUDA.Stream.t()) :: :ok | {:error, String.t()}
  def upload(self, arr, stream) when is_struct(arr, Evision.CUDA.GpuMat) and is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr),
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_GpuMat_upload(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Performs data upload to GpuMat (Blocking call)

  ##### Positional Arguments
  - **arr**: `Evision.Mat`


  This function copies data from host memory to device memory. As being a blocking call, it is
  guaranteed that the copy operation is finished when this function returns.

  Python prototype (for reference): 
  ```python3
  upload(arr) -> None
  ```

  #### Variant 2:
  Performs data upload to GpuMat (Blocking call)

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`


  This function copies data from host memory to device memory. As being a blocking call, it is
  guaranteed that the copy operation is finished when this function returns.

  Python prototype (for reference): 
  ```python3
  upload(arr) -> None
  ```


  """
  @spec upload(Evision.CUDA.GpuMat.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def upload(self, arr) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_upload(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec upload(Evision.CUDA.GpuMat.t(), Evision.CUDA.GpuMat.t()) :: :ok | {:error, String.t()}
  def upload(self, arr) when is_struct(arr, Evision.CUDA.GpuMat)
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_GpuMat_upload(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec get_step(Evision.CUDA.GpuMat.t()) :: integer()
  def get_step(self) do
    :evision_nif.cuda_GpuMat_get_step(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
end
