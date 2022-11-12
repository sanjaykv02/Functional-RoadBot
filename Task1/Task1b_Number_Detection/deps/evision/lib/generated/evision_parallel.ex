defmodule Evision.Parallel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Parallel` struct.

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
  def __to_struct__({:ok, %{class: :Parallel, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Parallel, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Change OpenCV parallel_for backend

  ##### Positional Arguments
  - **backendName**: `string`

  ##### Keyword Arguments
  - **propagateNumThreads**: `bool`.

  ##### Return
  - **retval**: `bool`

  **Note**: This call is not thread-safe. Consider calling this function from the `main()` before any other OpenCV processing functions (and without any other created threads).


  Python prototype (for reference): 
  ```python3
  setParallelForBackend(backendName[, propagateNumThreads]) -> retval
  ```

  """
  @spec setParallelForBackend(binary(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def setParallelForBackend(backendName, opts) when is_binary(backendName) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      backendName: Evision.Internal.Structurise.from_struct(backendName)
    ]
    :evision_nif.parallel_setParallelForBackend(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Change OpenCV parallel_for backend

  ##### Positional Arguments
  - **backendName**: `string`

  ##### Keyword Arguments
  - **propagateNumThreads**: `bool`.

  ##### Return
  - **retval**: `bool`

  **Note**: This call is not thread-safe. Consider calling this function from the `main()` before any other OpenCV processing functions (and without any other created threads).


  Python prototype (for reference): 
  ```python3
  setParallelForBackend(backendName[, propagateNumThreads]) -> retval
  ```

  """
  @spec setParallelForBackend(binary()) :: boolean() | {:error, String.t()}
  def setParallelForBackend(backendName) when is_binary(backendName)
  do
    positional = [
      backendName: Evision.Internal.Structurise.from_struct(backendName)
    ]
    :evision_nif.parallel_setParallelForBackend(positional)
    |> __to_struct__()
  end
end
