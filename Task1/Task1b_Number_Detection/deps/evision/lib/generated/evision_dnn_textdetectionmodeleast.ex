defmodule Evision.DNN.TextDetectionModelEAST do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.TextDetectionModelEAST` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.TextDetectionModelEAST", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.TextDetectionModelEAST", ref: ref}) do
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
  - **self**: `Evision.DNN.TextDetectionModelEAST`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_EAST(model[, config]) -> <dnn_TextDetectionModel_EAST object>
  ```

  """
  @spec textDetectionModelEAST(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.TextDetectionModelEAST.t() | {:error, String.t()}
  def textDetectionModelEAST(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_TextDetectionModel_EAST(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  - **self**: `Evision.DNN.TextDetectionModelEAST`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_EAST(model[, config]) -> <dnn_TextDetectionModel_EAST object>
  ```

  #### Variant 2:
  Create text detection algorithm from deep learning network

  ##### Positional Arguments
  - **network**: `Evision.DNN.Net`.

    Net object


  ##### Return
  - **self**: `Evision.DNN.TextDetectionModelEAST`



  Python prototype (for reference): 
  ```python3
  TextDetectionModel_EAST(network) -> <dnn_TextDetectionModel_EAST object>
  ```


  """
  @spec textDetectionModelEAST(binary()) :: Evision.DNN.TextDetectionModelEAST.t() | {:error, String.t()}
  def textDetectionModelEAST(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_TextDetectionModel_EAST(positional)
    |> __to_struct__()
  end
  @spec textDetectionModelEAST(Evision.DNN.Net.t()) :: Evision.DNN.TextDetectionModelEAST.t() | {:error, String.t()}
  def textDetectionModelEAST(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_TextDetectionModel_EAST(positional)
    |> __to_struct__()
  end

  @doc """
  Get the detection confidence threshold
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getConfidenceThreshold() -> retval
  ```

  """
  @spec getConfidenceThreshold(Evision.DNN.TextDetectionModelEAST.t()) :: number() | {:error, String.t()}
  def getConfidenceThreshold(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_getConfidenceThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Get the detection confidence threshold
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getNMSThreshold() -> retval
  ```

  """
  @spec getNMSThreshold(Evision.DNN.TextDetectionModelEAST.t()) :: number() | {:error, String.t()}
  def getNMSThreshold(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_getNMSThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the detection confidence threshold

  ##### Positional Arguments
  - **confThreshold**: `float`.

    A threshold used to filter boxes by confidences


  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelEAST`



  Python prototype (for reference): 
  ```python3
  setConfidenceThreshold(confThreshold) -> retval
  ```

  """
  @spec setConfidenceThreshold(Evision.DNN.TextDetectionModelEAST.t(), number()) :: Evision.DNN.TextDetectionModelEAST.t() | {:error, String.t()}
  def setConfidenceThreshold(self, confThreshold) when is_float(confThreshold)
  do
    positional = [
      confThreshold: Evision.Internal.Structurise.from_struct(confThreshold)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_setConfidenceThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the detection NMS filter threshold

  ##### Positional Arguments
  - **nmsThreshold**: `float`.

    A threshold used in non maximum suppression


  ##### Return
  - **retval**: `Evision.DNN.TextDetectionModelEAST`



  Python prototype (for reference): 
  ```python3
  setNMSThreshold(nmsThreshold) -> retval
  ```

  """
  @spec setNMSThreshold(Evision.DNN.TextDetectionModelEAST.t(), number()) :: Evision.DNN.TextDetectionModelEAST.t() | {:error, String.t()}
  def setNMSThreshold(self, nmsThreshold) when is_float(nmsThreshold)
  do
    positional = [
      nmsThreshold: Evision.Internal.Structurise.from_struct(nmsThreshold)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_EAST_setNMSThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
