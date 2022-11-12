defmodule Evision.CalibrateRobertson do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CalibrateRobertson` struct.

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
  def __to_struct__({:ok, %{class: :CalibrateRobertson, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :CalibrateRobertson, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Clears the algorithm state


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.CalibrateRobertson.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if the Algorithm is empty (e.g. in the very beginning or after unsuccessful read
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.CalibrateRobertson.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`

  Returns the algorithm string identifier.
  This string is used as top level xml/yml node tag when the object is saved to a file or string.

  Python prototype (for reference): 
  ```python3
  getDefaultName() -> retval
  ```

  """
  @spec getDefaultName(Evision.CalibrateRobertson.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMaxIter() -> retval
  ```

  """
  @spec getMaxIter(Evision.CalibrateRobertson.t()) :: integer() | {:error, String.t()}
  def getMaxIter(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_getMaxIter(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getRadiance() -> retval
  ```

  """
  @spec getRadiance(Evision.CalibrateRobertson.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getRadiance(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_getRadiance(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getThreshold() -> retval
  ```

  """
  @spec getThreshold(Evision.CalibrateRobertson.t()) :: number() | {:error, String.t()}
  def getThreshold(self) do
    positional = [
    ]
    :evision_nif.calibrateRobertson_getThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Recovers inverse camera response.

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images

  - **times**: `Evision.Mat`.

    vector of exposure time values for each image


  ##### Return
  - **dst**: `Evision.Mat`.

    256x1 matrix with inverse camera response function




  Python prototype (for reference): 
  ```python3
  process(src, times[, dst]) -> dst
  ```

  """
  @spec process(Evision.CalibrateRobertson.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, opts) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times)
    ]
    :evision_nif.calibrateRobertson_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Recovers inverse camera response.

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images

  - **times**: `Evision.Mat`.

    vector of exposure time values for each image


  ##### Return
  - **dst**: `Evision.Mat`.

    256x1 matrix with inverse camera response function




  Python prototype (for reference): 
  ```python3
  process(src, times[, dst]) -> dst
  ```

  """
  @spec process(Evision.CalibrateRobertson.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times)
    ]
    :evision_nif.calibrateRobertson_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Reads algorithm parameters from a file storage

  ##### Positional Arguments
  - **fn_**: `Evision.FileNode`



  Python prototype (for reference): 
  ```python3
  read(fn_) -> None
  ```

  """
  @spec read(Evision.CalibrateRobertson.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, fn_) when is_struct(fn_, Evision.FileNode)
  do
    positional = [
      fn_: Evision.Internal.Structurise.from_struct(fn_)
    ]
    :evision_nif.calibrateRobertson_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **filename**: `String`


  Saves the algorithm to a file.
  In order to make this method work, the derived class must implement Algorithm::write(FileStorage& fs).

  Python prototype (for reference): 
  ```python3
  save(filename) -> None
  ```

  """
  @spec save(Evision.CalibrateRobertson.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.calibrateRobertson_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **max_iter**: `int`



  Python prototype (for reference): 
  ```python3
  setMaxIter(max_iter) -> None
  ```

  """
  @spec setMaxIter(Evision.CalibrateRobertson.t(), integer()) :: :ok | {:error, String.t()}
  def setMaxIter(self, max_iter) when is_integer(max_iter)
  do
    positional = [
      max_iter: Evision.Internal.Structurise.from_struct(max_iter)
    ]
    :evision_nif.calibrateRobertson_setMaxIter(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **threshold**: `float`



  Python prototype (for reference): 
  ```python3
  setThreshold(threshold) -> None
  ```

  """
  @spec setThreshold(Evision.CalibrateRobertson.t(), number()) :: :ok | {:error, String.t()}
  def setThreshold(self, threshold) when is_float(threshold)
  do
    positional = [
      threshold: Evision.Internal.Structurise.from_struct(threshold)
    ]
    :evision_nif.calibrateRobertson_setThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  simplified API for language bindings

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.CalibrateRobertson.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.calibrateRobertson_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  simplified API for language bindings

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.CalibrateRobertson.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.calibrateRobertson_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
