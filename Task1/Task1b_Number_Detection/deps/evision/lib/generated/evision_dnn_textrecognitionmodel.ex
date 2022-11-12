defmodule Evision.DNN.TextRecognitionModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.TextRecognitionModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.TextRecognitionModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.TextRecognitionModel", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Create text recognition model from network represented in one of the supported formats
  Call setDecodeType() and setVocabulary() after constructor to initialize the decoding method


  ##### Positional Arguments
  - **model**: `string`.

    Binary file contains trained weights


  ##### Keyword Arguments
  - **config**: `string`.

    Text file contains network configuration


  ##### Return
  - **self**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  TextRecognitionModel(model[, config]) -> <dnn_TextRecognitionModel object>
  ```

  """
  @spec textRecognitionModel(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def textRecognitionModel(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_TextRecognitionModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Create text recognition model from network represented in one of the supported formats
  Call setDecodeType() and setVocabulary() after constructor to initialize the decoding method


  ##### Positional Arguments
  - **model**: `string`.

    Binary file contains trained weights


  ##### Keyword Arguments
  - **config**: `string`.

    Text file contains network configuration


  ##### Return
  - **self**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  TextRecognitionModel(model[, config]) -> <dnn_TextRecognitionModel object>
  ```

  #### Variant 2:
  Create Text Recognition model from deep learning network
  Call setDecodeType() and setVocabulary() after constructor to initialize the decoding method


  ##### Positional Arguments
  - **network**: `Evision.DNN.Net`.

    Net object


  ##### Return
  - **self**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  TextRecognitionModel(network) -> <dnn_TextRecognitionModel object>
  ```


  """
  @spec textRecognitionModel(binary()) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def textRecognitionModel(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_TextRecognitionModel(positional)
    |> __to_struct__()
  end
  @spec textRecognitionModel(Evision.DNN.Net.t()) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def textRecognitionModel(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_TextRecognitionModel(positional)
    |> __to_struct__()
  end

  @doc """
  Get the decoding method
  ##### Return
  - **retval**: `String`

  @return the decoding method

  Python prototype (for reference): 
  ```python3
  getDecodeType() -> retval
  ```

  """
  @spec getDecodeType(Evision.DNN.TextRecognitionModel.t()) :: binary() | {:error, String.t()}
  def getDecodeType(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_getDecodeType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Get the vocabulary for recognition.
  ##### Return
  - **retval**: `std::vector<std::string>`

  @return vocabulary the associated vocabulary

  Python prototype (for reference): 
  ```python3
  getVocabulary() -> retval
  ```

  """
  @spec getVocabulary(Evision.DNN.TextRecognitionModel.t()) :: list(binary()) | {:error, String.t()}
  def getVocabulary(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_getVocabulary(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return recognition result

  ##### Positional Arguments
  - **frame**: `Evision.Mat`.

    The input image

  - **roiRects**: `[Evision.Mat]`.

    List of text detection regions of interest (cv::Rect, CV_32SC4). ROIs is be cropped as the network inputs


  ##### Return
  - **results**: `[string]`.

    A set of text recognition results.




  Python prototype (for reference): 
  ```python3
  recognize(frame, roiRects) -> results
  ```

  """
  @spec recognize(Evision.DNN.TextRecognitionModel.t(), Evision.Mat.maybe_mat_in(), list(Evision.Mat.maybe_mat_in())) :: list(binary()) | {:error, String.t()}
  def recognize(self, frame, roiRects) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor)) and is_list(roiRects)
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame),
      roiRects: Evision.Internal.Structurise.from_struct(roiRects)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_recognize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return recognition result

  ##### Positional Arguments
  - **frame**: `Evision.Mat`.

    The input image


  ##### Return
  - **retval**: `String`

  @return The text recognition result

  Python prototype (for reference): 
  ```python3
  recognize(frame) -> retval
  ```

  """
  @spec recognize(Evision.DNN.TextRecognitionModel.t(), Evision.Mat.maybe_mat_in()) :: binary() | {:error, String.t()}
  def recognize(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_recognize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the decoding method options for `"CTC-prefix-beam-search"` decode usage

  ##### Positional Arguments
  - **beamSize**: `int`.

    Beam size for search


  ##### Keyword Arguments
  - **vocPruneSize**: `int`.

    Parameter to optimize big vocabulary search,
    only take top @p vocPruneSize tokens in each search step, @p vocPruneSize <= 0 stands for disable this prune.


  ##### Return
  - **retval**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  setDecodeOptsCTCPrefixBeamSearch(beamSize[, vocPruneSize]) -> retval
  ```

  """
  @spec setDecodeOptsCTCPrefixBeamSearch(Evision.DNN.TextRecognitionModel.t(), integer(), [{atom(), term()},...] | nil) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def setDecodeOptsCTCPrefixBeamSearch(self, beamSize, opts) when is_integer(beamSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      beamSize: Evision.Internal.Structurise.from_struct(beamSize)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_setDecodeOptsCTCPrefixBeamSearch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Set the decoding method options for `"CTC-prefix-beam-search"` decode usage

  ##### Positional Arguments
  - **beamSize**: `int`.

    Beam size for search


  ##### Keyword Arguments
  - **vocPruneSize**: `int`.

    Parameter to optimize big vocabulary search,
    only take top @p vocPruneSize tokens in each search step, @p vocPruneSize <= 0 stands for disable this prune.


  ##### Return
  - **retval**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  setDecodeOptsCTCPrefixBeamSearch(beamSize[, vocPruneSize]) -> retval
  ```

  """
  @spec setDecodeOptsCTCPrefixBeamSearch(Evision.DNN.TextRecognitionModel.t(), integer()) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def setDecodeOptsCTCPrefixBeamSearch(self, beamSize) when is_integer(beamSize)
  do
    positional = [
      beamSize: Evision.Internal.Structurise.from_struct(beamSize)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_setDecodeOptsCTCPrefixBeamSearch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the decoding method of translating the network output into string

  ##### Positional Arguments
  - **decodeType**: `string`.

    The decoding method of translating the network output into string, currently supported type:
    - `"CTC-greedy"` greedy decoding for the output of CTC-based methods
    - `"CTC-prefix-beam-search"` Prefix beam search decoding for the output of CTC-based methods


  ##### Return
  - **retval**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  setDecodeType(decodeType) -> retval
  ```

  """
  @spec setDecodeType(Evision.DNN.TextRecognitionModel.t(), binary()) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def setDecodeType(self, decodeType) when is_binary(decodeType)
  do
    positional = [
      decodeType: Evision.Internal.Structurise.from_struct(decodeType)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_setDecodeType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the vocabulary for recognition.

  ##### Positional Arguments
  - **vocabulary**: `[string]`.

    the associated vocabulary of the network.


  ##### Return
  - **retval**: `Evision.DNN.TextRecognitionModel`



  Python prototype (for reference): 
  ```python3
  setVocabulary(vocabulary) -> retval
  ```

  """
  @spec setVocabulary(Evision.DNN.TextRecognitionModel.t(), list(binary())) :: Evision.DNN.TextRecognitionModel.t() | {:error, String.t()}
  def setVocabulary(self, vocabulary) when is_list(vocabulary)
  do
    positional = [
      vocabulary: Evision.Internal.Structurise.from_struct(vocabulary)
    ]
    :evision_nif.dnn_dnn_TextRecognitionModel_setVocabulary(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
