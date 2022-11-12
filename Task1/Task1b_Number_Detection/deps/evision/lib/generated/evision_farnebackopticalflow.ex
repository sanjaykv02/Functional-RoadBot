defmodule Evision.FarnebackOpticalFlow do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.FarnebackOpticalFlow` struct.

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
  def __to_struct__({:ok, %{class: :FarnebackOpticalFlow, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :FarnebackOpticalFlow, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **numLevels**: `int`.
  - **pyrScale**: `double`.
  - **fastPyramids**: `bool`.
  - **winSize**: `int`.
  - **numIters**: `int`.
  - **polyN**: `int`.
  - **polySigma**: `double`.
  - **flags**: `int`.

  ##### Return
  - **retval**: `Evision.FarnebackOpticalFlow`



  Python prototype (for reference): 
  ```python3
  create([, numLevels[, pyrScale[, fastPyramids[, winSize[, numIters[, polyN[, polySigma[, flags]]]]]]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.FarnebackOpticalFlow.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **numLevels**: `int`.
  - **pyrScale**: `double`.
  - **fastPyramids**: `bool`.
  - **winSize**: `int`.
  - **numIters**: `int`.
  - **polyN**: `int`.
  - **polySigma**: `double`.
  - **flags**: `int`.

  ##### Return
  - **retval**: `Evision.FarnebackOpticalFlow`



  Python prototype (for reference): 
  ```python3
  create([, numLevels[, pyrScale[, fastPyramids[, winSize[, numIters[, polyN[, polySigma[, flags]]]]]]]]) -> retval
  ```

  """
  @spec create() :: Evision.FarnebackOpticalFlow.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getFastPyramids() -> retval
  ```

  """
  @spec getFastPyramids(Evision.FarnebackOpticalFlow.t()) :: boolean() | {:error, String.t()}
  def getFastPyramids(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getFastPyramids(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getFlags() -> retval
  ```

  """
  @spec getFlags(Evision.FarnebackOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getFlags(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getFlags(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNumIters() -> retval
  ```

  """
  @spec getNumIters(Evision.FarnebackOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getNumIters(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getNumIters(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNumLevels() -> retval
  ```

  """
  @spec getNumLevels(Evision.FarnebackOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getNumLevels(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getNumLevels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getPolyN() -> retval
  ```

  """
  @spec getPolyN(Evision.FarnebackOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getPolyN(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getPolyN(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getPolySigma() -> retval
  ```

  """
  @spec getPolySigma(Evision.FarnebackOpticalFlow.t()) :: number() | {:error, String.t()}
  def getPolySigma(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getPolySigma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getPyrScale() -> retval
  ```

  """
  @spec getPyrScale(Evision.FarnebackOpticalFlow.t()) :: number() | {:error, String.t()}
  def getPyrScale(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getPyrScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getWinSize() -> retval
  ```

  """
  @spec getWinSize(Evision.FarnebackOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getWinSize(self) do
    positional = [
    ]
    :evision_nif.farnebackOpticalFlow_getWinSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **fastPyramids**: `bool`



  Python prototype (for reference): 
  ```python3
  setFastPyramids(fastPyramids) -> None
  ```

  """
  @spec setFastPyramids(Evision.FarnebackOpticalFlow.t(), boolean()) :: :ok | {:error, String.t()}
  def setFastPyramids(self, fastPyramids) when is_boolean(fastPyramids)
  do
    positional = [
      fastPyramids: Evision.Internal.Structurise.from_struct(fastPyramids)
    ]
    :evision_nif.farnebackOpticalFlow_setFastPyramids(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **flags**: `int`



  Python prototype (for reference): 
  ```python3
  setFlags(flags) -> None
  ```

  """
  @spec setFlags(Evision.FarnebackOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setFlags(self, flags) when is_integer(flags)
  do
    positional = [
      flags: Evision.Internal.Structurise.from_struct(flags)
    ]
    :evision_nif.farnebackOpticalFlow_setFlags(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **numIters**: `int`



  Python prototype (for reference): 
  ```python3
  setNumIters(numIters) -> None
  ```

  """
  @spec setNumIters(Evision.FarnebackOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setNumIters(self, numIters) when is_integer(numIters)
  do
    positional = [
      numIters: Evision.Internal.Structurise.from_struct(numIters)
    ]
    :evision_nif.farnebackOpticalFlow_setNumIters(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **numLevels**: `int`



  Python prototype (for reference): 
  ```python3
  setNumLevels(numLevels) -> None
  ```

  """
  @spec setNumLevels(Evision.FarnebackOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setNumLevels(self, numLevels) when is_integer(numLevels)
  do
    positional = [
      numLevels: Evision.Internal.Structurise.from_struct(numLevels)
    ]
    :evision_nif.farnebackOpticalFlow_setNumLevels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **polyN**: `int`



  Python prototype (for reference): 
  ```python3
  setPolyN(polyN) -> None
  ```

  """
  @spec setPolyN(Evision.FarnebackOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setPolyN(self, polyN) when is_integer(polyN)
  do
    positional = [
      polyN: Evision.Internal.Structurise.from_struct(polyN)
    ]
    :evision_nif.farnebackOpticalFlow_setPolyN(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **polySigma**: `double`



  Python prototype (for reference): 
  ```python3
  setPolySigma(polySigma) -> None
  ```

  """
  @spec setPolySigma(Evision.FarnebackOpticalFlow.t(), number()) :: :ok | {:error, String.t()}
  def setPolySigma(self, polySigma) when is_number(polySigma)
  do
    positional = [
      polySigma: Evision.Internal.Structurise.from_struct(polySigma)
    ]
    :evision_nif.farnebackOpticalFlow_setPolySigma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **pyrScale**: `double`



  Python prototype (for reference): 
  ```python3
  setPyrScale(pyrScale) -> None
  ```

  """
  @spec setPyrScale(Evision.FarnebackOpticalFlow.t(), number()) :: :ok | {:error, String.t()}
  def setPyrScale(self, pyrScale) when is_number(pyrScale)
  do
    positional = [
      pyrScale: Evision.Internal.Structurise.from_struct(pyrScale)
    ]
    :evision_nif.farnebackOpticalFlow_setPyrScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **winSize**: `int`



  Python prototype (for reference): 
  ```python3
  setWinSize(winSize) -> None
  ```

  """
  @spec setWinSize(Evision.FarnebackOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setWinSize(self, winSize) when is_integer(winSize)
  do
    positional = [
      winSize: Evision.Internal.Structurise.from_struct(winSize)
    ]
    :evision_nif.farnebackOpticalFlow_setWinSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
