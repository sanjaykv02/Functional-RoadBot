defmodule Evision.CUDA.HostMem do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA.HostMem` struct.

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
  def __to_struct__({:ok, %{class: :"CUDA.HostMem", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"CUDA.HostMem", ref: ref}) do
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

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(rows, cols, type[, alloc_type]) -> <cuda_HostMem object>
  ```

  """
  @spec hostMem(integer(), integer(), integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(rows, cols, type, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(rows, cols, type[, alloc_type]) -> <cuda_HostMem object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(size, type[, alloc_type]) -> <cuda_HostMem object>
  ```


  """
  @spec hostMem({number(), number()}, integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(size, type, opts) when is_tuple(size) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec hostMem(integer(), integer(), integer()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(size, type[, alloc_type]) -> <cuda_HostMem object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **arr**: `Evision.Mat`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(arr[, alloc_type]) -> <cuda_HostMem object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(arr[, alloc_type]) -> <cuda_HostMem object>
  ```


  """
  @spec hostMem(Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(arr, opts) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec hostMem(Evision.CUDA.GpuMat.t(), [{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(arr, opts) when is_struct(arr, Evision.CUDA.GpuMat) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec hostMem({number(), number()}, integer()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(size, type) when is_tuple(size) and is_integer(type)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **arr**: `Evision.Mat`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(arr[, alloc_type]) -> <cuda_HostMem object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **arr**: `Evision.CUDA.GpuMat`

  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem(arr[, alloc_type]) -> <cuda_HostMem object>
  ```

  #### Variant 3:
  
  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem([, alloc_type]) -> <cuda_HostMem object>
  ```


  """
  @spec hostMem([{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec hostMem(Evision.Mat.maybe_mat_in()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(arr) when (is_struct(arr, Evision.Mat) or is_struct(arr, Nx.Tensor))
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional)
    |> __to_struct__()
  end
  @spec hostMem(Evision.CUDA.GpuMat.t()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem(arr) when is_struct(arr, Evision.CUDA.GpuMat)
  do
    positional = [
      arr: Evision.Internal.Structurise.from_struct(arr)
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **alloc_type**: `HostMem_AllocType`.

  ##### Return
  - **self**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  HostMem([, alloc_type]) -> <cuda_HostMem object>
  ```

  """
  @spec hostMem() :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def hostMem() do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_HostMem(positional)
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
  @spec channels(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def channels(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_channels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.CUDA.HostMem`


  Python prototype (for reference): 
  ```python3
  clone() -> retval
  ```

  """
  @spec clone(Evision.CUDA.HostMem.t()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def clone(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_clone(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec create(Evision.CUDA.HostMem.t(), integer(), integer(), integer()) :: :ok | {:error, String.t()}
  def create(self, rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_HostMem_create(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  createMatHeader() -> retval
  ```

  """
  @spec createMatHeader(Evision.CUDA.HostMem.t()) :: Evision.Mat.t() | {:error, String.t()}
  def createMatHeader(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_createMatHeader(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec depth(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def depth(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_depth(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec elemSize(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def elemSize(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_elemSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec elemSize1(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def elemSize1(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_elemSize1(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec empty(Evision.CUDA.HostMem.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Maps CPU memory to GPU address space and creates the cuda::GpuMat header without reference counting
  for it.

  ##### Return
  - **retval**: `bool`

  This can be done only if memory was allocated with the SHARED flag and if it is supported by the
  hardware. Laptops often share video and CPU memory, so address spaces can be mapped, which
  eliminates an extra copy.

  Python prototype (for reference): 
  ```python3
  isContinuous() -> retval
  ```

  """
  @spec isContinuous(Evision.CUDA.HostMem.t()) :: boolean() | {:error, String.t()}
  def isContinuous(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_isContinuous(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cn**: `int`

  ##### Keyword Arguments
  - **rows**: `int`.

  ##### Return
  - **retval**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  reshape(cn[, rows]) -> retval
  ```

  """
  @spec reshape(Evision.CUDA.HostMem.t(), integer(), [{atom(), term()},...] | nil) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def reshape(self, cn, opts) when is_integer(cn) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      cn: Evision.Internal.Structurise.from_struct(cn)
    ]
    :evision_nif.cuda_cuda_HostMem_reshape(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cn**: `int`

  ##### Keyword Arguments
  - **rows**: `int`.

  ##### Return
  - **retval**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  reshape(cn[, rows]) -> retval
  ```

  """
  @spec reshape(Evision.CUDA.HostMem.t(), integer()) :: Evision.CUDA.HostMem.t() | {:error, String.t()}
  def reshape(self, cn) when is_integer(cn)
  do
    positional = [
      cn: Evision.Internal.Structurise.from_struct(cn)
    ]
    :evision_nif.cuda_cuda_HostMem_reshape(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec size(Evision.CUDA.HostMem.t()) :: {number(), number()} | {:error, String.t()}
  def size(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_size(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec step1(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def step1(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_step1(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **b**: `Evision.CUDA.HostMem`



  Python prototype (for reference): 
  ```python3
  swap(b) -> None
  ```

  """
  @spec swap(Evision.CUDA.HostMem.t(), Evision.CUDA.HostMem.t()) :: :ok | {:error, String.t()}
  def swap(self, b) when is_struct(b, Evision.CUDA.HostMem)
  do
    positional = [
      b: Evision.Internal.Structurise.from_struct(b)
    ]
    :evision_nif.cuda_cuda_HostMem_swap(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec type(Evision.CUDA.HostMem.t()) :: integer() | {:error, String.t()}
  def type(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_HostMem_type(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec get_step(Evision.CUDA.HostMem.t()) :: integer()
  def get_step(self) do
    :evision_nif.cuda_HostMem_get_step(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
end
