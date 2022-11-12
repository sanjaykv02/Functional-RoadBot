defmodule Evision.CUDA do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA` struct.

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
  def __to_struct__({:ok, %{class: :CUDA, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :CUDA, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Creates a continuous matrix.

  ##### Positional Arguments
  - **rows**: `int`.

    Row count.

  - **cols**: `int`.

    Column count.

  - **type**: `int`.

    Type of the matrix.


  ##### Return
  - **arr**: `Evision.Mat`.

    Destination matrix. This parameter changes only if it has a proper type and area (
    \\f$\\texttt{rows} \\times \\texttt{cols}\\f$ ).



  Matrix is called continuous if its elements are stored continuously, that is, without gaps at the
  end of each row.


  Python prototype (for reference): 
  ```python3
  createContinuous(rows, cols, type[, arr]) -> arr
  ```

  """
  @spec createContinuous(integer(), integer(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def createContinuous(rows, cols, type, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_createContinuous(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates a continuous matrix.

  ##### Positional Arguments
  - **rows**: `int`.

    Row count.

  - **cols**: `int`.

    Column count.

  - **type**: `int`.

    Type of the matrix.


  ##### Return
  - **arr**: `Evision.Mat`.

    Destination matrix. This parameter changes only if it has a proper type and area (
    \\f$\\texttt{rows} \\times \\texttt{cols}\\f$ ).



  Matrix is called continuous if its elements are stored continuously, that is, without gaps at the
  end of each row.


  Python prototype (for reference): 
  ```python3
  createContinuous(rows, cols, type[, arr]) -> arr
  ```

  """
  @spec createContinuous(integer(), integer(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def createContinuous(rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_createContinuous(positional)
    |> __to_struct__()
  end

  @doc """
  Ensures that the size of a matrix is big enough and the matrix has a proper type.

  ##### Positional Arguments
  - **rows**: `int`.

    Minimum desired number of rows.

  - **cols**: `int`.

    Minimum desired number of columns.

  - **type**: `int`.

    Desired matrix type.


  ##### Return
  - **arr**: `Evision.Mat`.

    Destination matrix.



  The function does not reallocate memory if the matrix has proper attributes already.


  Python prototype (for reference): 
  ```python3
  ensureSizeIsEnough(rows, cols, type[, arr]) -> arr
  ```

  """
  @spec ensureSizeIsEnough(integer(), integer(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def ensureSizeIsEnough(rows, cols, type, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_ensureSizeIsEnough(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Ensures that the size of a matrix is big enough and the matrix has a proper type.

  ##### Positional Arguments
  - **rows**: `int`.

    Minimum desired number of rows.

  - **cols**: `int`.

    Minimum desired number of columns.

  - **type**: `int`.

    Desired matrix type.


  ##### Return
  - **arr**: `Evision.Mat`.

    Destination matrix.



  The function does not reallocate memory if the matrix has proper attributes already.


  Python prototype (for reference): 
  ```python3
  ensureSizeIsEnough(rows, cols, type[, arr]) -> arr
  ```

  """
  @spec ensureSizeIsEnough(integer(), integer(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def ensureSizeIsEnough(rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.cuda_ensureSizeIsEnough(positional)
    |> __to_struct__()
  end

  @doc """
  Returns the number of installed CUDA-enabled devices.
  ##### Return
  - **retval**: `int`

  Use this function before any other CUDA functions calls. If OpenCV is compiled without CUDA support,
  this function returns 0. If the CUDA driver is not installed, or is incompatible, this function
  returns -1.

  Python prototype (for reference): 
  ```python3
  getCudaEnabledDeviceCount() -> retval
  ```

  """
  @spec getCudaEnabledDeviceCount() :: integer() | {:error, String.t()}
  def getCudaEnabledDeviceCount() do
    positional = [
    ]
    :evision_nif.cuda_getCudaEnabledDeviceCount(positional)
    |> __to_struct__()
  end

  @doc """
  Returns the current device index set by cuda::setDevice or initialized by default.
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getDevice() -> retval
  ```

  """
  @spec getDevice() :: integer() | {:error, String.t()}
  def getDevice() do
    positional = [
    ]
    :evision_nif.cuda_getDevice(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **device**: `int`



  Python prototype (for reference): 
  ```python3
  printCudaDeviceInfo(device) -> None
  ```

  """
  @spec printCudaDeviceInfo(integer()) :: :ok | {:error, String.t()}
  def printCudaDeviceInfo(device) when is_integer(device)
  do
    positional = [
      device: Evision.Internal.Structurise.from_struct(device)
    ]
    :evision_nif.cuda_printCudaDeviceInfo(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **device**: `int`



  Python prototype (for reference): 
  ```python3
  printShortCudaDeviceInfo(device) -> None
  ```

  """
  @spec printShortCudaDeviceInfo(integer()) :: :ok | {:error, String.t()}
  def printShortCudaDeviceInfo(device) when is_integer(device)
  do
    positional = [
      device: Evision.Internal.Structurise.from_struct(device)
    ]
    :evision_nif.cuda_printShortCudaDeviceInfo(positional)
    |> __to_struct__()
  end

  @doc """
  Page-locks the memory of matrix and maps it for the device(s).

  ##### Positional Arguments
  - **m**: `Evision.Mat`.

    Input matrix.





  Python prototype (for reference): 
  ```python3
  registerPageLocked(m) -> None
  ```

  """
  @spec registerPageLocked(Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def registerPageLocked(m) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor))
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.cuda_registerPageLocked(positional)
    |> __to_struct__()
  end

  @doc """
  Explicitly destroys and cleans up all resources associated with the current device in the current
  process.


  Any subsequent API call to this device will reinitialize the device.

  Python prototype (for reference): 
  ```python3
  resetDevice() -> None
  ```

  """
  @spec resetDevice() :: :ok | {:error, String.t()}
  def resetDevice() do
    positional = [
    ]
    :evision_nif.cuda_resetDevice(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **deviceId**: `int`
  - **stackSize**: `size_t`
  - **stackCount**: `int`



  Python prototype (for reference): 
  ```python3
  setBufferPoolConfig(deviceId, stackSize, stackCount) -> None
  ```

  """
  @spec setBufferPoolConfig(integer(), integer(), integer()) :: :ok | {:error, String.t()}
  def setBufferPoolConfig(deviceId, stackSize, stackCount) when is_integer(deviceId) and is_integer(stackSize) and is_integer(stackCount)
  do
    positional = [
      deviceId: Evision.Internal.Structurise.from_struct(deviceId),
      stackSize: Evision.Internal.Structurise.from_struct(stackSize),
      stackCount: Evision.Internal.Structurise.from_struct(stackCount)
    ]
    :evision_nif.cuda_setBufferPoolConfig(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **on**: `bool`



  Python prototype (for reference): 
  ```python3
  setBufferPoolUsage(on) -> None
  ```

  """
  @spec setBufferPoolUsage(boolean()) :: :ok | {:error, String.t()}
  def setBufferPoolUsage(on) when is_boolean(on)
  do
    positional = [
      on: Evision.Internal.Structurise.from_struct(on)
    ]
    :evision_nif.cuda_setBufferPoolUsage(positional)
    |> __to_struct__()
  end

  @doc """
  Sets a device and initializes it for the current thread.

  ##### Positional Arguments
  - **device**: `int`.

    System index of a CUDA device starting with 0.




  If the call of this function is omitted, a default device is initialized at the fist CUDA usage.

  Python prototype (for reference): 
  ```python3
  setDevice(device) -> None
  ```

  """
  @spec setDevice(integer()) :: :ok | {:error, String.t()}
  def setDevice(device) when is_integer(device)
  do
    positional = [
      device: Evision.Internal.Structurise.from_struct(device)
    ]
    :evision_nif.cuda_setDevice(positional)
    |> __to_struct__()
  end

  @doc """
  Unmaps the memory of matrix and makes it pageable again.

  ##### Positional Arguments
  - **m**: `Evision.Mat`.

    Input matrix.





  Python prototype (for reference): 
  ```python3
  unregisterPageLocked(m) -> None
  ```

  """
  @spec unregisterPageLocked(Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def unregisterPageLocked(m) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor))
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.cuda_unregisterPageLocked(positional)
    |> __to_struct__()
  end
end
