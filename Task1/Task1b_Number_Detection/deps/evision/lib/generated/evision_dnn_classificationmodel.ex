defmodule Evision.DNN.ClassificationModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.ClassificationModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.ClassificationModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.ClassificationModel", ref: ref}) do
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
  - **self**: `Evision.DNN.ClassificationModel`



  Python prototype (for reference): 
  ```python3
  ClassificationModel(network) -> <dnn_ClassificationModel object>
  ```

  #### Variant 2:
  Create classification model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.ClassificationModel`



  Python prototype (for reference): 
  ```python3
  ClassificationModel(model[, config]) -> <dnn_ClassificationModel object>
  ```


  """
  @spec classificationModel(Evision.DNN.Net.t()) :: Evision.DNN.ClassificationModel.t() | {:error, String.t()}
  def classificationModel(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_ClassificationModel_ClassificationModel(positional)
    |> __to_struct__()
  end
  @spec classificationModel(binary()) :: Evision.DNN.ClassificationModel.t() | {:error, String.t()}
  def classificationModel(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_ClassificationModel_ClassificationModel(positional)
    |> __to_struct__()
  end

  @doc """
  Create classification model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.ClassificationModel`



  Python prototype (for reference): 
  ```python3
  ClassificationModel(model[, config]) -> <dnn_ClassificationModel object>
  ```

  """
  @spec classificationModel(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.ClassificationModel.t() | {:error, String.t()}
  def classificationModel(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_ClassificationModel_ClassificationModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **classId**: `int`
  - **conf**: `float`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  classify(frame) -> classId, conf
  ```

  """
  @spec classify(Evision.DNN.ClassificationModel.t(), Evision.Mat.maybe_mat_in()) :: {integer(), number()} | {:error, String.t()}
  def classify(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_ClassificationModel_classify(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Get enable/disable softmax post processing option.
  ##### Return
  - **retval**: `bool`

   This option defaults to false, softmax post processing is not applied within the classify() function.

  Python prototype (for reference): 
  ```python3
  getEnableSoftmaxPostProcessing() -> retval
  ```

  """
  @spec getEnableSoftmaxPostProcessing(Evision.DNN.ClassificationModel.t()) :: boolean() | {:error, String.t()}
  def getEnableSoftmaxPostProcessing(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_ClassificationModel_getEnableSoftmaxPostProcessing(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set enable/disable softmax post processing option.

  ##### Positional Arguments
  - **enable**: `bool`.

    Set enable softmax post processing within the classify() function.


  ##### Return
  - **retval**: `Evision.DNN.ClassificationModel`

   If this option is true, softmax is applied after forward inference within the classify() function
   to convert the confidences range to [0.0-1.0].
   This function allows you to toggle this behavior.
   Please turn true when not contain softmax layer in model.


  Python prototype (for reference): 
  ```python3
  setEnableSoftmaxPostProcessing(enable) -> retval
  ```

  """
  @spec setEnableSoftmaxPostProcessing(Evision.DNN.ClassificationModel.t(), boolean()) :: Evision.DNN.ClassificationModel.t() | {:error, String.t()}
  def setEnableSoftmaxPostProcessing(self, enable) when is_boolean(enable)
  do
    positional = [
      enable: Evision.Internal.Structurise.from_struct(enable)
    ]
    :evision_nif.dnn_dnn_ClassificationModel_setEnableSoftmaxPostProcessing(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
