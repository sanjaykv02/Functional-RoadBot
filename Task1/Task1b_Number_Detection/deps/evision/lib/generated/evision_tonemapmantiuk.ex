defmodule Evision.TonemapMantiuk do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TonemapMantiuk` struct.

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
  def __to_struct__({:ok, %{class: :TonemapMantiuk, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :TonemapMantiuk, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getSaturation() -> retval
  ```

  """
  @spec getSaturation(Evision.TonemapMantiuk.t()) :: number() | {:error, String.t()}
  def getSaturation(self) do
    positional = [
    ]
    :evision_nif.tonemapMantiuk_getSaturation(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getScale() -> retval
  ```

  """
  @spec getScale(Evision.TonemapMantiuk.t()) :: number() | {:error, String.t()}
  def getScale(self) do
    positional = [
    ]
    :evision_nif.tonemapMantiuk_getScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **saturation**: `float`



  Python prototype (for reference): 
  ```python3
  setSaturation(saturation) -> None
  ```

  """
  @spec setSaturation(Evision.TonemapMantiuk.t(), number()) :: :ok | {:error, String.t()}
  def setSaturation(self, saturation) when is_float(saturation)
  do
    positional = [
      saturation: Evision.Internal.Structurise.from_struct(saturation)
    ]
    :evision_nif.tonemapMantiuk_setSaturation(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **scale**: `float`



  Python prototype (for reference): 
  ```python3
  setScale(scale) -> None
  ```

  """
  @spec setScale(Evision.TonemapMantiuk.t(), number()) :: :ok | {:error, String.t()}
  def setScale(self, scale) when is_float(scale)
  do
    positional = [
      scale: Evision.Internal.Structurise.from_struct(scale)
    ]
    :evision_nif.tonemapMantiuk_setScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
