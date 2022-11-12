defmodule Evision.CUDA.BufferPool do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA.BufferPool` struct.

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
  def __to_struct__({:ok, %{class: :"CUDA.BufferPool", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"CUDA.BufferPool", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **stream**: `Evision.CUDA.Stream`

  ##### Return
  - **self**: `Evision.CUDA.BufferPool`


  Python prototype (for reference): 
  ```python3
  BufferPool(stream) -> <cuda_BufferPool object>
  ```

  """
  @spec bufferPool(Evision.CUDA.Stream.t()) :: Evision.CUDA.BufferPool.t() | {:error, String.t()}
  def bufferPool(stream) when is_struct(stream, Evision.CUDA.Stream)
  do
    positional = [
      stream: Evision.Internal.Structurise.from_struct(stream)
    ]
    :evision_nif.cuda_cuda_BufferPool_BufferPool(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Ptr<GpuMat::Allocator>`


  Python prototype (for reference): 
  ```python3
  getAllocator() -> retval
  ```

  """
  @spec getAllocator(Evision.CUDA.BufferPool.t()) :: reference() | {:error, String.t()}
  def getAllocator(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_BufferPool_getAllocator(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  getBuffer(rows, cols, type) -> retval
  ```

  """
  @spec getBuffer(Evision.CUDA.BufferPool.t(), integer(), integer(), integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def getBuffer(self, rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_BufferPool_getBuffer(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Return
  - **retval**: `Evision.CUDA.GpuMat`


  Python prototype (for reference): 
  ```python3
  getBuffer(size, type) -> retval
  ```

  """
  @spec getBuffer(Evision.CUDA.BufferPool.t(), {number(), number()}, integer()) :: Evision.CUDA.GpuMat.t() | {:error, String.t()}
  def getBuffer(self, size, type) when is_tuple(size) and is_integer(type)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_cuda_BufferPool_getBuffer(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
