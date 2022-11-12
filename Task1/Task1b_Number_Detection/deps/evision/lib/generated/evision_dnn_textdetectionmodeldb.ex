defmodule Evision.DNN.TextDetectionModelDB do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.TextDetectionModelDB` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.TextDetectionModelDB", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.TextDetectionModelDB", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Create text detection model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `string`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `string`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.TextDetectionModelDB`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_DB(model[, config]) -> <dnn_TextDetectionModel_DB object>
  ```

  """
  @spec textDetectionModelDB(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def textDetectionModelDB(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_TextDetectionModel_DB(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Create text detection model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `string`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `string`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.TextDetectionModelDB`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_DB(model[, config]) -> <dnn_TextDetectionModel_DB object>
  ```

  #### Variant 2:
  Create text detection algorithm from deep learning network.

  ##### Positional Arguments
  - **network**: `Evision.DNN.Net`.

    Net object.


  ##### Return
  - **self**: `Evision.DNN.TextDetectionModelDB`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_DB(network) -> <dnn_TextDetectionModel_DB object>
  ```


  """
  @spec textDetectionModelDB(binary()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def textDetectionModelDB(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_TextDetectionModel_DB(positional)
    |> __to_struct__()
  end
  @spec textDetectionModelDB(Evision.DNN.Net.t()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def textDetectionModelDB(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_TextDetectionModel_DB(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getBinaryThreshold() -> retval
  ```

  """
  @spec getBinaryThreshold(Evision.DNN.TextDetectionModelDB.t()) :: number() | {:error, String.t()}
  def getBinaryThreshold(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_getBinaryThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMaxCandidates() -> retval
  ```

  """
  @spec getMaxCandidates(Evision.DNN.TextDetectionModelDB.t()) :: integer() | {:error, String.t()}
  def getMaxCandidates(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_getMaxCandidates(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getPolygonThreshold() -> retval
  ```

  """
  @spec getPolygonThreshold(Evision.DNN.TextDetectionModelDB.t()) :: number() | {:error, String.t()}
  def getPolygonThreshold(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_getPolygonThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getUnclipRatio() -> retval
  ```

  """
  @spec getUnclipRatio(Evision.DNN.TextDetectionModelDB.t()) :: number() | {:error, String.t()}
  def getUnclipRatio(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_getUnclipRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **binaryThreshold**: `float`

  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelDB`


  Python prototype (for reference): 
  ```python3
  setBinaryThreshold(binaryThreshold) -> retval
  ```

  """
  @spec setBinaryThreshold(Evision.DNN.TextDetectionModelDB.t(), number()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def setBinaryThreshold(self, binaryThreshold) when is_float(binaryThreshold)
  do
    positional = [
      binaryThreshold: Evision.Internal.Structurise.from_struct(binaryThreshold)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_setBinaryThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **maxCandidates**: `int`

  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelDB`


  Python prototype (for reference): 
  ```python3
  setMaxCandidates(maxCandidates) -> retval
  ```

  """
  @spec setMaxCandidates(Evision.DNN.TextDetectionModelDB.t(), integer()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def setMaxCandidates(self, maxCandidates) when is_integer(maxCandidates)
  do
    positional = [
      maxCandidates: Evision.Internal.Structurise.from_struct(maxCandidates)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_setMaxCandidates(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **polygonThreshold**: `float`

  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelDB`


  Python prototype (for reference): 
  ```python3
  setPolygonThreshold(polygonThreshold) -> retval
  ```

  """
  @spec setPolygonThreshold(Evision.DNN.TextDetectionModelDB.t(), number()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def setPolygonThreshold(self, polygonThreshold) when is_float(polygonThreshold)
  do
    positional = [
      polygonThreshold: Evision.Internal.Structurise.from_struct(polygonThreshold)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_setPolygonThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **unclipRatio**: `double`

  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelDB`


  Python prototype (for reference): 
  ```python3
  setUnclipRatio(unclipRatio) -> retval
  ```

  """
  @spec setUnclipRatio(Evision.DNN.TextDetectionModelDB.t(), number()) :: Evision.DNN.TextDetectionModelDB.t() | {:error, String.t()}
  def setUnclipRatio(self, unclipRatio) when is_number(unclipRatio)
  do
    positional = [
      unclipRatio: Evision.Internal.Structurise.from_struct(unclipRatio)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_DB_setUnclipRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
