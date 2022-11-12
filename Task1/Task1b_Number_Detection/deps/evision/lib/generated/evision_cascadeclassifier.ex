defmodule Evision.CascadeClassifier do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CascadeClassifier` struct.

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
  def __to_struct__({:ok, %{class: :CascadeClassifier, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :CascadeClassifier, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Loads a classifier from a file.

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the file from which the classifier is loaded.


  ##### Return
  - **self**: `Evision.CascadeClassifier`



  Python prototype (for reference): 
  ```python3
  CascadeClassifier(filename) -> <CascadeClassifier object>
  ```

  """
  @spec cascadeClassifier(binary()) :: Evision.CascadeClassifier.t() | {:error, String.t()}
  def cascadeClassifier(filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.cascadeClassifier_CascadeClassifier(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.CascadeClassifier`


  Python prototype (for reference): 
  ```python3
  CascadeClassifier() -> <CascadeClassifier object>
  ```

  """
  @spec cascadeClassifier() :: Evision.CascadeClassifier.t() | {:error, String.t()}
  def cascadeClassifier() do
    positional = [
    ]
    :evision_nif.cascadeClassifier_CascadeClassifier(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **oldcascade**: `String`
  - **newcascade**: `String`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  convert(oldcascade, newcascade) -> retval
  ```

  """
  @spec convert(binary(), binary()) :: boolean() | {:error, String.t()}
  def convert(oldcascade, newcascade) when is_binary(oldcascade) and is_binary(newcascade)
  do
    positional = [
      oldcascade: Evision.Internal.Structurise.from_struct(oldcascade),
      newcascade: Evision.Internal.Structurise.from_struct(newcascade)
    ]
    :evision_nif.cascadeClassifier_convert_static(positional)
    |> __to_struct__()
  end

  @doc """
  Detects objects of different sizes in the input image. The detected objects are returned as a list
  of rectangles.


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where objects are detected.


  ##### Keyword Arguments
  - **scaleFactor**: `double`.

    Parameter specifying how much the image size is reduced at each image scale.

  - **minNeighbors**: `int`.

    Parameter specifying how many neighbors each candidate rectangle should have
    to retain it.

  - **flags**: `int`.

    Parameter with the same meaning for an old cascade as in the function
    cvHaarDetectObjects. It is not used for a new cascade.

  - **minSize**: `Size`.

    Minimum possible object size. Objects smaller than that are ignored.

  - **maxSize**: `Size`.

    Maximum possible object size. Objects larger than that are ignored. If `maxSize == minSize` model is evaluated on single scale.


  ##### Return
  - **objects**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object, the
    rectangles may be partially outside the original image.




  Python prototype (for reference): 
  ```python3
  detectMultiScale(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize]]]]]) -> objects
  ```

  """
  @spec detectMultiScale(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list({number(), number(), number(), number()}) | {:error, String.t()}
  def detectMultiScale(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Detects objects of different sizes in the input image. The detected objects are returned as a list
  of rectangles.


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where objects are detected.


  ##### Keyword Arguments
  - **scaleFactor**: `double`.

    Parameter specifying how much the image size is reduced at each image scale.

  - **minNeighbors**: `int`.

    Parameter specifying how many neighbors each candidate rectangle should have
    to retain it.

  - **flags**: `int`.

    Parameter with the same meaning for an old cascade as in the function
    cvHaarDetectObjects. It is not used for a new cascade.

  - **minSize**: `Size`.

    Minimum possible object size. Objects smaller than that are ignored.

  - **maxSize**: `Size`.

    Maximum possible object size. Objects larger than that are ignored. If `maxSize == minSize` model is evaluated on single scale.


  ##### Return
  - **objects**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object, the
    rectangles may be partially outside the original image.




  Python prototype (for reference): 
  ```python3
  detectMultiScale(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize]]]]]) -> objects
  ```

  """
  @spec detectMultiScale(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in()) :: list({number(), number(), number(), number()}) | {:error, String.t()}
  def detectMultiScale(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where objects are detected.


  ##### Keyword Arguments
  - **scaleFactor**: `double`.

    Parameter specifying how much the image size is reduced at each image scale.

  - **minNeighbors**: `int`.

    Parameter specifying how many neighbors each candidate rectangle should have
    to retain it.

  - **flags**: `int`.

    Parameter with the same meaning for an old cascade as in the function
    cvHaarDetectObjects. It is not used for a new cascade.

  - **minSize**: `Size`.

    Minimum possible object size. Objects smaller than that are ignored.

  - **maxSize**: `Size`.

    Maximum possible object size. Objects larger than that are ignored. If `maxSize == minSize` model is evaluated on single scale.


  ##### Return
  - **objects**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object, the
    rectangles may be partially outside the original image.

  - **numDetections**: `[int]`.

    Vector of detection numbers for the corresponding objects. An object's number
    of detections is the number of neighboring positively classified rectangles that were joined
    together to form the object.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  detectMultiScale2(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize]]]]]) -> objects, numDetections
  ```

  """
  @spec detectMultiScale2(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list({number(), number(), number(), number()}), list(integer())} | {:error, String.t()}
  def detectMultiScale2(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale2(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where objects are detected.


  ##### Keyword Arguments
  - **scaleFactor**: `double`.

    Parameter specifying how much the image size is reduced at each image scale.

  - **minNeighbors**: `int`.

    Parameter specifying how many neighbors each candidate rectangle should have
    to retain it.

  - **flags**: `int`.

    Parameter with the same meaning for an old cascade as in the function
    cvHaarDetectObjects. It is not used for a new cascade.

  - **minSize**: `Size`.

    Minimum possible object size. Objects smaller than that are ignored.

  - **maxSize**: `Size`.

    Maximum possible object size. Objects larger than that are ignored. If `maxSize == minSize` model is evaluated on single scale.


  ##### Return
  - **objects**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object, the
    rectangles may be partially outside the original image.

  - **numDetections**: `[int]`.

    Vector of detection numbers for the corresponding objects. An object's number
    of detections is the number of neighboring positively classified rectangles that were joined
    together to form the object.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  detectMultiScale2(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize]]]]]) -> objects, numDetections
  ```

  """
  @spec detectMultiScale2(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in()) :: {list({number(), number(), number(), number()}), list(integer())} | {:error, String.t()}
  def detectMultiScale2(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale2(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`

  ##### Keyword Arguments
  - **scaleFactor**: `double`.
  - **minNeighbors**: `int`.
  - **flags**: `int`.
  - **minSize**: `Size`.
  - **maxSize**: `Size`.
  - **outputRejectLevels**: `bool`.

  ##### Return
  - **objects**: `[Rect]`
  - **rejectLevels**: `[int]`
  - **levelWeights**: `[double]`

  Has overloading in C++

  This function allows you to retrieve the final stage decision certainty of classification.
  For this, one needs to set `outputRejectLevels` on true and provide the `rejectLevels` and `levelWeights` parameter.
  For each resulting detection, `levelWeights` will then contain the certainty of classification at the final stage.
  This value can then be used to separate strong from weaker classifications.
  A code sample on how to use it efficiently can be found below:
  ```
  Mat img;
  vector<double> weights;
  vector<int> levels;
  vector<Rect> detections;
  CascadeClassifier model("/path/to/your/model.xml");
  model.detectMultiScale(img, detections, levels, weights, 1.1, 3, 0, Size(), Size(), true);
  cerr << "Detection " << detections[0] << " with weight " << weights[0] << endl;
  ```


  Python prototype (for reference): 
  ```python3
  detectMultiScale3(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize[, outputRejectLevels]]]]]]) -> objects, rejectLevels, levelWeights
  ```

  """
  @spec detectMultiScale3(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list({number(), number(), number(), number()}), list(integer()), list(number())} | {:error, String.t()}
  def detectMultiScale3(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale3(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`

  ##### Keyword Arguments
  - **scaleFactor**: `double`.
  - **minNeighbors**: `int`.
  - **flags**: `int`.
  - **minSize**: `Size`.
  - **maxSize**: `Size`.
  - **outputRejectLevels**: `bool`.

  ##### Return
  - **objects**: `[Rect]`
  - **rejectLevels**: `[int]`
  - **levelWeights**: `[double]`

  Has overloading in C++

  This function allows you to retrieve the final stage decision certainty of classification.
  For this, one needs to set `outputRejectLevels` on true and provide the `rejectLevels` and `levelWeights` parameter.
  For each resulting detection, `levelWeights` will then contain the certainty of classification at the final stage.
  This value can then be used to separate strong from weaker classifications.
  A code sample on how to use it efficiently can be found below:
  ```
  Mat img;
  vector<double> weights;
  vector<int> levels;
  vector<Rect> detections;
  CascadeClassifier model("/path/to/your/model.xml");
  model.detectMultiScale(img, detections, levels, weights, 1.1, 3, 0, Size(), Size(), true);
  cerr << "Detection " << detections[0] << " with weight " << weights[0] << endl;
  ```


  Python prototype (for reference): 
  ```python3
  detectMultiScale3(image[, scaleFactor[, minNeighbors[, flags[, minSize[, maxSize[, outputRejectLevels]]]]]]) -> objects, rejectLevels, levelWeights
  ```

  """
  @spec detectMultiScale3(Evision.CascadeClassifier.t(), Evision.Mat.maybe_mat_in()) :: {list({number(), number(), number(), number()}), list(integer()), list(number())} | {:error, String.t()}
  def detectMultiScale3(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.cascadeClassifier_detectMultiScale3(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Checks whether the classifier has been loaded.
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.CascadeClassifier.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.cascadeClassifier_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getFeatureType() -> retval
  ```

  """
  @spec getFeatureType(Evision.CascadeClassifier.t()) :: integer() | {:error, String.t()}
  def getFeatureType(self) do
    positional = [
    ]
    :evision_nif.cascadeClassifier_getFeatureType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Size`


  Python prototype (for reference): 
  ```python3
  getOriginalWindowSize() -> retval
  ```

  """
  @spec getOriginalWindowSize(Evision.CascadeClassifier.t()) :: {number(), number()} | {:error, String.t()}
  def getOriginalWindowSize(self) do
    positional = [
    ]
    :evision_nif.cascadeClassifier_getOriginalWindowSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isOldFormatCascade() -> retval
  ```

  """
  @spec isOldFormatCascade(Evision.CascadeClassifier.t()) :: boolean() | {:error, String.t()}
  def isOldFormatCascade(self) do
    positional = [
    ]
    :evision_nif.cascadeClassifier_isOldFormatCascade(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Loads a classifier from a file.

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the file from which the classifier is loaded. The file may contain an old
    HAAR classifier trained by the haartraining application or a new cascade classifier trained by the
    traincascade application.


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  load(filename) -> retval
  ```

  """
  @spec load(Evision.CascadeClassifier.t(), binary()) :: boolean() | {:error, String.t()}
  def load(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.cascadeClassifier_load(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Reads a classifier from a FileStorage node.

  ##### Positional Arguments
  - **node**: `Evision.FileNode`

  ##### Return
  - **retval**: `bool`

  **Note**: The file may contain a new cascade classifier (trained by the traincascade application) only.

  Python prototype (for reference): 
  ```python3
  read(node) -> retval
  ```

  """
  @spec read(Evision.CascadeClassifier.t(), Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def read(self, node) when is_struct(node, Evision.FileNode)
  do
    positional = [
      node: Evision.Internal.Structurise.from_struct(node)
    ]
    :evision_nif.cascadeClassifier_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
