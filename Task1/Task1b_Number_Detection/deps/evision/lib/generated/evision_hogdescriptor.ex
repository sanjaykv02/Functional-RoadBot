defmodule Evision.HOGDescriptor do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.HOGDescriptor` struct.

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
  def __to_struct__({:ok, %{class: :HOGDescriptor, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :HOGDescriptor, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **winSize**: `Size`.

    sets winSize with given value.

  - **blockSize**: `Size`.

    sets blockSize with given value.

  - **blockStride**: `Size`.

    sets blockStride with given value.

  - **cellSize**: `Size`.

    sets cellSize with given value.

  - **nbins**: `int`.

    sets nbins with given value.


  ##### Keyword Arguments
  - **derivAperture**: `int`.

    sets derivAperture with given value.

  - **winSigma**: `double`.

    sets winSigma with given value.

  - **histogramNormType**: `HOGDescriptor_HistogramNormType`.

    sets histogramNormType with given value.

  - **l2HysThreshold**: `double`.

    sets L2HysThreshold with given value.

  - **gammaCorrection**: `bool`.

    sets gammaCorrection with given value.

  - **nlevels**: `int`.

    sets nlevels with given value.

  - **signedGradient**: `bool`.

    sets signedGradient with given value.


  ##### Return
  - **self**: `Evision.HOGDescriptor`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  HOGDescriptor(_winSize, _blockSize, _blockStride, _cellSize, _nbins[, _derivAperture[, _winSigma[, _histogramNormType[, _L2HysThreshold[, _gammaCorrection[, _nlevels[, _signedGradient]]]]]]]) -> <HOGDescriptor object>
  ```

  """
  @spec hogDescriptor({number(), number()}, {number(), number()}, {number(), number()}, {number(), number()}, integer(), [{atom(), term()},...] | nil) :: Evision.HOGDescriptor.t() | {:error, String.t()}
  def hogDescriptor(winSize, blockSize, blockStride, cellSize, nbins, opts) when is_tuple(winSize) and is_tuple(blockSize) and is_tuple(blockStride) and is_tuple(cellSize) and is_integer(nbins) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      winSize: Evision.Internal.Structurise.from_struct(winSize),
      blockSize: Evision.Internal.Structurise.from_struct(blockSize),
      blockStride: Evision.Internal.Structurise.from_struct(blockStride),
      cellSize: Evision.Internal.Structurise.from_struct(cellSize),
      nbins: Evision.Internal.Structurise.from_struct(nbins)
    ]
    :evision_nif.hogDescriptor_HOGDescriptor(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **winSize**: `Size`.

    sets winSize with given value.

  - **blockSize**: `Size`.

    sets blockSize with given value.

  - **blockStride**: `Size`.

    sets blockStride with given value.

  - **cellSize**: `Size`.

    sets cellSize with given value.

  - **nbins**: `int`.

    sets nbins with given value.


  ##### Keyword Arguments
  - **derivAperture**: `int`.

    sets derivAperture with given value.

  - **winSigma**: `double`.

    sets winSigma with given value.

  - **histogramNormType**: `HOGDescriptor_HistogramNormType`.

    sets histogramNormType with given value.

  - **l2HysThreshold**: `double`.

    sets L2HysThreshold with given value.

  - **gammaCorrection**: `bool`.

    sets gammaCorrection with given value.

  - **nlevels**: `int`.

    sets nlevels with given value.

  - **signedGradient**: `bool`.

    sets signedGradient with given value.


  ##### Return
  - **self**: `Evision.HOGDescriptor`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  HOGDescriptor(_winSize, _blockSize, _blockStride, _cellSize, _nbins[, _derivAperture[, _winSigma[, _histogramNormType[, _L2HysThreshold[, _gammaCorrection[, _nlevels[, _signedGradient]]]]]]]) -> <HOGDescriptor object>
  ```

  """
  @spec hogDescriptor({number(), number()}, {number(), number()}, {number(), number()}, {number(), number()}, integer()) :: Evision.HOGDescriptor.t() | {:error, String.t()}
  def hogDescriptor(winSize, blockSize, blockStride, cellSize, nbins) when is_tuple(winSize) and is_tuple(blockSize) and is_tuple(blockStride) and is_tuple(cellSize) and is_integer(nbins)
  do
    positional = [
      winSize: Evision.Internal.Structurise.from_struct(winSize),
      blockSize: Evision.Internal.Structurise.from_struct(blockSize),
      blockStride: Evision.Internal.Structurise.from_struct(blockStride),
      cellSize: Evision.Internal.Structurise.from_struct(cellSize),
      nbins: Evision.Internal.Structurise.from_struct(nbins)
    ]
    :evision_nif.hogDescriptor_HOGDescriptor(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **filename**: `String`.

    The file name containing HOGDescriptor properties and coefficients for the linear SVM classifier.


  ##### Return
  - **self**: `Evision.HOGDescriptor`

  Has overloading in C++

  Creates the HOG descriptor and detector and loads HOGDescriptor parameters and coefficients for the linear SVM classifier from a file.


  Python prototype (for reference): 
  ```python3
  HOGDescriptor(filename) -> <HOGDescriptor object>
  ```

  """
  @spec hogDescriptor(binary()) :: Evision.HOGDescriptor.t() | {:error, String.t()}
  def hogDescriptor(filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.hogDescriptor_HOGDescriptor(positional)
    |> __to_struct__()
  end

  @doc """
  Creates the HOG descriptor and detector with default parameters.
  ##### Return
  - **self**: `Evision.HOGDescriptor`

  aqual to HOGDescriptor(Size(64,128), Size(16,16), Size(8,8), Size(8,8), 9 )

  Python prototype (for reference): 
  ```python3
  HOGDescriptor() -> <HOGDescriptor object>
  ```

  """
  @spec hogDescriptor() :: Evision.HOGDescriptor.t() | {:error, String.t()}
  def hogDescriptor() do
    positional = [
    ]
    :evision_nif.hogDescriptor_HOGDescriptor(positional)
    |> __to_struct__()
  end

  @doc """
  Checks if detector size equal to descriptor size.
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  checkDetectorSize() -> retval
  ```

  """
  @spec checkDetectorSize(Evision.HOGDescriptor.t()) :: boolean() | {:error, String.t()}
  def checkDetectorSize(self) do
    positional = [
    ]
    :evision_nif.hogDescriptor_checkDetectorSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Computes HOG descriptors of given image.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where HOG features will be calculated.


  ##### Keyword Arguments
  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **locations**: `[Point]`.

    Vector of Point


  ##### Return
  - **descriptors**: `[float]`.

    Matrix of the type CV_32F




  Python prototype (for reference): 
  ```python3
  compute(img[, winStride[, padding[, locations]]]) -> descriptors
  ```

  """
  @spec compute(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(number()) | {:error, String.t()}
  def compute(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes HOG descriptors of given image.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U containing an image where HOG features will be calculated.


  ##### Keyword Arguments
  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **locations**: `[Point]`.

    Vector of Point


  ##### Return
  - **descriptors**: `[float]`.

    Matrix of the type CV_32F




  Python prototype (for reference): 
  ```python3
  compute(img[, winStride[, padding[, locations]]]) -> descriptors
  ```

  """
  @spec compute(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in()) :: list(number()) | {:error, String.t()}
  def compute(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Computes gradients and quantized gradient orientations.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix contains the image to be computed


  ##### Keyword Arguments
  - **paddingTL**: `Size`.

    Padding from top-left

  - **paddingBR**: `Size`.

    Padding from bottom-right


  ##### Return
  - **grad**: `Evision.Mat`.

    Matrix of type CV_32FC2 contains computed gradients

  - **angleOfs**: `Evision.Mat`.

    Matrix of type CV_8UC2 contains quantized gradient orientations




  Python prototype (for reference): 
  ```python3
  computeGradient(img, grad, angleOfs[, paddingTL[, paddingBR]]) -> grad, angleOfs
  ```

  """
  @spec computeGradient(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def computeGradient(self, img, grad, angleOfs, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(grad, Evision.Mat) or is_struct(grad, Nx.Tensor)) and (is_struct(angleOfs, Evision.Mat) or is_struct(angleOfs, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      grad: Evision.Internal.Structurise.from_struct(grad),
      angleOfs: Evision.Internal.Structurise.from_struct(angleOfs)
    ]
    :evision_nif.hogDescriptor_computeGradient(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes gradients and quantized gradient orientations.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix contains the image to be computed


  ##### Keyword Arguments
  - **paddingTL**: `Size`.

    Padding from top-left

  - **paddingBR**: `Size`.

    Padding from bottom-right


  ##### Return
  - **grad**: `Evision.Mat`.

    Matrix of type CV_32FC2 contains computed gradients

  - **angleOfs**: `Evision.Mat`.

    Matrix of type CV_8UC2 contains quantized gradient orientations




  Python prototype (for reference): 
  ```python3
  computeGradient(img, grad, angleOfs[, paddingTL[, paddingBR]]) -> grad, angleOfs
  ```

  """
  @spec computeGradient(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def computeGradient(self, img, grad, angleOfs) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(grad, Evision.Mat) or is_struct(grad, Nx.Tensor)) and (is_struct(angleOfs, Evision.Mat) or is_struct(angleOfs, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      grad: Evision.Internal.Structurise.from_struct(grad),
      angleOfs: Evision.Internal.Structurise.from_struct(angleOfs)
    ]
    :evision_nif.hogDescriptor_computeGradient(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Performs object detection without a multi-scale window.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U or CV_8UC3 containing an image where objects are detected.


  ##### Keyword Arguments
  - **hitThreshold**: `double`.

    Threshold for the distance between features and SVM classifying plane.
    Usually it is 0 and should be specified in the detector coefficients (as the last free coefficient).
    But if the free coefficient is omitted (which is allowed), you can specify it manually here.

  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **searchLocations**: `[Point]`.

    Vector of Point includes set of requested locations to be evaluated.


  ##### Return
  - **foundLocations**: `[Point]`.

    Vector of point where each point contains left-top corner point of detected object boundaries.

  - **weights**: `[double]`.

    Vector that will contain confidence values for each detected object.




  Python prototype (for reference): 
  ```python3
  detect(img[, hitThreshold[, winStride[, padding[, searchLocations]]]]) -> foundLocations, weights
  ```

  """
  @spec detect(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list({number(), number()}), list(number())} | {:error, String.t()}
  def detect(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs object detection without a multi-scale window.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U or CV_8UC3 containing an image where objects are detected.


  ##### Keyword Arguments
  - **hitThreshold**: `double`.

    Threshold for the distance between features and SVM classifying plane.
    Usually it is 0 and should be specified in the detector coefficients (as the last free coefficient).
    But if the free coefficient is omitted (which is allowed), you can specify it manually here.

  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **searchLocations**: `[Point]`.

    Vector of Point includes set of requested locations to be evaluated.


  ##### Return
  - **foundLocations**: `[Point]`.

    Vector of point where each point contains left-top corner point of detected object boundaries.

  - **weights**: `[double]`.

    Vector that will contain confidence values for each detected object.




  Python prototype (for reference): 
  ```python3
  detect(img[, hitThreshold[, winStride[, padding[, searchLocations]]]]) -> foundLocations, weights
  ```

  """
  @spec detect(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in()) :: {list({number(), number()}), list(number())} | {:error, String.t()}
  def detect(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Detects objects of different sizes in the input image. The detected objects are returned as a list
  of rectangles.


  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U or CV_8UC3 containing an image where objects are detected.


  ##### Keyword Arguments
  - **hitThreshold**: `double`.

    Threshold for the distance between features and SVM classifying plane.
    Usually it is 0 and should be specified in the detector coefficients (as the last free coefficient).
    But if the free coefficient is omitted (which is allowed), you can specify it manually here.

  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **scale**: `double`.

    Coefficient of the detection window increase.

  - **groupThreshold**: `double`.

    Coefficient to regulate the similarity threshold. When detected, some objects can be covered
    by many rectangles. 0 means not to perform grouping.

  - **useMeanshiftGrouping**: `bool`.

    indicates grouping algorithm


  ##### Return
  - **foundLocations**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object.

  - **foundWeights**: `[double]`.

    Vector that will contain confidence values for each detected object.




  Python prototype (for reference): 
  ```python3
  detectMultiScale(img[, hitThreshold[, winStride[, padding[, scale[, groupThreshold[, useMeanshiftGrouping]]]]]]) -> foundLocations, foundWeights
  ```

  """
  @spec detectMultiScale(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list({number(), number(), number(), number()}), list(number())} | {:error, String.t()}
  def detectMultiScale(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_detectMultiScale(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Detects objects of different sizes in the input image. The detected objects are returned as a list
  of rectangles.


  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    Matrix of the type CV_8U or CV_8UC3 containing an image where objects are detected.


  ##### Keyword Arguments
  - **hitThreshold**: `double`.

    Threshold for the distance between features and SVM classifying plane.
    Usually it is 0 and should be specified in the detector coefficients (as the last free coefficient).
    But if the free coefficient is omitted (which is allowed), you can specify it manually here.

  - **winStride**: `Size`.

    Window stride. It must be a multiple of block stride.

  - **padding**: `Size`.

    Padding

  - **scale**: `double`.

    Coefficient of the detection window increase.

  - **groupThreshold**: `double`.

    Coefficient to regulate the similarity threshold. When detected, some objects can be covered
    by many rectangles. 0 means not to perform grouping.

  - **useMeanshiftGrouping**: `bool`.

    indicates grouping algorithm


  ##### Return
  - **foundLocations**: `[Rect]`.

    Vector of rectangles where each rectangle contains the detected object.

  - **foundWeights**: `[double]`.

    Vector that will contain confidence values for each detected object.




  Python prototype (for reference): 
  ```python3
  detectMultiScale(img[, hitThreshold[, winStride[, padding[, scale[, groupThreshold[, useMeanshiftGrouping]]]]]]) -> foundLocations, foundWeights
  ```

  """
  @spec detectMultiScale(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in()) :: {list({number(), number(), number(), number()}), list(number())} | {:error, String.t()}
  def detectMultiScale(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.hogDescriptor_detectMultiScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns coefficients of the classifier trained for people detection (for 48x96 windows).
  ##### Return
  - **retval**: `std::vector<float>`


  Python prototype (for reference): 
  ```python3
  getDaimlerPeopleDetector() -> retval
  ```

  """
  @spec getDaimlerPeopleDetector() :: list(number()) | {:error, String.t()}
  def getDaimlerPeopleDetector() do
    positional = [
    ]
    :evision_nif.hogDescriptor_getDaimlerPeopleDetector_static(positional)
    |> __to_struct__()
  end

  @doc """
  Returns coefficients of the classifier trained for people detection (for 64x128 windows).
  ##### Return
  - **retval**: `std::vector<float>`


  Python prototype (for reference): 
  ```python3
  getDefaultPeopleDetector() -> retval
  ```

  """
  @spec getDefaultPeopleDetector() :: list(number()) | {:error, String.t()}
  def getDefaultPeopleDetector() do
    positional = [
    ]
    :evision_nif.hogDescriptor_getDefaultPeopleDetector_static(positional)
    |> __to_struct__()
  end

  @doc """
  Returns the number of coefficients required for the classification.
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  getDescriptorSize() -> retval
  ```

  """
  @spec getDescriptorSize(Evision.HOGDescriptor.t()) :: integer() | {:error, String.t()}
  def getDescriptorSize(self) do
    positional = [
    ]
    :evision_nif.hogDescriptor_getDescriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns winSigma value
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getWinSigma() -> retval
  ```

  """
  @spec getWinSigma(Evision.HOGDescriptor.t()) :: number() | {:error, String.t()}
  def getWinSigma(self) do
    positional = [
    ]
    :evision_nif.hogDescriptor_getWinSigma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  loads HOGDescriptor parameters and coefficients for the linear SVM classifier from a file

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the file to read.


  ##### Keyword Arguments
  - **objname**: `String`.

    The optional name of the node to read (if empty, the first top-level node will be used).


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  load(filename[, objname]) -> retval
  ```

  """
  @spec load(Evision.HOGDescriptor.t(), binary(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def load(self, filename, opts) when is_binary(filename) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.hogDescriptor_load(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  loads HOGDescriptor parameters and coefficients for the linear SVM classifier from a file

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the file to read.


  ##### Keyword Arguments
  - **objname**: `String`.

    The optional name of the node to read (if empty, the first top-level node will be used).


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  load(filename[, objname]) -> retval
  ```

  """
  @spec load(Evision.HOGDescriptor.t(), binary()) :: boolean() | {:error, String.t()}
  def load(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.hogDescriptor_load(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  saves HOGDescriptor parameters and coefficients for the linear SVM classifier to a file

  ##### Positional Arguments
  - **filename**: `String`.

    File name


  ##### Keyword Arguments
  - **objname**: `String`.

    Object name





  Python prototype (for reference): 
  ```python3
  save(filename[, objname]) -> None
  ```

  """
  @spec save(Evision.HOGDescriptor.t(), binary(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def save(self, filename, opts) when is_binary(filename) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.hogDescriptor_save(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  saves HOGDescriptor parameters and coefficients for the linear SVM classifier to a file

  ##### Positional Arguments
  - **filename**: `String`.

    File name


  ##### Keyword Arguments
  - **objname**: `String`.

    Object name





  Python prototype (for reference): 
  ```python3
  save(filename[, objname]) -> None
  ```

  """
  @spec save(Evision.HOGDescriptor.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.hogDescriptor_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets coefficients for the linear SVM classifier.

  ##### Positional Arguments
  - **svmdetector**: `Evision.Mat`.

    coefficients for the linear SVM classifier.





  Python prototype (for reference): 
  ```python3
  setSVMDetector(svmdetector) -> None
  ```

  """
  @spec setSVMDetector(Evision.HOGDescriptor.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setSVMDetector(self, svmdetector) when (is_struct(svmdetector, Evision.Mat) or is_struct(svmdetector, Nx.Tensor))
  do
    positional = [
      svmdetector: Evision.Internal.Structurise.from_struct(svmdetector)
    ]
    :evision_nif.hogDescriptor_setSVMDetector(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec get_L2HysThreshold(Evision.HOGDescriptor.t()) :: number()
  def get_L2HysThreshold(self) do
    :evision_nif.hogDescriptor_get_L2HysThreshold(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_blockSize(Evision.HOGDescriptor.t()) :: {number(), number()}
  def get_blockSize(self) do
    :evision_nif.hogDescriptor_get_blockSize(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_blockStride(Evision.HOGDescriptor.t()) :: {number(), number()}
  def get_blockStride(self) do
    :evision_nif.hogDescriptor_get_blockStride(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_cellSize(Evision.HOGDescriptor.t()) :: {number(), number()}
  def get_cellSize(self) do
    :evision_nif.hogDescriptor_get_cellSize(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_derivAperture(Evision.HOGDescriptor.t()) :: integer()
  def get_derivAperture(self) do
    :evision_nif.hogDescriptor_get_derivAperture(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_gammaCorrection(Evision.HOGDescriptor.t()) :: boolean()
  def get_gammaCorrection(self) do
    :evision_nif.hogDescriptor_get_gammaCorrection(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_histogramNormType(Evision.HOGDescriptor.t()) :: integer()
  def get_histogramNormType(self) do
    :evision_nif.hogDescriptor_get_histogramNormType(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_nbins(Evision.HOGDescriptor.t()) :: integer()
  def get_nbins(self) do
    :evision_nif.hogDescriptor_get_nbins(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_nlevels(Evision.HOGDescriptor.t()) :: integer()
  def get_nlevels(self) do
    :evision_nif.hogDescriptor_get_nlevels(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_signedGradient(Evision.HOGDescriptor.t()) :: boolean()
  def get_signedGradient(self) do
    :evision_nif.hogDescriptor_get_signedGradient(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_svmDetector(Evision.HOGDescriptor.t()) :: list(number())
  def get_svmDetector(self) do
    :evision_nif.hogDescriptor_get_svmDetector(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_winSigma(Evision.HOGDescriptor.t()) :: number()
  def get_winSigma(self) do
    :evision_nif.hogDescriptor_get_winSigma(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_winSize(Evision.HOGDescriptor.t()) :: {number(), number()}
  def get_winSize(self) do
    :evision_nif.hogDescriptor_get_winSize(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
end
