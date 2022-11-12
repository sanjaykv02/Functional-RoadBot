defmodule Evision.TickMeter do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TickMeter` struct.

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
  def __to_struct__({:ok, %{class: :TickMeter, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :TickMeter, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.TickMeter`


  Python prototype (for reference): 
  ```python3
  TickMeter() -> <TickMeter object>
  ```

  """
  @spec tickMeter() :: Evision.TickMeter.t() | {:error, String.t()}
  def tickMeter() do
    positional = [
    ]
    :evision_nif.tickMeter_TickMeter(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getAvgTimeMilli() -> retval
  ```

  """
  @spec getAvgTimeMilli(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getAvgTimeMilli(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getAvgTimeMilli(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getAvgTimeSec() -> retval
  ```

  """
  @spec getAvgTimeSec(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getAvgTimeSec(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getAvgTimeSec(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int64`


  Python prototype (for reference): 
  ```python3
  getCounter() -> retval
  ```

  """
  @spec getCounter(Evision.TickMeter.t()) :: integer() | {:error, String.t()}
  def getCounter(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getCounter(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getFPS() -> retval
  ```

  """
  @spec getFPS(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getFPS(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getFPS(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getTimeMicro() -> retval
  ```

  """
  @spec getTimeMicro(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getTimeMicro(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getTimeMicro(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getTimeMilli() -> retval
  ```

  """
  @spec getTimeMilli(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getTimeMilli(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getTimeMilli(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getTimeSec() -> retval
  ```

  """
  @spec getTimeSec(Evision.TickMeter.t()) :: number() | {:error, String.t()}
  def getTimeSec(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getTimeSec(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int64`


  Python prototype (for reference): 
  ```python3
  getTimeTicks() -> retval
  ```

  """
  @spec getTimeTicks(Evision.TickMeter.t()) :: integer() | {:error, String.t()}
  def getTimeTicks(self) do
    positional = [
    ]
    :evision_nif.tickMeter_getTimeTicks(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  reset() -> None
  ```

  """
  @spec reset(Evision.TickMeter.t()) :: :ok | {:error, String.t()}
  def reset(self) do
    positional = [
    ]
    :evision_nif.tickMeter_reset(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  start() -> None
  ```

  """
  @spec start(Evision.TickMeter.t()) :: :ok | {:error, String.t()}
  def start(self) do
    positional = [
    ]
    :evision_nif.tickMeter_start(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  stop() -> None
  ```

  """
  @spec stop(Evision.TickMeter.t()) :: :ok | {:error, String.t()}
  def stop(self) do
    positional = [
    ]
    :evision_nif.tickMeter_stop(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
