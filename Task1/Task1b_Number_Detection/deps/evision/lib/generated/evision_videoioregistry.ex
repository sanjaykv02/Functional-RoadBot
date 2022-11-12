defmodule Evision.VideoIORegistry do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.VideoIORegistry` struct.

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
  def __to_struct__({:ok, %{class: :VideoIORegistry, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :VideoIORegistry, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Returns backend API name or "UnknownVideoAPI(xxx)"

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`.

    backend ID (#VideoCaptureAPIs)


  ##### Return
  - **retval**: `String`



  Python prototype (for reference): 
  ```python3
  getBackendName(api) -> retval
  ```

  """
  @spec getBackendName(list(number())) :: binary() | {:error, String.t()}
  def getBackendName(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_getBackendName(positional)
    |> __to_struct__()
  end

  @doc """
  Returns list of all available backends
  ##### Return
  - **retval**: `std::vector<VideoCaptureAPIs>`


  Python prototype (for reference): 
  ```python3
  getBackends() -> retval
  ```

  """
  @spec getBackends() :: list(list(number())) | {:error, String.t()}
  def getBackends() do
    positional = [
    ]
    :evision_nif.videoio_registry_getBackends(positional)
    |> __to_struct__()
  end

  @doc """
  Returns description and ABI/API version of videoio plugin's camera interface

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`

  ##### Return
  - **retval**: `String`
  - **version_ABI**: `int`
  - **version_API**: `int`


  Python prototype (for reference): 
  ```python3
  getCameraBackendPluginVersion(api) -> retval, version_ABI, version_API
  ```

  """
  @spec getCameraBackendPluginVersion(list(number())) :: {binary(), integer(), integer()} | {:error, String.t()}
  def getCameraBackendPluginVersion(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_getCameraBackendPluginVersion(positional)
    |> __to_struct__()
  end

  @doc """
  Returns list of available backends which works via `cv::VideoCapture(int index)`
  ##### Return
  - **retval**: `std::vector<VideoCaptureAPIs>`


  Python prototype (for reference): 
  ```python3
  getCameraBackends() -> retval
  ```

  """
  @spec getCameraBackends() :: list(list(number())) | {:error, String.t()}
  def getCameraBackends() do
    positional = [
    ]
    :evision_nif.videoio_registry_getCameraBackends(positional)
    |> __to_struct__()
  end

  @doc """
  Returns description and ABI/API version of videoio plugin's stream capture interface

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`

  ##### Return
  - **retval**: `String`
  - **version_ABI**: `int`
  - **version_API**: `int`


  Python prototype (for reference): 
  ```python3
  getStreamBackendPluginVersion(api) -> retval, version_ABI, version_API
  ```

  """
  @spec getStreamBackendPluginVersion(list(number())) :: {binary(), integer(), integer()} | {:error, String.t()}
  def getStreamBackendPluginVersion(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_getStreamBackendPluginVersion(positional)
    |> __to_struct__()
  end

  @doc """
  Returns list of available backends which works via `cv::VideoCapture(filename)`
  ##### Return
  - **retval**: `std::vector<VideoCaptureAPIs>`


  Python prototype (for reference): 
  ```python3
  getStreamBackends() -> retval
  ```

  """
  @spec getStreamBackends() :: list(list(number())) | {:error, String.t()}
  def getStreamBackends() do
    positional = [
    ]
    :evision_nif.videoio_registry_getStreamBackends(positional)
    |> __to_struct__()
  end

  @doc """
  Returns description and ABI/API version of videoio plugin's writer interface

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`

  ##### Return
  - **retval**: `String`
  - **version_ABI**: `int`
  - **version_API**: `int`


  Python prototype (for reference): 
  ```python3
  getWriterBackendPluginVersion(api) -> retval, version_ABI, version_API
  ```

  """
  @spec getWriterBackendPluginVersion(list(number())) :: {binary(), integer(), integer()} | {:error, String.t()}
  def getWriterBackendPluginVersion(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_getWriterBackendPluginVersion(positional)
    |> __to_struct__()
  end

  @doc """
  Returns list of available backends which works via `cv::VideoWriter()`
  ##### Return
  - **retval**: `std::vector<VideoCaptureAPIs>`


  Python prototype (for reference): 
  ```python3
  getWriterBackends() -> retval
  ```

  """
  @spec getWriterBackends() :: list(list(number())) | {:error, String.t()}
  def getWriterBackends() do
    positional = [
    ]
    :evision_nif.videoio_registry_getWriterBackends(positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if backend is available

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasBackend(api) -> retval
  ```

  """
  @spec hasBackend(list(number())) :: boolean() | {:error, String.t()}
  def hasBackend(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_hasBackend(positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if backend is built in (false if backend is used as plugin)

  ##### Positional Arguments
  - **api**: `VideoCaptureAPIs`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isBackendBuiltIn(api) -> retval
  ```

  """
  @spec isBackendBuiltIn(list(number())) :: boolean() | {:error, String.t()}
  def isBackendBuiltIn(api) when is_list(api)
  do
    positional = [
      api: Evision.Internal.Structurise.from_struct(api)
    ]
    :evision_nif.videoio_registry_isBackendBuiltIn(positional)
    |> __to_struct__()
  end
end
