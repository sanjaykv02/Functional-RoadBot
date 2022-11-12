defmodule Evision.FaceDetectorYN do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.FaceDetectorYN` struct.

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
  def __to_struct__({:ok, %{class: :FaceDetectorYN, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :FaceDetectorYN, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Creates an instance of this class with given parameters

  ##### Positional Arguments
  - **model**: `String`.

    the path to the requested model

  - **config**: `String`.

    the path to the config file for compability, which is not requested for ONNX models

  - **input_size**: `Size`.

    the size of the input image


  ##### Keyword Arguments
  - **score_threshold**: `float`.

    the threshold to filter out bounding boxes of score smaller than the given value

  - **nms_threshold**: `float`.

    the threshold to suppress bounding boxes of IoU bigger than the given value

  - **top_k**: `int`.

    keep top K bboxes before NMS

  - **backend_id**: `int`.

    the id of backend

  - **target_id**: `int`.

    the id of target device


  ##### Return
  - **retval**: `Evision.FaceDetectorYN`



  Python prototype (for reference): 
  ```python3
  create(model, config, input_size[, score_threshold[, nms_threshold[, top_k[, backend_id[, target_id]]]]]) -> retval
  ```

  """
  @spec create(binary(), binary(), {number(), number()}, [{atom(), term()},...] | nil) :: Evision.FaceDetectorYN.t() | {:error, String.t()}
  def create(model, config, input_size, opts) when is_binary(model) and is_binary(config) and is_tuple(input_size) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model),
      config: Evision.Internal.Structurise.from_struct(config),
      input_size: Evision.Internal.Structurise.from_struct(input_size)
    ]
    :evision_nif.faceDetectorYN_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates an instance of this class with given parameters

  ##### Positional Arguments
  - **model**: `String`.

    the path to the requested model

  - **config**: `String`.

    the path to the config file for compability, which is not requested for ONNX models

  - **input_size**: `Size`.

    the size of the input image


  ##### Keyword Arguments
  - **score_threshold**: `float`.

    the threshold to filter out bounding boxes of score smaller than the given value

  - **nms_threshold**: `float`.

    the threshold to suppress bounding boxes of IoU bigger than the given value

  - **top_k**: `int`.

    keep top K bboxes before NMS

  - **backend_id**: `int`.

    the id of backend

  - **target_id**: `int`.

    the id of target device


  ##### Return
  - **retval**: `Evision.FaceDetectorYN`



  Python prototype (for reference): 
  ```python3
  create(model, config, input_size[, score_threshold[, nms_threshold[, top_k[, backend_id[, target_id]]]]]) -> retval
  ```

  """
  @spec create(binary(), binary(), {number(), number()}) :: Evision.FaceDetectorYN.t() | {:error, String.t()}
  def create(model, config, input_size) when is_binary(model) and is_binary(config) and is_tuple(input_size)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model),
      config: Evision.Internal.Structurise.from_struct(config),
      input_size: Evision.Internal.Structurise.from_struct(input_size)
    ]
    :evision_nif.faceDetectorYN_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  A simple interface to detect face from given image

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    an image to detect


  ##### Return
  - **retval**: `int`
  - **faces**: `Evision.Mat`.

    detection results stored in a cv::Mat




  Python prototype (for reference): 
  ```python3
  detect(image[, faces]) -> retval, faces
  ```

  """
  @spec detect(Evision.FaceDetectorYN.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.faceDetectorYN_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  A simple interface to detect face from given image

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    an image to detect


  ##### Return
  - **retval**: `int`
  - **faces**: `Evision.Mat`.

    detection results stored in a cv::Mat




  Python prototype (for reference): 
  ```python3
  detect(image[, faces]) -> retval, faces
  ```

  """
  @spec detect(Evision.FaceDetectorYN.t(), Evision.Mat.maybe_mat_in()) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.faceDetectorYN_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Size`


  Python prototype (for reference): 
  ```python3
  getInputSize() -> retval
  ```

  """
  @spec getInputSize(Evision.FaceDetectorYN.t()) :: {number(), number()} | {:error, String.t()}
  def getInputSize(self) do
    positional = [
    ]
    :evision_nif.faceDetectorYN_getInputSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getNMSThreshold() -> retval
  ```

  """
  @spec getNMSThreshold(Evision.FaceDetectorYN.t()) :: number() | {:error, String.t()}
  def getNMSThreshold(self) do
    positional = [
    ]
    :evision_nif.faceDetectorYN_getNMSThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getScoreThreshold() -> retval
  ```

  """
  @spec getScoreThreshold(Evision.FaceDetectorYN.t()) :: number() | {:error, String.t()}
  def getScoreThreshold(self) do
    positional = [
    ]
    :evision_nif.faceDetectorYN_getScoreThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getTopK() -> retval
  ```

  """
  @spec getTopK(Evision.FaceDetectorYN.t()) :: integer() | {:error, String.t()}
  def getTopK(self) do
    positional = [
    ]
    :evision_nif.faceDetectorYN_getTopK(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the size for the network input, which overwrites the input size of creating model. Call this method when the size of input image does not match the input size when creating model

  ##### Positional Arguments
  - **input_size**: `Size`.

    the size of the input image





  Python prototype (for reference): 
  ```python3
  setInputSize(input_size) -> None
  ```

  """
  @spec setInputSize(Evision.FaceDetectorYN.t(), {number(), number()}) :: :ok | {:error, String.t()}
  def setInputSize(self, input_size) when is_tuple(input_size)
  do
    positional = [
      input_size: Evision.Internal.Structurise.from_struct(input_size)
    ]
    :evision_nif.faceDetectorYN_setInputSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the Non-maximum-suppression threshold to suppress bounding boxes that have IoU greater than the given value

  ##### Positional Arguments
  - **nms_threshold**: `float`.

    threshold for NMS operation





  Python prototype (for reference): 
  ```python3
  setNMSThreshold(nms_threshold) -> None
  ```

  """
  @spec setNMSThreshold(Evision.FaceDetectorYN.t(), number()) :: :ok | {:error, String.t()}
  def setNMSThreshold(self, nms_threshold) when is_float(nms_threshold)
  do
    positional = [
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.faceDetectorYN_setNMSThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the score threshold to filter out bounding boxes of score less than the given value

  ##### Positional Arguments
  - **score_threshold**: `float`.

    threshold for filtering out bounding boxes





  Python prototype (for reference): 
  ```python3
  setScoreThreshold(score_threshold) -> None
  ```

  """
  @spec setScoreThreshold(Evision.FaceDetectorYN.t(), number()) :: :ok | {:error, String.t()}
  def setScoreThreshold(self, score_threshold) when is_float(score_threshold)
  do
    positional = [
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold)
    ]
    :evision_nif.faceDetectorYN_setScoreThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set the number of bounding boxes preserved before NMS

  ##### Positional Arguments
  - **top_k**: `int`.

    the number of bounding boxes to preserve from top rank based on score





  Python prototype (for reference): 
  ```python3
  setTopK(top_k) -> None
  ```

  """
  @spec setTopK(Evision.FaceDetectorYN.t(), integer()) :: :ok | {:error, String.t()}
  def setTopK(self, top_k) when is_integer(top_k)
  do
    positional = [
      top_k: Evision.Internal.Structurise.from_struct(top_k)
    ]
    :evision_nif.faceDetectorYN_setTopK(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
