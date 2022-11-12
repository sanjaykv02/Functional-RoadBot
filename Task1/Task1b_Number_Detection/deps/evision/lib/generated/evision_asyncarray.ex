defmodule Evision.AsyncArray do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.AsyncArray` struct.

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
  def __to_struct__({:ok, %{class: :AsyncArray, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :AsyncArray, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.AsyncArray`


  Python prototype (for reference): 
  ```python3
  AsyncArray() -> <AsyncArray object>
  ```

  """
  @spec asyncArray() :: Evision.AsyncArray.t() | {:error, String.t()}
  def asyncArray() do
    positional = [
    ]
    :evision_nif.asyncArray_AsyncArray(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **timeoutNs**: `double`.

    timeout in nanoseconds, -1 for infinite wait


  ##### Return
  - **retval**: `bool`
  - **dst**: `Evision.Mat`.

    destination array


  Retrieving the result with timeout

  @returns true if result is ready, false if the timeout has expired
  **Note**: Result or stored exception can be fetched only once.


  Python prototype (for reference): 
  ```python3
  get(timeoutNs[, dst]) -> retval, dst
  ```

  """
  @spec get(Evision.AsyncArray.t(), number(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | false | {:error, String.t()}
  def get(self, timeoutNs, opts) when is_number(timeoutNs) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      timeoutNs: Evision.Internal.Structurise.from_struct(timeoutNs)
    ]
    :evision_nif.asyncArray_get(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **timeoutNs**: `double`.

    timeout in nanoseconds, -1 for infinite wait


  ##### Return
  - **retval**: `bool`
  - **dst**: `Evision.Mat`.

    destination array


  Retrieving the result with timeout

  @returns true if result is ready, false if the timeout has expired
  **Note**: Result or stored exception can be fetched only once.


  Python prototype (for reference): 
  ```python3
  get(timeoutNs[, dst]) -> retval, dst
  ```

  """
  @spec get(Evision.AsyncArray.t(), number()) :: Evision.Mat.t() | false | {:error, String.t()}
  def get(self, timeoutNs) when is_number(timeoutNs)
  do
    positional = [
      timeoutNs: Evision.Internal.Structurise.from_struct(timeoutNs)
    ]
    :evision_nif.asyncArray_get(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **dst**: `Evision.Mat`.

    destination array


  Fetch the result.

  Waits for result until container has valid result.
  Throws exception if exception was stored as a result.
  Throws exception on invalid container state.
  **Note**: Result or stored exception can be fetched only once.


  Python prototype (for reference): 
  ```python3
  get([, dst]) -> dst
  ```

  """
  @spec get(Evision.AsyncArray.t()) :: Evision.Mat.t() | {:error, String.t()}
  def get(self) do
    positional = [
    ]
    :evision_nif.asyncArray_get(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  release() -> None
  ```

  """
  @spec release(Evision.AsyncArray.t()) :: :ok | {:error, String.t()}
  def release(self) do
    positional = [
    ]
    :evision_nif.asyncArray_release(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  valid() -> retval
  ```

  """
  @spec valid(Evision.AsyncArray.t()) :: boolean() | {:error, String.t()}
  def valid(self) do
    positional = [
    ]
    :evision_nif.asyncArray_valid(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **timeoutNs**: `double`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  wait_for(timeoutNs) -> retval
  ```

  """
  @spec wait_for(Evision.AsyncArray.t(), number()) :: boolean() | {:error, String.t()}
  def wait_for(self, timeoutNs) when is_number(timeoutNs)
  do
    positional = [
      timeoutNs: Evision.Internal.Structurise.from_struct(timeoutNs)
    ]
    :evision_nif.asyncArray_wait_for(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
