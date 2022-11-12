defmodule Evision.CUDA.Event do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA.Event` struct.

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
  def __to_struct__({:ok, %{class: :"CUDA.Event", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"CUDA.Event", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **flags**: `Event_CreateFlags`.

  ##### Return
  - **self**: `Evision.CUDA.Event`



  Python prototype (for reference): 
  ```python3
  Event([, flags]) -> <cuda_Event object>
  ```

  """
  @spec event([{atom(), term()},...] | nil) :: Evision.CUDA.Event.t() | {:error, String.t()}
  def event(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.cuda_cuda_Event_Event(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **flags**: `Event_CreateFlags`.

  ##### Return
  - **self**: `Evision.CUDA.Event`



  Python prototype (for reference): 
  ```python3
  Event([, flags]) -> <cuda_Event object>
  ```

  """
  @spec event() :: Evision.CUDA.Event.t() | {:error, String.t()}
  def event() do
    positional = [
    ]
    :evision_nif.cuda_cuda_Event_Event(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **start**: `Evision.CUDA.Event`
  - **end_**: `Evision.CUDA.Event`

  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  elapsedTime(start, end_) -> retval
  ```

  """
  @spec elapsedTime(Evision.CUDA.Event.t(), Evision.CUDA.Event.t()) :: number() | {:error, String.t()}
  def elapsedTime(start, end_) when is_struct(start, Evision.CUDA.Event) and is_struct(end_, Evision.CUDA.Event)
  do
    positional = [
      start: Evision.Internal.Structurise.from_struct(start),
      end_: Evision.Internal.Structurise.from_struct(end_)
    ]
    :evision_nif.cuda_cuda_Event_elapsedTime_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  queryIfComplete() -> retval
  ```

  """
  @spec queryIfComplete(Evision.CUDA.Event.t()) :: boolean() | {:error, String.t()}
  def queryIfComplete(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_Event_queryIfComplete(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **stream**: `Evision.CUDA.Stream`.




  Python prototype (for reference): 
  ```python3
  record([, stream]) -> None
  ```

  """
  @spec record(Evision.CUDA.Event.t()) :: :ok | {:error, String.t()}
  def record(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_Event_record(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  waitForCompletion() -> None
  ```

  """
  @spec waitForCompletion(Evision.CUDA.Event.t()) :: :ok | {:error, String.t()}
  def waitForCompletion(self) do
    positional = [
    ]
    :evision_nif.cuda_cuda_Event_waitForCompletion(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
