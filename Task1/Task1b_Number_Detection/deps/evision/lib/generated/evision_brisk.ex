defmodule Evision.BRISK do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BRISK` struct.

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
  def __to_struct__({:ok, %{class: :BRISK, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BRISK, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Image set.


  ##### Return
  - **keypoints**: `[[Evision.KeyPoint]]`.

    Input collection of keypoints. Keypoints for which a descriptor cannot be
    computed are removed. Sometimes new keypoints can be added, for example: SIFT duplicates keypoint
    with several dominant orientations (for each orientation).

  - **descriptors**: `[Evision.Mat]`.

    Computed descriptors. In the second variant of the method descriptors[i] are
    descriptors computed for a keypoints[i]. Row j is the keypoints (or keypoints[i]) is the
    descriptor for keypoint j-th keypoint.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  compute(images, keypoints[, descriptors]) -> keypoints, descriptors
  ```

  #### Variant 2:
  Computes the descriptors for a set of keypoints detected in an image (first variant) or image set
  (second variant).


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Image.


  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`.

    Input collection of keypoints. Keypoints for which a descriptor cannot be
    computed are removed. Sometimes new keypoints can be added, for example: SIFT duplicates keypoint
    with several dominant orientations (for each orientation).

  - **descriptors**: `Evision.Mat`.

    Computed descriptors. In the second variant of the method descriptors[i] are
    descriptors computed for a keypoints[i]. Row j is the keypoints (or keypoints[i]) is the
    descriptor for keypoint j-th keypoint.




  Python prototype (for reference): 
  ```python3
  compute(image, keypoints[, descriptors]) -> keypoints, descriptors
  ```


  """
  @spec compute(Evision.BRISK.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t())), [{atom(), term()},...] | nil) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints, opts) when is_list(images) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.brisk_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec compute(Evision.BRISK.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t()), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.brisk_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Image set.


  ##### Return
  - **keypoints**: `[[Evision.KeyPoint]]`.

    Input collection of keypoints. Keypoints for which a descriptor cannot be
    computed are removed. Sometimes new keypoints can be added, for example: SIFT duplicates keypoint
    with several dominant orientations (for each orientation).

  - **descriptors**: `[Evision.Mat]`.

    Computed descriptors. In the second variant of the method descriptors[i] are
    descriptors computed for a keypoints[i]. Row j is the keypoints (or keypoints[i]) is the
    descriptor for keypoint j-th keypoint.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  compute(images, keypoints[, descriptors]) -> keypoints, descriptors
  ```

  #### Variant 2:
  Computes the descriptors for a set of keypoints detected in an image (first variant) or image set
  (second variant).


  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Image.


  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`.

    Input collection of keypoints. Keypoints for which a descriptor cannot be
    computed are removed. Sometimes new keypoints can be added, for example: SIFT duplicates keypoint
    with several dominant orientations (for each orientation).

  - **descriptors**: `Evision.Mat`.

    Computed descriptors. In the second variant of the method descriptors[i] are
    descriptors computed for a keypoints[i]. Row j is the keypoints (or keypoints[i]) is the
    descriptor for keypoint j-th keypoint.




  Python prototype (for reference): 
  ```python3
  compute(image, keypoints[, descriptors]) -> keypoints, descriptors
  ```


  """
  @spec compute(Evision.BRISK.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t()))) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints) when is_list(images) and is_list(keypoints)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.brisk_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec compute(Evision.BRISK.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t())) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints)
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.brisk_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  The BRISK constructor for a custom pattern, detection threshold and octaves

  ##### Positional Arguments
  - **thresh**: `int`.

    AGAST detection threshold score.

  - **octaves**: `int`.

    detection octaves. Use 0 to do single scale.

  - **radiusList**: `[float]`.

    defines the radii (in pixels) where the samples around a keypoint are taken (for
    keypoint scale 1).

  - **numberList**: `[int]`.

    defines the number of sampling points on the sampling circle. Must be the same
    size as radiusList..


  ##### Keyword Arguments
  - **dMax**: `float`.

    threshold for the short pairings used for descriptor formation (in pixels for keypoint
    scale 1).

  - **dMin**: `float`.

    threshold for the long pairings used for orientation determination (in pixels for
    keypoint scale 1).

  - **indexChange**: `[int]`.

    index remapping of the bits.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create(thresh, octaves, radiusList, numberList[, dMax[, dMin[, indexChange]]]) -> retval
  ```

  """
  @spec create(integer(), integer(), list(number()), list(integer()), [{atom(), term()},...] | nil) :: Evision.BRISK.t() | {:error, String.t()}
  def create(thresh, octaves, radiusList, numberList, opts) when is_integer(thresh) and is_integer(octaves) and is_list(radiusList) and is_list(numberList) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      thresh: Evision.Internal.Structurise.from_struct(thresh),
      octaves: Evision.Internal.Structurise.from_struct(octaves),
      radiusList: Evision.Internal.Structurise.from_struct(radiusList),
      numberList: Evision.Internal.Structurise.from_struct(numberList)
    ]
    :evision_nif.brisk_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The BRISK constructor for a custom pattern, detection threshold and octaves

  ##### Positional Arguments
  - **thresh**: `int`.

    AGAST detection threshold score.

  - **octaves**: `int`.

    detection octaves. Use 0 to do single scale.

  - **radiusList**: `[float]`.

    defines the radii (in pixels) where the samples around a keypoint are taken (for
    keypoint scale 1).

  - **numberList**: `[int]`.

    defines the number of sampling points on the sampling circle. Must be the same
    size as radiusList..


  ##### Keyword Arguments
  - **dMax**: `float`.

    threshold for the short pairings used for descriptor formation (in pixels for keypoint
    scale 1).

  - **dMin**: `float`.

    threshold for the long pairings used for orientation determination (in pixels for
    keypoint scale 1).

  - **indexChange**: `[int]`.

    index remapping of the bits.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create(thresh, octaves, radiusList, numberList[, dMax[, dMin[, indexChange]]]) -> retval
  ```

  """
  @spec create(integer(), integer(), list(number()), list(integer())) :: Evision.BRISK.t() | {:error, String.t()}
  def create(thresh, octaves, radiusList, numberList) when is_integer(thresh) and is_integer(octaves) and is_list(radiusList) and is_list(numberList)
  do
    positional = [
      thresh: Evision.Internal.Structurise.from_struct(thresh),
      octaves: Evision.Internal.Structurise.from_struct(octaves),
      radiusList: Evision.Internal.Structurise.from_struct(radiusList),
      numberList: Evision.Internal.Structurise.from_struct(numberList)
    ]
    :evision_nif.brisk_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  The BRISK constructor for a custom pattern

  ##### Positional Arguments
  - **radiusList**: `[float]`.

    defines the radii (in pixels) where the samples around a keypoint are taken (for
    keypoint scale 1).

  - **numberList**: `[int]`.

    defines the number of sampling points on the sampling circle. Must be the same
    size as radiusList..


  ##### Keyword Arguments
  - **dMax**: `float`.

    threshold for the short pairings used for descriptor formation (in pixels for keypoint
    scale 1).

  - **dMin**: `float`.

    threshold for the long pairings used for orientation determination (in pixels for
    keypoint scale 1).

  - **indexChange**: `[int]`.

    index remapping of the bits.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create(radiusList, numberList[, dMax[, dMin[, indexChange]]]) -> retval
  ```

  """
  @spec create(list(number()), list(integer()), [{atom(), term()},...] | nil) :: Evision.BRISK.t() | {:error, String.t()}
  def create(radiusList, numberList, opts) when is_list(radiusList) and is_list(numberList) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      radiusList: Evision.Internal.Structurise.from_struct(radiusList),
      numberList: Evision.Internal.Structurise.from_struct(numberList)
    ]
    :evision_nif.brisk_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The BRISK constructor for a custom pattern

  ##### Positional Arguments
  - **radiusList**: `[float]`.

    defines the radii (in pixels) where the samples around a keypoint are taken (for
    keypoint scale 1).

  - **numberList**: `[int]`.

    defines the number of sampling points on the sampling circle. Must be the same
    size as radiusList..


  ##### Keyword Arguments
  - **dMax**: `float`.

    threshold for the short pairings used for descriptor formation (in pixels for keypoint
    scale 1).

  - **dMin**: `float`.

    threshold for the long pairings used for orientation determination (in pixels for
    keypoint scale 1).

  - **indexChange**: `[int]`.

    index remapping of the bits.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create(radiusList, numberList[, dMax[, dMin[, indexChange]]]) -> retval
  ```

  """
  @spec create(list(number()), list(integer())) :: Evision.BRISK.t() | {:error, String.t()}
  def create(radiusList, numberList) when is_list(radiusList) and is_list(numberList)
  do
    positional = [
      radiusList: Evision.Internal.Structurise.from_struct(radiusList),
      numberList: Evision.Internal.Structurise.from_struct(numberList)
    ]
    :evision_nif.brisk_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  The BRISK constructor
  ##### Keyword Arguments
  - **thresh**: `int`.

    AGAST detection threshold score.

  - **octaves**: `int`.

    detection octaves. Use 0 to do single scale.

  - **patternScale**: `float`.

    apply this scale to the pattern used for sampling the neighbourhood of a
    keypoint.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create([, thresh[, octaves[, patternScale]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.BRISK.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.brisk_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The BRISK constructor
  ##### Keyword Arguments
  - **thresh**: `int`.

    AGAST detection threshold score.

  - **octaves**: `int`.

    detection octaves. Use 0 to do single scale.

  - **patternScale**: `float`.

    apply this scale to the pattern used for sampling the neighbourhood of a
    keypoint.


  ##### Return
  - **retval**: `Evision.BRISK`



  Python prototype (for reference): 
  ```python3
  create([, thresh[, octaves[, patternScale]]]) -> retval
  ```

  """
  @spec create() :: Evision.BRISK.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.brisk_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  defaultNorm() -> retval
  ```

  """
  @spec defaultNorm(Evision.BRISK.t()) :: integer() | {:error, String.t()}
  def defaultNorm(self) do
    positional = [
    ]
    :evision_nif.brisk_defaultNorm(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  descriptorSize() -> retval
  ```

  """
  @spec descriptorSize(Evision.BRISK.t()) :: integer() | {:error, String.t()}
  def descriptorSize(self) do
    positional = [
    ]
    :evision_nif.brisk_descriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  descriptorType() -> retval
  ```

  """
  @spec descriptorType(Evision.BRISK.t()) :: integer() | {:error, String.t()}
  def descriptorType(self) do
    positional = [
    ]
    :evision_nif.brisk_descriptorType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Image set.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).
    masks[i] is a mask for images[i].


  ##### Return
  - **keypoints**: `[[Evision.KeyPoint]]`.

    The detected keypoints. In the second variant of the method keypoints[i] is a set
    of keypoints detected in images[i] .


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  detect(images[, masks]) -> keypoints
  ```

  #### Variant 2:
  Detects keypoints in an image (first variant) or image set (second variant).

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Image.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying where to look for keypoints (optional). It must be a 8-bit integer
    matrix with non-zero values in the region of interest.


  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`.

    The detected keypoints. In the second variant of the method keypoints[i] is a set
    of keypoints detected in images[i] .




  Python prototype (for reference): 
  ```python3
  detect(image[, mask]) -> keypoints
  ```


  """
  @spec detect(Evision.BRISK.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.brisk_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec detect(Evision.BRISK.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.brisk_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Image set.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).
    masks[i] is a mask for images[i].


  ##### Return
  - **keypoints**: `[[Evision.KeyPoint]]`.

    The detected keypoints. In the second variant of the method keypoints[i] is a set
    of keypoints detected in images[i] .


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  detect(images[, masks]) -> keypoints
  ```

  #### Variant 2:
  Detects keypoints in an image (first variant) or image set (second variant).

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Image.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying where to look for keypoints (optional). It must be a 8-bit integer
    matrix with non-zero values in the region of interest.


  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`.

    The detected keypoints. In the second variant of the method keypoints[i] is a set
    of keypoints detected in images[i] .




  Python prototype (for reference): 
  ```python3
  detect(image[, mask]) -> keypoints
  ```


  """
  @spec detect(Evision.BRISK.t(), list(Evision.Mat.maybe_mat_in())) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.brisk_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec detect(Evision.BRISK.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.brisk_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`
  - **mask**: `Evision.Mat`

  ##### Keyword Arguments
  - **useProvidedKeypoints**: `bool`.

  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`
  - **descriptors**: `Evision.Mat`.

  Detects keypoints and computes the descriptors


  Python prototype (for reference): 
  ```python3
  detectAndCompute(image, mask[, descriptors[, useProvidedKeypoints]]) -> keypoints, descriptors
  ```

  """
  @spec detectAndCompute(Evision.BRISK.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.brisk_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`
  - **mask**: `Evision.Mat`

  ##### Keyword Arguments
  - **useProvidedKeypoints**: `bool`.

  ##### Return
  - **keypoints**: `[Evision.KeyPoint]`
  - **descriptors**: `Evision.Mat`.

  Detects keypoints and computes the descriptors


  Python prototype (for reference): 
  ```python3
  detectAndCompute(image, mask[, descriptors[, useProvidedKeypoints]]) -> keypoints, descriptors
  ```

  """
  @spec detectAndCompute(Evision.BRISK.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.brisk_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.BRISK.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.brisk_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  getDefaultName() -> retval
  ```

  """
  @spec getDefaultName(Evision.BRISK.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.brisk_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getOctaves() -> retval
  ```

  """
  @spec getOctaves(Evision.BRISK.t()) :: integer() | {:error, String.t()}
  def getOctaves(self) do
    positional = [
    ]
    :evision_nif.brisk_getOctaves(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getThreshold() -> retval
  ```

  """
  @spec getThreshold(Evision.BRISK.t()) :: integer() | {:error, String.t()}
  def getThreshold(self) do
    positional = [
    ]
    :evision_nif.brisk_getThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **arg1**: `Evision.FileNode`



  Python prototype (for reference): 
  ```python3
  read(arg1) -> None
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **fileName**: `String`



  Python prototype (for reference): 
  ```python3
  read(fileName) -> None
  ```


  """
  @spec read(Evision.BRISK.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, arg1) when is_struct(arg1, Evision.FileNode)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.brisk_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec read(Evision.BRISK.t(), binary()) :: :ok | {:error, String.t()}
  def read(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.brisk_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set detection octaves.

  ##### Positional Arguments
  - **octaves**: `int`.

    detection octaves. Use 0 to do single scale.





  Python prototype (for reference): 
  ```python3
  setOctaves(octaves) -> None
  ```

  """
  @spec setOctaves(Evision.BRISK.t(), integer()) :: :ok | {:error, String.t()}
  def setOctaves(self, octaves) when is_integer(octaves)
  do
    positional = [
      octaves: Evision.Internal.Structurise.from_struct(octaves)
    ]
    :evision_nif.brisk_setOctaves(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set detection threshold.

  ##### Positional Arguments
  - **threshold**: `int`.

    AGAST detection threshold score.





  Python prototype (for reference): 
  ```python3
  setThreshold(threshold) -> None
  ```

  """
  @spec setThreshold(Evision.BRISK.t(), integer()) :: :ok | {:error, String.t()}
  def setThreshold(self, threshold) when is_integer(threshold)
  do
    positional = [
      threshold: Evision.Internal.Structurise.from_struct(threshold)
    ]
    :evision_nif.brisk_setThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.




  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.BRISK.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.brisk_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.




  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **fileName**: `String`



  Python prototype (for reference): 
  ```python3
  write(fileName) -> None
  ```


  """
  @spec write(Evision.BRISK.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.brisk_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec write(Evision.BRISK.t(), binary()) :: :ok | {:error, String.t()}
  def write(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.brisk_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
