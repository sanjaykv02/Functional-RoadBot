defmodule Evision.DNN.DetectionModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.DetectionModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.DetectionModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.DetectionModel", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  #### Variant 1:
  Create model from deep learning network.

  ##### Positional Arguments
  - **network**: `Evision.DNN.Net`.

    Net object.


  ##### Return
  - **self**: `Evision.DNN.DetectionModel`



  Python prototype (for reference): 
  ```python3
  DetectionModel(network) -> <dnn_DetectionModel object>
  ```

  #### Variant 2:
  Create detection model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.DetectionModel`



  Python prototype (for reference): 
  ```python3
  DetectionModel(model[, config]) -> <dnn_DetectionModel object>
  ```


  """
  @spec detectionModel(Evision.DNN.Net.t()) :: Evision.DNN.DetectionModel.t() | {:error, String.t()}
  def detectionModel(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_DetectionModel_DetectionModel(positional)
    |> __to_struct__()
  end
  @spec detectionModel(binary()) :: Evision.DNN.DetectionModel.t() | {:error, String.t()}
  def detectionModel(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_DetectionModel_DetectionModel(positional)
    |> __to_struct__()
  end

  @doc """
  Create detection model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.DetectionModel`



  Python prototype (for reference): 
  ```python3
  DetectionModel(model[, config]) -> <dnn_DetectionModel object>
  ```

  """
  @spec detectionModel(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.DetectionModel.t() | {:error, String.t()}
  def detectionModel(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_DetectionModel_DetectionModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return result detections.

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Keyword Arguments
  - **confThreshold**: `float`.

    A threshold used to filter boxes by confidences.

  - **nmsThreshold**: `float`.

    A threshold used in non maximum suppression.


  ##### Return
  - **classIds**: `[int]`.

    Class indexes in result detection.

  - **confidences**: `[float]`.

    A set of corresponding confidences.

  - **boxes**: `[Rect]`.

    A set of bounding boxes.




  Python prototype (for reference): 
  ```python3
  detect(frame[, confThreshold[, nmsThreshold]]) -> classIds, confidences, boxes
  ```

  """
  @spec detect(Evision.DNN.DetectionModel.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(integer()), list(number()), list({number(), number(), number(), number()})} | {:error, String.t()}
  def detect(self, frame, opts) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_DetectionModel_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return result detections.

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Keyword Arguments
  - **confThreshold**: `float`.

    A threshold used to filter boxes by confidences.

  - **nmsThreshold**: `float`.

    A threshold used in non maximum suppression.


  ##### Return
  - **classIds**: `[int]`.

    Class indexes in result detection.

  - **confidences**: `[float]`.

    A set of corresponding confidences.

  - **boxes**: `[Rect]`.

    A set of bounding boxes.




  Python prototype (for reference): 
  ```python3
  detect(frame[, confThreshold[, nmsThreshold]]) -> classIds, confidences, boxes
  ```

  """
  @spec detect(Evision.DNN.DetectionModel.t(), Evision.Mat.maybe_mat_in()) :: {list(integer()), list(number()), list({number(), number(), number(), number()})} | {:error, String.t()}
  def detect(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_DetectionModel_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Getter for nmsAcrossClasses. This variable defaults to false,
  such that when non max suppression is used during the detect() function, it will do so only per-class

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getNmsAcrossClasses() -> retval
  ```

  """
  @spec getNmsAcrossClasses(Evision.DNN.DetectionModel.t()) :: boolean() | {:error, String.t()}
  def getNmsAcrossClasses(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_DetectionModel_getNmsAcrossClasses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  nmsAcrossClasses defaults to false,
  such that when non max suppression is used during the detect() function, it will do so per-class.
  This function allows you to toggle this behaviour.


  ##### Positional Arguments
  - **value**: `bool`.

    The new value for nmsAcrossClasses


  ##### Return
  - **retval**: `Evision.DNN.DetectionModel`



  Python prototype (for reference): 
  ```python3
  setNmsAcrossClasses(value) -> retval
  ```

  """
  @spec setNmsAcrossClasses(Evision.DNN.DetectionModel.t(), boolean()) :: Evision.DNN.DetectionModel.t() | {:error, String.t()}
  def setNmsAcrossClasses(self, value) when is_boolean(value)
  do
    positional = [
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.dnn_dnn_DetectionModel_setNmsAcrossClasses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
