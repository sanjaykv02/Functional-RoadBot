defmodule Evision.DNN.Net do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.Net` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.Net", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.Net", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.DNN.Net`


  Python prototype (for reference): 
  ```python3
  Net() -> <dnn_Net object>
  ```

  """
  @spec net() :: Evision.DNN.Net.t() | {:error, String.t()}
  def net() do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_Net(positional)
    |> __to_struct__()
  end

  @doc """
  Connects output of the first layer to input of the second layer.

  ##### Positional Arguments
  - **outPin**: `String`.

    descriptor of the first layer output.

  - **inpPin**: `String`.

    descriptor of the second layer input.




   Descriptors have the following template <DFN>&lt;layer_name&gt;[.input_number]</DFN>:
  - the first part of the template <DFN>layer_name</DFN> is string name of the added layer.
    If this part is empty then the network input pseudo layer will be used;

  - the second optional part of the template <DFN>input_number</DFN>
    is either number of the layer input, either label one.
    If this part is omitted then the first layer input will be used.


  @see setNetInputs(), Layer::inputNameToIndex(), Layer::outputNameToIndex()

  Python prototype (for reference): 
  ```python3
  connect(outPin, inpPin) -> None
  ```

  """
  @spec connect(Evision.DNN.Net.t(), binary(), binary()) :: :ok | {:error, String.t()}
  def connect(self, outPin, inpPin) when is_binary(outPin) and is_binary(inpPin)
  do
    positional = [
      outPin: Evision.Internal.Structurise.from_struct(outPin),
      inpPin: Evision.Internal.Structurise.from_struct(inpPin)
    ]
    :evision_nif.dnn_dnn_Net_connect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Dump net to String
  ##### Return
  - **retval**: `String`

  @returns String with structure, hyperparameters, backend, target and fusion
    Call method after setInput(). To see correct backend, target and fusion run after forward().

  Python prototype (for reference): 
  ```python3
  dump() -> retval
  ```

  """
  @spec dump(Evision.DNN.Net.t()) :: binary() | {:error, String.t()}
  def dump(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_dump(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Dump net structure, hyperparameters, backend, target and fusion to dot file

  ##### Positional Arguments
  - **path**: `String`.

    path to output file with .dot extension



  @see dump()

  Python prototype (for reference): 
  ```python3
  dumpToFile(path) -> None
  ```

  """
  @spec dumpToFile(Evision.DNN.Net.t(), binary()) :: :ok | {:error, String.t()}
  def dumpToFile(self, path) when is_binary(path)
  do
    positional = [
      path: Evision.Internal.Structurise.from_struct(path)
    ]
    :evision_nif.dnn_dnn_Net_dumpToFile(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  Returns true if there are no layers in the network.

  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.DNN.Net.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Enables or disables layer fusion in the network.

  ##### Positional Arguments
  - **fusion**: `bool`.

    true to enable the fusion, false to disable. The fusion is enabled by default.





  Python prototype (for reference): 
  ```python3
  enableFusion(fusion) -> None
  ```

  """
  @spec enableFusion(Evision.DNN.Net.t(), boolean()) :: :ok | {:error, String.t()}
  def enableFusion(self, fusion) when is_boolean(fusion)
  do
    positional = [
      fusion: Evision.Internal.Structurise.from_struct(fusion)
    ]
    :evision_nif.dnn_dnn_Net_enableFusion(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Runs forward pass to compute outputs of layers listed in @p outBlobNames.

  ##### Positional Arguments
  - **outBlobNames**: `[String]`.

    names for layers which outputs are needed to get


  ##### Return
  - **outputBlobs**: `[Evision.Mat]`.

    contains blobs for first outputs of specified layers.




  Python prototype (for reference): 
  ```python3
  forward(outBlobNames[, outputBlobs]) -> outputBlobs
  ```

  """
  @spec forward(Evision.Net.t(), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def forward(self, opts \\ nil)
  def forward(self, opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts))) do
    self = Evision.Internal.Structurise.from_struct(self)
    opts = Evision.Internal.Structurise.from_struct(opts || [])
    :evision_nif.dnn_dnn_Net_forward(self, opts)
    |> __to_struct__()
  end

  @doc """
  Runs forward pass to compute outputs of layers listed in @p outBlobNames.

  ##### Positional Arguments
  - **outBlobNames**: `[String]`.

    names for layers which outputs are needed to get


  ##### Return
  - **outputBlobs**: `[[Evision.Mat]]`.

    contains all output blobs for each layer specified in @p outBlobNames.




  Python prototype (for reference): 
  ```python3
  forwardAndRetrieve(outBlobNames) -> outputBlobs
  ```

  """
  @spec forwardAndRetrieve(Evision.DNN.Net.t(), list(binary())) :: list(list(Evision.Mat.t())) | {:error, String.t()}
  def forwardAndRetrieve(self, outBlobNames) when is_list(outBlobNames)
  do
    positional = [
      outBlobNames: Evision.Internal.Structurise.from_struct(outBlobNames)
    ]
    :evision_nif.dnn_dnn_Net_forwardAndRetrieve(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Runs forward pass to compute output of layer with name @p outputName.
  ##### Keyword Arguments
  - **outputName**: `String`.

    name for layer which output is needed to get


  ##### Return
  - **retval**: `Evision.AsyncArray`

  @details By default runs forward pass for the whole network.
    This is an asynchronous version of forward(const String&).
    dnn::DNN_BACKEND_INFERENCE_ENGINE backend is required.


  Python prototype (for reference): 
  ```python3
  forwardAsync([, outputName]) -> retval
  ```

  """
  @spec forwardAsync(Evision.DNN.Net.t()) :: Evision.AsyncArray.t() | {:error, String.t()}
  def forwardAsync(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_forwardAsync(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **layerId**: `int`
  - **netInputShape**: `MatShape`

  ##### Return
  - **retval**: `int64`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getFLOPS(layerId, netInputShape) -> retval
  ```

  """
  @spec getFLOPS(Evision.DNN.Net.t(), integer(), list(integer())) :: integer() | {:error, String.t()}
  def getFLOPS(self, layerId, netInputShape) when is_integer(layerId) and is_list(netInputShape)
  do
    positional = [
      layerId: Evision.Internal.Structurise.from_struct(layerId),
      netInputShape: Evision.Internal.Structurise.from_struct(netInputShape)
    ]
    :evision_nif.dnn_dnn_Net_getFLOPS(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **netInputShape**: `MatShape`

  ##### Return
  - **retval**: `int64`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getFLOPS(netInputShape) -> retval
  ```

  """
  @spec getFLOPS(Evision.DNN.Net.t(), list(integer())) :: integer() | {:error, String.t()}
  def getFLOPS(self, netInputShape) when is_list(netInputShape)
  do
    positional = [
      netInputShape: Evision.Internal.Structurise.from_struct(netInputShape)
    ]
    :evision_nif.dnn_dnn_Net_getFLOPS(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns input scale and zeropoint for a quantized Net.
  ##### Return
  - **scales**: `[float]`.

    output parameter for returning input scales.

  - **zeropoints**: `[int]`.

    output parameter for returning input zeropoints.




  Python prototype (for reference): 
  ```python3
  getInputDetails() -> scales, zeropoints
  ```

  """
  @spec getInputDetails(Evision.DNN.Net.t()) :: {list(number()), list(integer())} | {:error, String.t()}
  def getInputDetails(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getInputDetails(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **layerName**: `String`

  ##### Return
  - **retval**: `Evision.DNN.Layer`

  Has overloading in C++

  @deprecated Use int getLayerId(const String &layer)

  Python prototype (for reference): 
  ```python3
  getLayer(layerName) -> retval
  ```

  #### Variant 2:
  Returns pointer to layer with specified id or name which the network use.

  ##### Positional Arguments
  - **layerId**: `int`

  ##### Return
  - **retval**: `Evision.DNN.Layer`


  Python prototype (for reference): 
  ```python3
  getLayer(layerId) -> retval
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **layerId**: `LayerId`

  ##### Return
  - **retval**: `Evision.DNN.Layer`

  Has overloading in C++

  @deprecated to be removed

  Python prototype (for reference): 
  ```python3
  getLayer(layerId) -> retval
  ```


  """
  @spec getLayer(Evision.DNN.Net.t(), binary()) :: Evision.DNN.Layer.t() | {:error, String.t()}
  def getLayer(self, layerName) when is_binary(layerName)
  do
    positional = [
      layerName: Evision.Internal.Structurise.from_struct(layerName)
    ]
    :evision_nif.dnn_dnn_Net_getLayer(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec getLayer(Evision.DNN.Net.t(), integer()) :: Evision.DNN.Layer.t() | {:error, String.t()}
  def getLayer(self, layerId) when is_integer(layerId)
  do
    positional = [
      layerId: Evision.Internal.Structurise.from_struct(layerId)
    ]
    :evision_nif.dnn_dnn_Net_getLayer(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec getLayer(Evision.DNN.Net.t(), term()) :: Evision.DNN.Layer.t() | {:error, String.t()}
  def getLayer(self, layerId) do
    positional = [
      layerId: Evision.Internal.Structurise.from_struct(layerId)
    ]
    :evision_nif.dnn_dnn_Net_getLayer(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Converts string name of the layer to the integer identifier.

  ##### Positional Arguments
  - **layer**: `String`

  ##### Return
  - **retval**: `int`

  @returns id of the layer, or -1 if the layer wasn't found.

  Python prototype (for reference): 
  ```python3
  getLayerId(layer) -> retval
  ```

  """
  @spec getLayerId(Evision.DNN.Net.t(), binary()) :: integer() | {:error, String.t()}
  def getLayerId(self, layer) when is_binary(layer)
  do
    positional = [
      layer: Evision.Internal.Structurise.from_struct(layer)
    ]
    :evision_nif.dnn_dnn_Net_getLayerId(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `std::vector<String>`


  Python prototype (for reference): 
  ```python3
  getLayerNames() -> retval
  ```

  """
  @spec getLayerNames(Evision.DNN.Net.t()) :: list(binary()) | {:error, String.t()}
  def getLayerNames(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getLayerNames(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **netInputShapes**: `[MatShape]`
  - **layerId**: `int`

  ##### Return
  - **inLayerShapes**: `[MatShape]`
  - **outLayerShapes**: `[MatShape]`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getLayerShapes(netInputShapes, layerId) -> inLayerShapes, outLayerShapes
  ```

  """
  @spec getLayerShapes(Evision.Net.t(), [{{atom(), term()}},...] | nil) :: {list(list(integer())), list(list(integer()))} | {:error, String.t()}
  def getLayerShapes(self, opts \\ nil) when opts == nil or (is_list(opts) and is_tuple(hd(opts))) do
    self = Evision.Internal.Structurise.from_struct(self)
    opts = Evision.Internal.Structurise.from_struct(opts || [])
    :evision_nif.dnn_dnn_Net_getLayerShapes(self, opts)
    |> __to_struct__()
  end

  @doc """
  Returns list of types for layer used in model.
  ##### Return
  - **layersTypes**: `[String]`.

    output parameter for returning types.




  Python prototype (for reference): 
  ```python3
  getLayerTypes() -> layersTypes
  ```

  """
  @spec getLayerTypes(Evision.DNN.Net.t()) :: list(binary()) | {:error, String.t()}
  def getLayerTypes(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getLayerTypes(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns count of layers of specified type.

  ##### Positional Arguments
  - **layerType**: `String`.

    type.


  ##### Return
  - **retval**: `int`

  @returns count of layers

  Python prototype (for reference): 
  ```python3
  getLayersCount(layerType) -> retval
  ```

  """
  @spec getLayersCount(Evision.DNN.Net.t(), binary()) :: integer() | {:error, String.t()}
  def getLayersCount(self, layerType) when is_binary(layerType)
  do
    positional = [
      layerType: Evision.Internal.Structurise.from_struct(layerType)
    ]
    :evision_nif.dnn_dnn_Net_getLayersCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **netInputShape**: `MatShape`

  ##### Return
  - **layersIds**: `[int]`
  - **inLayersShapes**: `[[MatShape]]`
  - **outLayersShapes**: `[[MatShape]]`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getLayersShapes(netInputShape) -> layersIds, inLayersShapes, outLayersShapes
  ```

  """
  @spec getLayerShapes(Evision.Net.t(), [{{atom(), term()}},...] | nil) :: {list(integer()), list(list(list(integer()))), list(list(list(integer())))} | {:error, String.t()}
  def getLayersShapes(self, opts \\ nil) when opts == nil or (is_list(opts) and is_tuple(hd(opts))) do
    self = Evision.Internal.Structurise.from_struct(self)
    opts = Evision.Internal.Structurise.from_struct(opts || [])
    :evision_nif.dnn_dnn_Net_getLayersShapes(self, opts)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **layerId**: `int`
  - **netInputShape**: `MatShape`

  ##### Return
  - **weights**: `size_t`
  - **blobs**: `size_t`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getMemoryConsumption(layerId, netInputShape) -> weights, blobs
  ```

  """
  @spec getMemoryConsumption(Evision.DNN.Net.t(), integer(), list(integer())) :: {integer(), integer()} | {:error, String.t()}
  def getMemoryConsumption(self, layerId, netInputShape) when is_integer(layerId) and is_list(netInputShape)
  do
    positional = [
      layerId: Evision.Internal.Structurise.from_struct(layerId),
      netInputShape: Evision.Internal.Structurise.from_struct(netInputShape)
    ]
    :evision_nif.dnn_dnn_Net_getMemoryConsumption(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **netInputShape**: `MatShape`

  ##### Return
  - **weights**: `size_t`
  - **blobs**: `size_t`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  getMemoryConsumption(netInputShape) -> weights, blobs
  ```

  """
  @spec getMemoryConsumption(Evision.DNN.Net.t(), list(integer())) :: {integer(), integer()} | {:error, String.t()}
  def getMemoryConsumption(self, netInputShape) when is_list(netInputShape)
  do
    positional = [
      netInputShape: Evision.Internal.Structurise.from_struct(netInputShape)
    ]
    :evision_nif.dnn_dnn_Net_getMemoryConsumption(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns output scale and zeropoint for a quantized Net.
  ##### Return
  - **scales**: `[float]`.

    output parameter for returning output scales.

  - **zeropoints**: `[int]`.

    output parameter for returning output zeropoints.




  Python prototype (for reference): 
  ```python3
  getOutputDetails() -> scales, zeropoints
  ```

  """
  @spec getOutputDetails(Evision.DNN.Net.t()) :: {list(number()), list(integer())} | {:error, String.t()}
  def getOutputDetails(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getOutputDetails(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **layerName**: `String`

  ##### Keyword Arguments
  - **numParam**: `int`.

  ##### Return
  - **retval**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  getParam(layerName[, numParam]) -> retval
  ```

  #### Variant 2:
  Returns parameter blob of the layer.

  ##### Positional Arguments
  - **layer**: `int`.

    name or id of the layer.


  ##### Keyword Arguments
  - **numParam**: `int`.

    index of the layer parameter in the Layer::blobs array.


  ##### Return
  - **retval**: `Evision.Mat`

  @see Layer::blobs


  Python prototype (for reference): 
  ```python3
  getParam(layer[, numParam]) -> retval
  ```


  """
  @spec getParam(Evision.DNN.Net.t(), binary(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def getParam(self, layerName, opts) when is_binary(layerName) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      layerName: Evision.Internal.Structurise.from_struct(layerName)
    ]
    :evision_nif.dnn_dnn_Net_getParam(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec getParam(Evision.DNN.Net.t(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def getParam(self, layer, opts) when is_integer(layer) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      layer: Evision.Internal.Structurise.from_struct(layer)
    ]
    :evision_nif.dnn_dnn_Net_getParam(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **layerName**: `String`

  ##### Keyword Arguments
  - **numParam**: `int`.

  ##### Return
  - **retval**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  getParam(layerName[, numParam]) -> retval
  ```

  #### Variant 2:
  Returns parameter blob of the layer.

  ##### Positional Arguments
  - **layer**: `int`.

    name or id of the layer.


  ##### Keyword Arguments
  - **numParam**: `int`.

    index of the layer parameter in the Layer::blobs array.


  ##### Return
  - **retval**: `Evision.Mat`

  @see Layer::blobs


  Python prototype (for reference): 
  ```python3
  getParam(layer[, numParam]) -> retval
  ```


  """
  @spec getParam(Evision.DNN.Net.t(), binary()) :: Evision.Mat.t() | {:error, String.t()}
  def getParam(self, layerName) when is_binary(layerName)
  do
    positional = [
      layerName: Evision.Internal.Structurise.from_struct(layerName)
    ]
    :evision_nif.dnn_dnn_Net_getParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec getParam(Evision.DNN.Net.t(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def getParam(self, layer) when is_integer(layer)
  do
    positional = [
      layer: Evision.Internal.Structurise.from_struct(layer)
    ]
    :evision_nif.dnn_dnn_Net_getParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns overall time for inference and timings (in ticks) for layers.
  ##### Return
  - **retval**: `int64`
  - **timings**: `[double]`.

    vector for tick timings for all layers.


   Indexes in returned vector correspond to layers ids. Some layers can be fused with others,
   in this case zero ticks count will be return for that skipped layers. Supported by DNN_BACKEND_OPENCV on DNN_TARGET_CPU only.
  @return overall ticks for model inference.

  Python prototype (for reference): 
  ```python3
  getPerfProfile() -> retval, timings
  ```

  """
  @spec getPerfProfile(Evision.DNN.Net.t()) :: {integer(), list(number())} | {:error, String.t()}
  def getPerfProfile(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getPerfProfile(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns indexes of layers with unconnected outputs.
  ##### Return
  - **retval**: `std::vector<int>`

   FIXIT: Rework API to registerOutput() approach, deprecate this call

  Python prototype (for reference): 
  ```python3
  getUnconnectedOutLayers() -> retval
  ```

  """
  @spec getUnconnectedOutLayers(Evision.DNN.Net.t()) :: list(integer()) | {:error, String.t()}
  def getUnconnectedOutLayers(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getUnconnectedOutLayers(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns names of layers with unconnected outputs.
  ##### Return
  - **retval**: `std::vector<String>`

   FIXIT: Rework API to registerOutput() approach, deprecate this call

  Python prototype (for reference): 
  ```python3
  getUnconnectedOutLayersNames() -> retval
  ```

  """
  @spec getUnconnectedOutLayersNames(Evision.DNN.Net.t()) :: list(binary()) | {:error, String.t()}
  def getUnconnectedOutLayersNames(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Net_getUnconnectedOutLayersNames(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns a quantized Net from a floating-point Net.

  ##### Positional Arguments
  - **calibData**: `[Evision.Mat]`.

    Calibration data to compute the quantization parameters.

  - **inputsDtype**: `int`.

    Datatype of quantized net's inputs. Can be CV_32F or CV_8S.

  - **outputsDtype**: `int`.

    Datatype of quantized net's outputs. Can be CV_32F or CV_8S.


  ##### Return
  - **retval**: `Evision.DNN.Net`



  Python prototype (for reference): 
  ```python3
  quantize(calibData, inputsDtype, outputsDtype) -> retval
  ```

  """
  @spec quantize(Evision.DNN.Net.t(), list(Evision.Mat.maybe_mat_in()), integer(), integer()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def quantize(self, calibData, inputsDtype, outputsDtype) when is_list(calibData) and is_integer(inputsDtype) and is_integer(outputsDtype)
  do
    positional = [
      calibData: Evision.Internal.Structurise.from_struct(calibData),
      inputsDtype: Evision.Internal.Structurise.from_struct(inputsDtype),
      outputsDtype: Evision.Internal.Structurise.from_struct(outputsDtype)
    ]
    :evision_nif.dnn_dnn_Net_quantize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Create a network from Intel's Model Optimizer in-memory buffers with intermediate representation (IR).

  ##### Positional Arguments
  - **bufferModelConfig**: `[uchar]`.

    buffer with model's configuration.

  - **bufferWeights**: `[uchar]`.

    buffer with model's trained weights.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.

  Python prototype (for reference): 
  ```python3
  readFromModelOptimizer(bufferModelConfig, bufferWeights) -> retval
  ```

  """
  @spec readFromModelOptimizer(binary(), binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readFromModelOptimizer(bufferModelConfig, bufferWeights) when is_binary(bufferModelConfig) and is_binary(bufferWeights)
  do
    positional = [
      bufferModelConfig: Evision.Internal.Structurise.from_struct(bufferModelConfig),
      bufferWeights: Evision.Internal.Structurise.from_struct(bufferWeights)
    ]
    :evision_nif.dnn_dnn_Net_readFromModelOptimizer_static(positional)
    |> __to_struct__()
  end

  @doc """
  Compile Halide layers.

  ##### Positional Arguments
  - **scheduler**: `String`.

    Path to YAML file with scheduling directives.



  @see `setPreferableBackend/2`
   Schedule layers that support Halide backend. Then compile them for
   specific target. For layers that not represented in scheduling file
   or if no manual scheduling used at all, automatic scheduling will be applied.

  Python prototype (for reference): 
  ```python3
  setHalideScheduler(scheduler) -> None
  ```

  """
  @spec setHalideScheduler(Evision.DNN.Net.t(), binary()) :: :ok | {:error, String.t()}
  def setHalideScheduler(self, scheduler) when is_binary(scheduler)
  do
    positional = [
      scheduler: Evision.Internal.Structurise.from_struct(scheduler)
    ]
    :evision_nif.dnn_dnn_Net_setHalideScheduler(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the new input value for the network

  ##### Positional Arguments
  - **blob**: `Evision.Mat`.

    A new blob. Should have CV_32F or CV_8U depth.


  ##### Keyword Arguments
  - **name**: `String`.

    A name of input layer.

  - **scalefactor**: `double`.

    An optional normalization scale.

  - **mean**: `Scalar`.

    An optional mean subtraction values.



  @see connect(String, String) to know format of the descriptor.
    If scale or mean values are specified, a final input blob is computed
    as:
   \\f[input(n,c,h,w) = scalefactor \\times (blob(n,c,h,w) - mean\\_c)\\f]


  Python prototype (for reference): 
  ```python3
  setInput(blob[, name[, scalefactor[, mean]]]) -> None
  ```

  """
  @spec setInput(Evision.DNN.Net.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def setInput(self, blob, opts) when (is_struct(blob, Evision.Mat) or is_struct(blob, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      blob: Evision.Internal.Structurise.from_struct(blob)
    ]
    :evision_nif.dnn_dnn_Net_setInput(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Sets the new input value for the network

  ##### Positional Arguments
  - **blob**: `Evision.Mat`.

    A new blob. Should have CV_32F or CV_8U depth.


  ##### Keyword Arguments
  - **name**: `String`.

    A name of input layer.

  - **scalefactor**: `double`.

    An optional normalization scale.

  - **mean**: `Scalar`.

    An optional mean subtraction values.



  @see connect(String, String) to know format of the descriptor.
    If scale or mean values are specified, a final input blob is computed
    as:
   \\f[input(n,c,h,w) = scalefactor \\times (blob(n,c,h,w) - mean\\_c)\\f]


  Python prototype (for reference): 
  ```python3
  setInput(blob[, name[, scalefactor[, mean]]]) -> None
  ```

  """
  @spec setInput(Evision.DNN.Net.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setInput(self, blob) when (is_struct(blob, Evision.Mat) or is_struct(blob, Nx.Tensor))
  do
    positional = [
      blob: Evision.Internal.Structurise.from_struct(blob)
    ]
    :evision_nif.dnn_dnn_Net_setInput(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Specify shape of network input.

  ##### Positional Arguments
  - **inputName**: `String`
  - **shape**: `MatShape`



  Python prototype (for reference): 
  ```python3
  setInputShape(inputName, shape) -> None
  ```

  """
  @spec setInputShape(Evision.DNN.Net.t(), binary(), list(integer())) :: :ok | {:error, String.t()}
  def setInputShape(self, inputName, shape) when is_binary(inputName) and is_list(shape)
  do
    positional = [
      inputName: Evision.Internal.Structurise.from_struct(inputName),
      shape: Evision.Internal.Structurise.from_struct(shape)
    ]
    :evision_nif.dnn_dnn_Net_setInputShape(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets outputs names of the network input pseudo layer.

  ##### Positional Arguments
  - **inputBlobNames**: `[String]`


   Each net always has special own the network input pseudo layer with id=0.
   This layer stores the user blobs only and don't make any computations.
   In fact, this layer provides the only way to pass user data into the network.
   As any other layer, this layer can label its outputs and this function provides an easy way to do this.

  Python prototype (for reference): 
  ```python3
  setInputsNames(inputBlobNames) -> None
  ```

  """
  @spec setInputsNames(Evision.DNN.Net.t(), list(binary())) :: :ok | {:error, String.t()}
  def setInputsNames(self, inputBlobNames) when is_list(inputBlobNames)
  do
    positional = [
      inputBlobNames: Evision.Internal.Structurise.from_struct(inputBlobNames)
    ]
    :evision_nif.dnn_dnn_Net_setInputsNames(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **layerName**: `String`
  - **numParam**: `int`
  - **blob**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  setParam(layerName, numParam, blob) -> None
  ```

  #### Variant 2:
  Sets the new value for the learned param of the layer.

  ##### Positional Arguments
  - **layer**: `int`.

    name or id of the layer.

  - **numParam**: `int`.

    index of the layer parameter in the Layer::blobs array.

  - **blob**: `Evision.Mat`.

    the new value.



  @see Layer::blobs
  **Note**: If shape of the new blob differs from the previous shape,
    then the following forward pass may fail.

  Python prototype (for reference): 
  ```python3
  setParam(layer, numParam, blob) -> None
  ```


  """
  @spec setParam(Evision.DNN.Net.t(), binary(), integer(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setParam(self, layerName, numParam, blob) when is_binary(layerName) and is_integer(numParam) and (is_struct(blob, Evision.Mat) or is_struct(blob, Nx.Tensor))
  do
    positional = [
      layerName: Evision.Internal.Structurise.from_struct(layerName),
      numParam: Evision.Internal.Structurise.from_struct(numParam),
      blob: Evision.Internal.Structurise.from_struct(blob)
    ]
    :evision_nif.dnn_dnn_Net_setParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec setParam(Evision.DNN.Net.t(), integer(), integer(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setParam(self, layer, numParam, blob) when is_integer(layer) and is_integer(numParam) and (is_struct(blob, Evision.Mat) or is_struct(blob, Nx.Tensor))
  do
    positional = [
      layer: Evision.Internal.Structurise.from_struct(layer),
      numParam: Evision.Internal.Structurise.from_struct(numParam),
      blob: Evision.Internal.Structurise.from_struct(blob)
    ]
    :evision_nif.dnn_dnn_Net_setParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Ask network to use specific computation backend where it supported.

  ##### Positional Arguments
  - **backendId**: `int`.

    backend identifier.



  @see Backend
   If OpenCV is compiled with Intel's Inference Engine library, DNN_BACKEND_DEFAULT
   means DNN_BACKEND_INFERENCE_ENGINE. Otherwise it equals to DNN_BACKEND_OPENCV.

  Python prototype (for reference): 
  ```python3
  setPreferableBackend(backendId) -> None
  ```

  """
  @spec setPreferableBackend(Evision.DNN.Net.t(), integer()) :: :ok | {:error, String.t()}
  def setPreferableBackend(self, backendId) when is_integer(backendId)
  do
    positional = [
      backendId: Evision.Internal.Structurise.from_struct(backendId)
    ]
    :evision_nif.dnn_dnn_Net_setPreferableBackend(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Ask network to make computations on specific target device.

  ##### Positional Arguments
  - **targetId**: `int`.

    target identifier.



  @see Target
   List of supported combinations backend / target:
   |                        | DNN_BACKEND_OPENCV | DNN_BACKEND_INFERENCE_ENGINE | DNN_BACKEND_HALIDE |  DNN_BACKEND_CUDA |
   |------------------------|--------------------|------------------------------|--------------------|-------------------|
   | DNN_TARGET_CPU         |                  + |                            + |                  + |                   |
   | DNN_TARGET_OPENCL      |                  + |                            + |                  + |                   |
   | DNN_TARGET_OPENCL_FP16 |                  + |                            + |                    |                   |
   | DNN_TARGET_MYRIAD      |                    |                            + |                    |                   |
   | DNN_TARGET_FPGA        |                    |                            + |                    |                   |
   | DNN_TARGET_CUDA        |                    |                              |                    |                 + |
   | DNN_TARGET_CUDA_FP16   |                    |                              |                    |                 + |
   | DNN_TARGET_HDDL        |                    |                            + |                    |                   |

  Python prototype (for reference): 
  ```python3
  setPreferableTarget(targetId) -> None
  ```

  """
  @spec setPreferableTarget(Evision.DNN.Net.t(), integer()) :: :ok | {:error, String.t()}
  def setPreferableTarget(self, targetId) when is_integer(targetId)
  do
    positional = [
      targetId: Evision.Internal.Structurise.from_struct(targetId)
    ]
    :evision_nif.dnn_dnn_Net_setPreferableTarget(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
