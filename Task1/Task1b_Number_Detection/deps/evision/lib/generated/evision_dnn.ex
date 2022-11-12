defmodule Evision.DNN do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN` struct.

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
  def __to_struct__({:ok, %{class: :DNN, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :DNN, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Performs non maximum suppression given boxes and corresponding scores.

  ##### Positional Arguments
  - **bboxes**: `[Rect2d]`.

    a set of bounding boxes to apply NMS.

  - **scores**: `[float]`.

    a set of corresponding confidences.

  - **score_threshold**: `float`.

    a threshold used to filter boxes by score.

  - **nms_threshold**: `float`.

    a threshold used in non maximum suppression.


  ##### Keyword Arguments
  - **eta**: `float`.

    a coefficient in adaptive threshold formula: \\f$nms\\_threshold_{i+1}=eta\\cdot nms\\_threshold_i\\f$.

  - **top_k**: `int`.

    if `>0`, keep at most @p top_k picked indices.


  ##### Return
  - **indices**: `[int]`.

    the kept indices of bboxes after NMS.




  Python prototype (for reference): 
  ```python3
  NMSBoxes(bboxes, scores, score_threshold, nms_threshold[, eta[, top_k]]) -> indices
  ```

  """
  @spec nmsBoxes(list({number(), number(), number(), number()}), list(number()), number(), number(), [{atom(), term()},...] | nil) :: list(integer()) | {:error, String.t()}
  def nmsBoxes(bboxes, scores, score_threshold, nms_threshold, opts) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_NMSBoxes(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs non maximum suppression given boxes and corresponding scores.

  ##### Positional Arguments
  - **bboxes**: `[Rect2d]`.

    a set of bounding boxes to apply NMS.

  - **scores**: `[float]`.

    a set of corresponding confidences.

  - **score_threshold**: `float`.

    a threshold used to filter boxes by score.

  - **nms_threshold**: `float`.

    a threshold used in non maximum suppression.


  ##### Keyword Arguments
  - **eta**: `float`.

    a coefficient in adaptive threshold formula: \\f$nms\\_threshold_{i+1}=eta\\cdot nms\\_threshold_i\\f$.

  - **top_k**: `int`.

    if `>0`, keep at most @p top_k picked indices.


  ##### Return
  - **indices**: `[int]`.

    the kept indices of bboxes after NMS.




  Python prototype (for reference): 
  ```python3
  NMSBoxes(bboxes, scores, score_threshold, nms_threshold[, eta[, top_k]]) -> indices
  ```

  """
  @spec nmsBoxes(list({number(), number(), number(), number()}), list(number()), number(), number()) :: list(integer()) | {:error, String.t()}
  def nmsBoxes(bboxes, scores, score_threshold, nms_threshold) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold)
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_NMSBoxes(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **bboxes**: `[{centre={x, y}, size={s1, s2}, angle}]`
  - **scores**: `[float]`
  - **score_threshold**: `float`
  - **nms_threshold**: `float`

  ##### Keyword Arguments
  - **eta**: `float`.
  - **top_k**: `int`.

  ##### Return
  - **indices**: `[int]`



  Python prototype (for reference): 
  ```python3
  NMSBoxesRotated(bboxes, scores, score_threshold, nms_threshold[, eta[, top_k]]) -> indices
  ```

  """
  @spec nmsBoxesRotated(list({{number(), number()}, {number(), number()}, number()}), list(number()), number(), number(), [{atom(), term()},...] | nil) :: list(integer()) | {:error, String.t()}
  def nmsBoxesRotated(bboxes, scores, score_threshold, nms_threshold, opts) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_NMSBoxesRotated(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **bboxes**: `[{centre={x, y}, size={s1, s2}, angle}]`
  - **scores**: `[float]`
  - **score_threshold**: `float`
  - **nms_threshold**: `float`

  ##### Keyword Arguments
  - **eta**: `float`.
  - **top_k**: `int`.

  ##### Return
  - **indices**: `[int]`



  Python prototype (for reference): 
  ```python3
  NMSBoxesRotated(bboxes, scores, score_threshold, nms_threshold[, eta[, top_k]]) -> indices
  ```

  """
  @spec nmsBoxesRotated(list({{number(), number()}, {number(), number()}, number()}), list(number()), number(), number()) :: list(integer()) | {:error, String.t()}
  def nmsBoxesRotated(bboxes, scores, score_threshold, nms_threshold) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold)
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_NMSBoxesRotated(positional)
    |> __to_struct__()
  end

  @doc """
  Creates 4-dimensional blob from image. Optionally resizes and crops @p image from center,
  subtract @p mean values, scales values by @p scalefactor, swap Blue and Red channels.


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    input image (with 1-, 3- or 4-channels).


  ##### Keyword Arguments
  - **scalefactor**: `double`.

    multiplier for @p image values.

  - **size**: `Size`.

    spatial size for output image

  - **mean**: `Scalar`.

    scalar with mean values which are subtracted from channels. Values are intended
    to be in (mean-R, mean-G, mean-B) order if @p image has BGR ordering and @p swapRB is true.

  - **swapRB**: `bool`.

    flag which indicates that swap first and last channels
    in 3-channel image is necessary.

  - **crop**: `bool`.

    flag which indicates whether image will be cropped after resize or not

  - **ddepth**: `int`.

    Depth of output blob. Choose CV_32F or CV_8U.


  ##### Return
  - **retval**: `Evision.Mat`

  @details if @p crop is true, input image is resized so one side after resize is equal to corresponding
    dimension in @p size and another one is equal or larger. Then, crop from the center is performed.
    If @p crop is false, direct resize without cropping and preserving aspect ratio is performed.
  @returns 4-dimensional Mat with NCHW dimensions order.


  Python prototype (for reference): 
  ```python3
  blobFromImage(image[, scalefactor[, size[, mean[, swapRB[, crop[, ddepth]]]]]]) -> retval
  ```

  """
  @spec blobFromImage(Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def blobFromImage(image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.dnn_blobFromImage(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates 4-dimensional blob from image. Optionally resizes and crops @p image from center,
  subtract @p mean values, scales values by @p scalefactor, swap Blue and Red channels.


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    input image (with 1-, 3- or 4-channels).


  ##### Keyword Arguments
  - **scalefactor**: `double`.

    multiplier for @p image values.

  - **size**: `Size`.

    spatial size for output image

  - **mean**: `Scalar`.

    scalar with mean values which are subtracted from channels. Values are intended
    to be in (mean-R, mean-G, mean-B) order if @p image has BGR ordering and @p swapRB is true.

  - **swapRB**: `bool`.

    flag which indicates that swap first and last channels
    in 3-channel image is necessary.

  - **crop**: `bool`.

    flag which indicates whether image will be cropped after resize or not

  - **ddepth**: `int`.

    Depth of output blob. Choose CV_32F or CV_8U.


  ##### Return
  - **retval**: `Evision.Mat`

  @details if @p crop is true, input image is resized so one side after resize is equal to corresponding
    dimension in @p size and another one is equal or larger. Then, crop from the center is performed.
    If @p crop is false, direct resize without cropping and preserving aspect ratio is performed.
  @returns 4-dimensional Mat with NCHW dimensions order.


  Python prototype (for reference): 
  ```python3
  blobFromImage(image[, scalefactor[, size[, mean[, swapRB[, crop[, ddepth]]]]]]) -> retval
  ```

  """
  @spec blobFromImage(Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def blobFromImage(image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.dnn_blobFromImage(positional)
    |> __to_struct__()
  end

  @doc """
  Creates 4-dimensional blob from series of images. Optionally resizes and
  crops @p images from center, subtract @p mean values, scales values by @p scalefactor,
  swap Blue and Red channels.


  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    input images (all with 1-, 3- or 4-channels).


  ##### Keyword Arguments
  - **scalefactor**: `double`.

    multiplier for @p images values.

  - **size**: `Size`.

    spatial size for output image

  - **mean**: `Scalar`.

    scalar with mean values which are subtracted from channels. Values are intended
    to be in (mean-R, mean-G, mean-B) order if @p image has BGR ordering and @p swapRB is true.

  - **swapRB**: `bool`.

    flag which indicates that swap first and last channels
    in 3-channel image is necessary.

  - **crop**: `bool`.

    flag which indicates whether image will be cropped after resize or not

  - **ddepth**: `int`.

    Depth of output blob. Choose CV_32F or CV_8U.


  ##### Return
  - **retval**: `Evision.Mat`

  @details if @p crop is true, input image is resized so one side after resize is equal to corresponding
    dimension in @p size and another one is equal or larger. Then, crop from the center is performed.
    If @p crop is false, direct resize without cropping and preserving aspect ratio is performed.
  @returns 4-dimensional Mat with NCHW dimensions order.


  Python prototype (for reference): 
  ```python3
  blobFromImages(images[, scalefactor[, size[, mean[, swapRB[, crop[, ddepth]]]]]]) -> retval
  ```

  """
  @spec blobFromImages(list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def blobFromImages(images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.dnn_blobFromImages(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates 4-dimensional blob from series of images. Optionally resizes and
  crops @p images from center, subtract @p mean values, scales values by @p scalefactor,
  swap Blue and Red channels.


  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    input images (all with 1-, 3- or 4-channels).


  ##### Keyword Arguments
  - **scalefactor**: `double`.

    multiplier for @p images values.

  - **size**: `Size`.

    spatial size for output image

  - **mean**: `Scalar`.

    scalar with mean values which are subtracted from channels. Values are intended
    to be in (mean-R, mean-G, mean-B) order if @p image has BGR ordering and @p swapRB is true.

  - **swapRB**: `bool`.

    flag which indicates that swap first and last channels
    in 3-channel image is necessary.

  - **crop**: `bool`.

    flag which indicates whether image will be cropped after resize or not

  - **ddepth**: `int`.

    Depth of output blob. Choose CV_32F or CV_8U.


  ##### Return
  - **retval**: `Evision.Mat`

  @details if @p crop is true, input image is resized so one side after resize is equal to corresponding
    dimension in @p size and another one is equal or larger. Then, crop from the center is performed.
    If @p crop is false, direct resize without cropping and preserving aspect ratio is performed.
  @returns 4-dimensional Mat with NCHW dimensions order.


  Python prototype (for reference): 
  ```python3
  blobFromImages(images[, scalefactor[, size[, mean[, swapRB[, crop[, ddepth]]]]]]) -> retval
  ```

  """
  @spec blobFromImages(list(Evision.Mat.maybe_mat_in())) :: Evision.Mat.t() | {:error, String.t()}
  def blobFromImages(images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.dnn_blobFromImages(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **be**: `dnn_Backend`

  ##### Return
  - **retval**: `std::vector<Target>`


  Python prototype (for reference): 
  ```python3
  getAvailableTargets(be) -> retval
  ```

  """
  @spec getAvailableTargets(integer()) :: list(integer()) | {:error, String.t()}
  def getAvailableTargets(be) when is_integer(be)
  do
    positional = [
      be: Evision.Internal.Structurise.from_struct(be)
    ]
    :evision_nif.dnn_getAvailableTargets(positional)
    |> __to_struct__()
  end

  @doc """
  Parse a 4D blob and output the images it contains as 2D arrays through a simpler data structure
  (std::vector<cv::Mat>).


  ##### Positional Arguments
  - **blob_**: `Evision.Mat`.

    4 dimensional array (images, channels, height, width) in floating point precision (CV_32F) from
    which you would like to extract the images.


  ##### Return
  - **images_**: `[Evision.Mat]`.

    array of 2D Mat containing the images extracted from the blob in floating point precision
    (CV_32F). They are non normalized neither mean added. The number of returned images equals the first dimension
    of the blob (batch size). Every image has a number of channels equals to the second dimension of the blob (depth).




  Python prototype (for reference): 
  ```python3
  imagesFromBlob(blob_[, images_]) -> images_
  ```

  """
  @spec imagesFromBlob(Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def imagesFromBlob(blob_, opts) when (is_struct(blob_, Evision.Mat) or is_struct(blob_, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      blob_: Evision.Internal.Structurise.from_struct(blob_)
    ]
    :evision_nif.dnn_imagesFromBlob(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Parse a 4D blob and output the images it contains as 2D arrays through a simpler data structure
  (std::vector<cv::Mat>).


  ##### Positional Arguments
  - **blob_**: `Evision.Mat`.

    4 dimensional array (images, channels, height, width) in floating point precision (CV_32F) from
    which you would like to extract the images.


  ##### Return
  - **images_**: `[Evision.Mat]`.

    array of 2D Mat containing the images extracted from the blob in floating point precision
    (CV_32F). They are non normalized neither mean added. The number of returned images equals the first dimension
    of the blob (batch size). Every image has a number of channels equals to the second dimension of the blob (depth).




  Python prototype (for reference): 
  ```python3
  imagesFromBlob(blob_[, images_]) -> images_
  ```

  """
  @spec imagesFromBlob(Evision.Mat.maybe_mat_in()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def imagesFromBlob(blob_) when (is_struct(blob_, Evision.Mat) or is_struct(blob_, Nx.Tensor))
  do
    positional = [
      blob_: Evision.Internal.Structurise.from_struct(blob_)
    ]
    :evision_nif.dnn_imagesFromBlob(positional)
    |> __to_struct__()
  end

  @doc """
  Read deep learning network represented in one of the supported formats.

  ##### Positional Arguments
  - **framework**: `String`.

    Name of origin framework.

  - **bufferModel**: `[uchar]`.

    A buffer with a content of binary file with weights


  ##### Keyword Arguments
  - **bufferConfig**: `[uchar]`.

    A buffer with a content of text file contains network configuration.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @details This is an overloaded member function, provided for convenience.
            It differs from the above function only in what argument(s) it accepts.
  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNet(framework, bufferModel[, bufferConfig]) -> retval
  ```

  """
  @spec readNet(binary(), binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNet(framework, bufferModel, opts) when is_binary(framework) and is_binary(bufferModel) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      framework: Evision.Internal.Structurise.from_struct(framework),
      bufferModel: Evision.Internal.Structurise.from_struct(bufferModel)
    ]
    :evision_nif.dnn_readNet(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Read deep learning network represented in one of the supported formats.

  ##### Positional Arguments
  - **framework**: `String`.

    Name of origin framework.

  - **bufferModel**: `[uchar]`.

    A buffer with a content of binary file with weights


  ##### Keyword Arguments
  - **bufferConfig**: `[uchar]`.

    A buffer with a content of text file contains network configuration.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @details This is an overloaded member function, provided for convenience.
            It differs from the above function only in what argument(s) it accepts.
  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNet(framework, bufferModel[, bufferConfig]) -> retval
  ```

  #### Variant 2:
  Read deep learning network represented in one of the supported formats.

  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights. The following file
    extensions are expected for models from different frameworks:
    * `*.caffemodel` (Caffe, http://caffe.berkeleyvision.org/)
      * `*.pb` (TensorFlow, https://www.tensorflow.org/)
        * `*.t7` | `*.net` (Torch, http://torch.ch/)
          * `*.weights` (Darknet, https://pjreddie.com/darknet/)
            * `*.bin` (DLDT, https://software.intel.com/openvino-toolkit)
              * `*.onnx` (ONNX, https://onnx.ai/)


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration. It could be a
    file with the following extensions:
    * `*.prototxt` (Caffe, http://caffe.berkeleyvision.org/)
      * `*.pbtxt` (TensorFlow, https://www.tensorflow.org/)
        * `*.cfg` (Darknet, https://pjreddie.com/darknet/)
          * `*.xml` (DLDT, https://software.intel.com/openvino-toolkit)

  - **framework**: `String`.

    Explicit framework name tag to determine a format.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
   This function automatically detects an origin framework of trained model
   and calls an appropriate function such @ref readNetFromCaffe, @ref readNetFromTensorflow,
  @ref readNetFromTorch or @ref readNetFromDarknet. An order of @p model and @p config
   arguments does not matter.


  Python prototype (for reference): 
  ```python3
  readNet(model[, config[, framework]]) -> retval
  ```


  """
  @spec readNet(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNet(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNet(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec readNet(binary(), binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNet(framework, bufferModel) when is_binary(framework) and is_binary(bufferModel)
  do
    positional = [
      framework: Evision.Internal.Structurise.from_struct(framework),
      bufferModel: Evision.Internal.Structurise.from_struct(bufferModel)
    ]
    :evision_nif.dnn_readNet(positional)
    |> __to_struct__()
  end

  @doc """
  Read deep learning network represented in one of the supported formats.

  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights. The following file
    extensions are expected for models from different frameworks:
    * `*.caffemodel` (Caffe, http://caffe.berkeleyvision.org/)
      * `*.pb` (TensorFlow, https://www.tensorflow.org/)
        * `*.t7` | `*.net` (Torch, http://torch.ch/)
          * `*.weights` (Darknet, https://pjreddie.com/darknet/)
            * `*.bin` (DLDT, https://software.intel.com/openvino-toolkit)
              * `*.onnx` (ONNX, https://onnx.ai/)


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration. It could be a
    file with the following extensions:
    * `*.prototxt` (Caffe, http://caffe.berkeleyvision.org/)
      * `*.pbtxt` (TensorFlow, https://www.tensorflow.org/)
        * `*.cfg` (Darknet, https://pjreddie.com/darknet/)
          * `*.xml` (DLDT, https://software.intel.com/openvino-toolkit)

  - **framework**: `String`.

    Explicit framework name tag to determine a format.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
   This function automatically detects an origin framework of trained model
   and calls an appropriate function such @ref readNetFromCaffe, @ref readNetFromTensorflow,
  @ref readNetFromTorch or @ref readNetFromDarknet. An order of @p model and @p config
   arguments does not matter.


  Python prototype (for reference): 
  ```python3
  readNet(model[, config[, framework]]) -> retval
  ```

  """
  @spec readNet(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNet(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNet(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in Caffe model in memory.

  ##### Positional Arguments
  - **bufferProto**: `[uchar]`.

    buffer containing the content of the .prototxt file


  ##### Keyword Arguments
  - **bufferModel**: `[uchar]`.

    buffer containing the content of the .caffemodel file


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromCaffe(bufferProto[, bufferModel]) -> retval
  ```

  """
  @spec readNetFromCaffeBuffer(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromCaffeBuffer(bufferProto, opts) when is_binary(bufferProto) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bufferProto: Evision.Internal.Structurise.from_struct(bufferProto)
    ]
    :evision_nif.dnn_readNetFromCaffe(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in Caffe model in memory.

  ##### Positional Arguments
  - **bufferProto**: `[uchar]`.

    buffer containing the content of the .prototxt file


  ##### Keyword Arguments
  - **bufferModel**: `[uchar]`.

    buffer containing the content of the .caffemodel file


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromCaffe(bufferProto[, bufferModel]) -> retval
  ```

  """
  @spec readNetFromCaffeBuffer(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromCaffeBuffer(bufferProto) when is_binary(bufferProto)
  do
    positional = [
      bufferProto: Evision.Internal.Structurise.from_struct(bufferProto)
    ]
    :evision_nif.dnn_readNetFromCaffe(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="http://caffe.berkeleyvision.org">Caffe</a> framework's format.

  ##### Positional Arguments
  - **prototxt**: `String`.

    path to the .prototxt file with text description of the network architecture.


  ##### Keyword Arguments
  - **caffeModel**: `String`.

    path to the .caffemodel file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromCaffe(prototxt[, caffeModel]) -> retval
  ```

  """
  @spec readNetFromCaffe(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromCaffe(prototxt, opts) when is_binary(prototxt) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      prototxt: Evision.Internal.Structurise.from_struct(prototxt)
    ]
    :evision_nif.dnn_readNetFromCaffe(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="http://caffe.berkeleyvision.org">Caffe</a> framework's format.

  ##### Positional Arguments
  - **prototxt**: `String`.

    path to the .prototxt file with text description of the network architecture.


  ##### Keyword Arguments
  - **caffeModel**: `String`.

    path to the .caffemodel file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromCaffe(prototxt[, caffeModel]) -> retval
  ```

  """
  @spec readNetFromCaffe(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromCaffe(prototxt) when is_binary(prototxt)
  do
    positional = [
      prototxt: Evision.Internal.Structurise.from_struct(prototxt)
    ]
    :evision_nif.dnn_readNetFromCaffe(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://pjreddie.com/darknet/">Darknet</a> model files.

  ##### Positional Arguments
  - **bufferCfg**: `[uchar]`.

    A buffer contains a content of .cfg file with text description of the network architecture.


  ##### Keyword Arguments
  - **bufferModel**: `[uchar]`.

    A buffer contains a content of .weights file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromDarknet(bufferCfg[, bufferModel]) -> retval
  ```

  """
  @spec readNetFromDarknetBuffer(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromDarknetBuffer(bufferCfg, opts) when is_binary(bufferCfg) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bufferCfg: Evision.Internal.Structurise.from_struct(bufferCfg)
    ]
    :evision_nif.dnn_readNetFromDarknet(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://pjreddie.com/darknet/">Darknet</a> model files.

  ##### Positional Arguments
  - **bufferCfg**: `[uchar]`.

    A buffer contains a content of .cfg file with text description of the network architecture.


  ##### Keyword Arguments
  - **bufferModel**: `[uchar]`.

    A buffer contains a content of .weights file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromDarknet(bufferCfg[, bufferModel]) -> retval
  ```

  """
  @spec readNetFromDarknetBuffer(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromDarknetBuffer(bufferCfg) when is_binary(bufferCfg)
  do
    positional = [
      bufferCfg: Evision.Internal.Structurise.from_struct(bufferCfg)
    ]
    :evision_nif.dnn_readNetFromDarknet(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://pjreddie.com/darknet/">Darknet</a> model files.

  ##### Positional Arguments
  - **cfgFile**: `String`.

    path to the .cfg file with text description of the network architecture.


  ##### Keyword Arguments
  - **darknetModel**: `String`.

    path to the .weights file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Network object that ready to do forward, throw an exception in failure cases.
  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromDarknet(cfgFile[, darknetModel]) -> retval
  ```

  """
  @spec readNetFromDarknet(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromDarknet(cfgFile, opts) when is_binary(cfgFile) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      cfgFile: Evision.Internal.Structurise.from_struct(cfgFile)
    ]
    :evision_nif.dnn_readNetFromDarknet(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://pjreddie.com/darknet/">Darknet</a> model files.

  ##### Positional Arguments
  - **cfgFile**: `String`.

    path to the .cfg file with text description of the network architecture.


  ##### Keyword Arguments
  - **darknetModel**: `String`.

    path to the .weights file with learned network.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Network object that ready to do forward, throw an exception in failure cases.
  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromDarknet(cfgFile[, darknetModel]) -> retval
  ```

  """
  @spec readNetFromDarknet(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromDarknet(cfgFile) when is_binary(cfgFile)
  do
    positional = [
      cfgFile: Evision.Internal.Structurise.from_struct(cfgFile)
    ]
    :evision_nif.dnn_readNetFromDarknet(positional)
    |> __to_struct__()
  end

  @doc """
  Load a network from Intel's Model Optimizer intermediate representation.

  ##### Positional Arguments
  - **bufferModelConfig**: `[uchar]`.

    Buffer contains XML configuration with network's topology.

  - **bufferWeights**: `[uchar]`.

    Buffer contains binary data with trained weights.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
    Networks imported from Intel's Model Optimizer are launched in Intel's Inference Engine
    backend.

  Python prototype (for reference): 
  ```python3
  readNetFromModelOptimizer(bufferModelConfig, bufferWeights) -> retval
  ```

  """
  @spec readNetFromModelOptimizerBuffer(binary(), binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromModelOptimizerBuffer(bufferModelConfig, bufferWeights) when is_binary(bufferModelConfig) and is_binary(bufferWeights)
  do
    positional = [
      bufferModelConfig: Evision.Internal.Structurise.from_struct(bufferModelConfig),
      bufferWeights: Evision.Internal.Structurise.from_struct(bufferWeights)
    ]
    :evision_nif.dnn_readNetFromModelOptimizer(positional)
    |> __to_struct__()
  end

  @doc """
  Load a network from Intel's Model Optimizer intermediate representation.

  ##### Positional Arguments
  - **xml**: `String`.

    XML configuration file with network's topology.

  - **bin**: `String`.

    Binary file with trained weights.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
    Networks imported from Intel's Model Optimizer are launched in Intel's Inference Engine
    backend.

  Python prototype (for reference): 
  ```python3
  readNetFromModelOptimizer(xml, bin) -> retval
  ```

  """
  @spec readNetFromModelOptimizer(binary(), binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromModelOptimizer(xml, bin) when is_binary(xml) and is_binary(bin)
  do
    positional = [
      xml: Evision.Internal.Structurise.from_struct(xml),
      bin: Evision.Internal.Structurise.from_struct(bin)
    ]
    :evision_nif.dnn_readNetFromModelOptimizer(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model from <a href="https://onnx.ai/">ONNX</a>
  in-memory buffer.


  ##### Positional Arguments
  - **buffer**: `[uchar]`.

    in-memory buffer that stores the ONNX model bytes.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Network object that ready to do forward, throw an exception
          in failure cases.

  Python prototype (for reference): 
  ```python3
  readNetFromONNX(buffer) -> retval
  ```

  """
  @spec readNetFromONNXBuffer(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromONNXBuffer(buffer) when is_binary(buffer)
  do
    positional = [
      buffer: Evision.Internal.Structurise.from_struct(buffer)
    ]
    :evision_nif.dnn_readNetFromONNX(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model <a href="https://onnx.ai/">ONNX</a>.

  ##### Positional Arguments
  - **onnxFile**: `String`.

    path to the .onnx file with text description of the network architecture.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Network object that ready to do forward, throw an exception in failure cases.

  Python prototype (for reference): 
  ```python3
  readNetFromONNX(onnxFile) -> retval
  ```

  """
  @spec readNetFromONNX(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromONNX(onnxFile) when is_binary(onnxFile)
  do
    positional = [
      onnxFile: Evision.Internal.Structurise.from_struct(onnxFile)
    ]
    :evision_nif.dnn_readNetFromONNX(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://www.tensorflow.org/">TensorFlow</a> framework's format.

  ##### Positional Arguments
  - **bufferModel**: `[uchar]`.

    buffer containing the content of the pb file


  ##### Keyword Arguments
  - **bufferConfig**: `[uchar]`.

    buffer containing the content of the pbtxt file


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromTensorflow(bufferModel[, bufferConfig]) -> retval
  ```

  """
  @spec readNetFromTensorflowBuffer(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTensorflowBuffer(bufferModel, opts) when is_binary(bufferModel) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bufferModel: Evision.Internal.Structurise.from_struct(bufferModel)
    ]
    :evision_nif.dnn_readNetFromTensorflow(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://www.tensorflow.org/">TensorFlow</a> framework's format.

  ##### Positional Arguments
  - **bufferModel**: `[uchar]`.

    buffer containing the content of the pb file


  ##### Keyword Arguments
  - **bufferConfig**: `[uchar]`.

    buffer containing the content of the pbtxt file


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromTensorflow(bufferModel[, bufferConfig]) -> retval
  ```

  """
  @spec readNetFromTensorflowBuffer(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTensorflowBuffer(bufferModel) when is_binary(bufferModel)
  do
    positional = [
      bufferModel: Evision.Internal.Structurise.from_struct(bufferModel)
    ]
    :evision_nif.dnn_readNetFromTensorflow(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://www.tensorflow.org/">TensorFlow</a> framework's format.

  ##### Positional Arguments
  - **model**: `String`.

    path to the .pb file with binary protobuf description of the network architecture


  ##### Keyword Arguments
  - **config**: `String`.

    path to the .pbtxt file that contains text graph definition in protobuf format.
    Resulting Net object is built by text graph using weights from a binary one that
    let us make it more flexible.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromTensorflow(model[, config]) -> retval
  ```

  """
  @spec readNetFromTensorflow(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTensorflow(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNetFromTensorflow(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="https://www.tensorflow.org/">TensorFlow</a> framework's format.

  ##### Positional Arguments
  - **model**: `String`.

    path to the .pb file with binary protobuf description of the network architecture


  ##### Keyword Arguments
  - **config**: `String`.

    path to the .pbtxt file that contains text graph definition in protobuf format.
    Resulting Net object is built by text graph using weights from a binary one that
    let us make it more flexible.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.


  Python prototype (for reference): 
  ```python3
  readNetFromTensorflow(model[, config]) -> retval
  ```

  """
  @spec readNetFromTensorflow(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTensorflow(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNetFromTensorflow(positional)
    |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="http://torch.ch">Torch7</a> framework's format.

  ##### Positional Arguments
  - **model**: `String`.

    path to the file, dumped from Torch by using torch.save() function.


  ##### Keyword Arguments
  - **isBinary**: `bool`.

    specifies whether the network was serialized in ascii mode or binary.

  - **evaluate**: `bool`.

    specifies testing phase of network. If true, it's similar to evaluate() method in Torch.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
  **Note**: Ascii mode of Torch serializer is more preferable, because binary mode extensively use `long` type of C language,
    which has various bit-length on different systems.
   The loading file must contain serialized <a href="https://github.com/torch/nn/blob/master/doc/module.md">nn.Module</a> object
   with importing network. Try to eliminate a custom objects from serialazing data to avoid importing errors.
   List of supported layers (i.e. object instances derived from Torch nn.Module class):
  - nn.Sequential
  - nn.Parallel
  - nn.Concat
  - nn.Linear
  - nn.SpatialConvolution
  - nn.SpatialMaxPooling, nn.SpatialAveragePooling
  - nn.ReLU, nn.TanH, nn.Sigmoid
  - nn.Reshape
  - nn.SoftMax, nn.LogSoftMax

   Also some equivalents of these classes from cunn, cudnn, and fbcunn may be successfully imported.


  Python prototype (for reference): 
  ```python3
  readNetFromTorch(model[, isBinary[, evaluate]]) -> retval
  ```

  """
  @spec readNetFromTorch(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTorch(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNetFromTorch(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Reads a network model stored in <a href="http://torch.ch">Torch7</a> framework's format.

  ##### Positional Arguments
  - **model**: `String`.

    path to the file, dumped from Torch by using torch.save() function.


  ##### Keyword Arguments
  - **isBinary**: `bool`.

    specifies whether the network was serialized in ascii mode or binary.

  - **evaluate**: `bool`.

    specifies testing phase of network. If true, it's similar to evaluate() method in Torch.


  ##### Return
  - **retval**: `Evision.DNN.Net`

  @returns Net object.
  **Note**: Ascii mode of Torch serializer is more preferable, because binary mode extensively use `long` type of C language,
    which has various bit-length on different systems.
   The loading file must contain serialized <a href="https://github.com/torch/nn/blob/master/doc/module.md">nn.Module</a> object
   with importing network. Try to eliminate a custom objects from serialazing data to avoid importing errors.
   List of supported layers (i.e. object instances derived from Torch nn.Module class):
  - nn.Sequential
  - nn.Parallel
  - nn.Concat
  - nn.Linear
  - nn.SpatialConvolution
  - nn.SpatialMaxPooling, nn.SpatialAveragePooling
  - nn.ReLU, nn.TanH, nn.Sigmoid
  - nn.Reshape
  - nn.SoftMax, nn.LogSoftMax

   Also some equivalents of these classes from cunn, cudnn, and fbcunn may be successfully imported.


  Python prototype (for reference): 
  ```python3
  readNetFromTorch(model[, isBinary[, evaluate]]) -> retval
  ```

  """
  @spec readNetFromTorch(binary()) :: Evision.DNN.Net.t() | {:error, String.t()}
  def readNetFromTorch(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_readNetFromTorch(positional)
    |> __to_struct__()
  end

  @doc """
  Creates blob from .pb file.

  ##### Positional Arguments
  - **path**: `String`.

    to the .pb file with input tensor.


  ##### Return
  - **retval**: `Evision.Mat`

  @returns Mat.

  Python prototype (for reference): 
  ```python3
  readTensorFromONNX(path) -> retval
  ```

  """
  @spec readTensorFromONNX(binary()) :: Evision.Mat.t() | {:error, String.t()}
  def readTensorFromONNX(path) when is_binary(path)
  do
    positional = [
      path: Evision.Internal.Structurise.from_struct(path)
    ]
    :evision_nif.dnn_readTensorFromONNX(positional)
    |> __to_struct__()
  end

  @doc """
  Loads blob which was serialized as torch.Tensor object of Torch7 framework.

  ##### Positional Arguments
  - **filename**: `String`

  ##### Keyword Arguments
  - **isBinary**: `bool`.

  ##### Return
  - **retval**: `Evision.Mat`

  @warning This function has the same limitations as readNetFromTorch().


  Python prototype (for reference): 
  ```python3
  readTorchBlob(filename[, isBinary]) -> retval
  ```

  """
  @spec readTorchBlob(binary(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def readTorchBlob(filename, opts) when is_binary(filename) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.dnn_readTorchBlob(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Loads blob which was serialized as torch.Tensor object of Torch7 framework.

  ##### Positional Arguments
  - **filename**: `String`

  ##### Keyword Arguments
  - **isBinary**: `bool`.

  ##### Return
  - **retval**: `Evision.Mat`

  @warning This function has the same limitations as readNetFromTorch().


  Python prototype (for reference): 
  ```python3
  readTorchBlob(filename[, isBinary]) -> retval
  ```

  """
  @spec readTorchBlob(binary()) :: Evision.Mat.t() | {:error, String.t()}
  def readTorchBlob(filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.dnn_readTorchBlob(positional)
    |> __to_struct__()
  end

  @doc """
  Convert all weights of Caffe network to half precision floating point.

  ##### Positional Arguments
  - **src**: `String`.

    Path to origin model from Caffe framework contains single
    precision floating point weights (usually has `.caffemodel` extension).

  - **dst**: `String`.

    Path to destination model with updated weights.


  ##### Keyword Arguments
  - **layersTypes**: `[String]`.

    Set of layers types which parameters will be converted.
    By default, converts only Convolutional and Fully-Connected layers'
    weights.




  **Note**: Shrinked model has no origin float32 weights so it can't be used
         in origin Caffe framework anymore. However the structure of data
         is taken from NVidia's Caffe fork: https://github.com/NVIDIA/caffe.
         So the resulting model may be used there.


  Python prototype (for reference): 
  ```python3
  shrinkCaffeModel(src, dst[, layersTypes]) -> None
  ```

  """
  @spec shrinkCaffeModel(binary(), binary(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def shrinkCaffeModel(src, dst, opts) when is_binary(src) and is_binary(dst) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      dst: Evision.Internal.Structurise.from_struct(dst)
    ]
    :evision_nif.dnn_shrinkCaffeModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Convert all weights of Caffe network to half precision floating point.

  ##### Positional Arguments
  - **src**: `String`.

    Path to origin model from Caffe framework contains single
    precision floating point weights (usually has `.caffemodel` extension).

  - **dst**: `String`.

    Path to destination model with updated weights.


  ##### Keyword Arguments
  - **layersTypes**: `[String]`.

    Set of layers types which parameters will be converted.
    By default, converts only Convolutional and Fully-Connected layers'
    weights.




  **Note**: Shrinked model has no origin float32 weights so it can't be used
         in origin Caffe framework anymore. However the structure of data
         is taken from NVidia's Caffe fork: https://github.com/NVIDIA/caffe.
         So the resulting model may be used there.


  Python prototype (for reference): 
  ```python3
  shrinkCaffeModel(src, dst[, layersTypes]) -> None
  ```

  """
  @spec shrinkCaffeModel(binary(), binary()) :: :ok | {:error, String.t()}
  def shrinkCaffeModel(src, dst) when is_binary(src) and is_binary(dst)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      dst: Evision.Internal.Structurise.from_struct(dst)
    ]
    :evision_nif.dnn_shrinkCaffeModel(positional)
    |> __to_struct__()
  end

  @doc """
  Performs soft non maximum suppression given boxes and corresponding scores.
  Reference: https://arxiv.org/abs/1704.04503


  ##### Positional Arguments
  - **bboxes**: `[Rect]`.

    a set of bounding boxes to apply Soft NMS.

  - **scores**: `[float]`.

    a set of corresponding confidences.

  - **score_threshold**: `float`.

    a threshold used to filter boxes by score.

  - **nms_threshold**: `float`.

    a threshold used in non maximum suppression.


  ##### Keyword Arguments
  - **top_k**: `size_t`.

    keep at most @p top_k picked indices.

  - **sigma**: `float`.

    parameter of Gaussian weighting.

  - **method**: `SoftNMSMethod`.

    Gaussian or linear.


  ##### Return
  - **updated_scores**: `[float]`.

    a set of corresponding updated confidences.

  - **indices**: `[int]`.

    the kept indices of bboxes after NMS.


  @see SoftNMSMethod


  Python prototype (for reference): 
  ```python3
  softNMSBoxes(bboxes, scores, score_threshold, nms_threshold[, top_k[, sigma[, method]]]) -> updated_scores, indices
  ```

  """
  @spec softNMSBoxes(list({number(), number(), number(), number()}), list(number()), number(), number(), [{atom(), term()},...] | nil) :: {list(number()), list(integer())} | {:error, String.t()}
  def softNMSBoxes(bboxes, scores, score_threshold, nms_threshold, opts) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_softNMSBoxes(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs soft non maximum suppression given boxes and corresponding scores.
  Reference: https://arxiv.org/abs/1704.04503


  ##### Positional Arguments
  - **bboxes**: `[Rect]`.

    a set of bounding boxes to apply Soft NMS.

  - **scores**: `[float]`.

    a set of corresponding confidences.

  - **score_threshold**: `float`.

    a threshold used to filter boxes by score.

  - **nms_threshold**: `float`.

    a threshold used in non maximum suppression.


  ##### Keyword Arguments
  - **top_k**: `size_t`.

    keep at most @p top_k picked indices.

  - **sigma**: `float`.

    parameter of Gaussian weighting.

  - **method**: `SoftNMSMethod`.

    Gaussian or linear.


  ##### Return
  - **updated_scores**: `[float]`.

    a set of corresponding updated confidences.

  - **indices**: `[int]`.

    the kept indices of bboxes after NMS.


  @see SoftNMSMethod


  Python prototype (for reference): 
  ```python3
  softNMSBoxes(bboxes, scores, score_threshold, nms_threshold[, top_k[, sigma[, method]]]) -> updated_scores, indices
  ```

  """
  @spec softNMSBoxes(list({number(), number(), number(), number()}), list(number()), number(), number()) :: {list(number()), list(integer())} | {:error, String.t()}
  def softNMSBoxes(bboxes, scores, score_threshold, nms_threshold) when is_list(bboxes) and is_list(scores) and is_float(score_threshold) and is_float(nms_threshold)
  do
    positional = [
      bboxes: Evision.Internal.Structurise.from_struct(bboxes),
      scores: Evision.Internal.Structurise.from_struct(scores),
      score_threshold: Evision.Internal.Structurise.from_struct(score_threshold),
      nms_threshold: Evision.Internal.Structurise.from_struct(nms_threshold)
    ]
    :evision_nif.dnn_softNMSBoxes(positional)
    |> __to_struct__()
  end

  @doc """
  Create a text representation for a binary network stored in protocol buffer format.

  ##### Positional Arguments
  - **model**: `String`.

    A path to binary network.

  - **output**: `String`.

    A path to output text file to be created.




  **Note**: To reduce output file size, trained weights are not included.

  Python prototype (for reference): 
  ```python3
  writeTextGraph(model, output) -> None
  ```

  """
  @spec writeTextGraph(binary(), binary()) :: :ok | {:error, String.t()}
  def writeTextGraph(model, output) when is_binary(model) and is_binary(output)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model),
      output: Evision.Internal.Structurise.from_struct(output)
    ]
    :evision_nif.dnn_writeTextGraph(positional)
    |> __to_struct__()
  end
end
