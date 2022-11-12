defmodule Evision.KAZE do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.KAZE` struct.

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
  def __to_struct__({:ok, %{class: :KAZE, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :KAZE, ref: ref}) do
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
  @spec compute(Evision.KAZE.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t())), [{atom(), term()},...] | nil) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints, opts) when is_list(images) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.kaze_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec compute(Evision.KAZE.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t()), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.kaze_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec compute(Evision.KAZE.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t()))) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints) when is_list(images) and is_list(keypoints)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.kaze_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec compute(Evision.KAZE.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t())) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints)
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.kaze_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  The KAZE constructor
  ##### Keyword Arguments
  - **extended**: `bool`.

    Set to enable extraction of extended (128-byte) descriptor.

  - **upright**: `bool`.

    Set to enable use of upright descriptors (non rotation-invariant).

  - **threshold**: `float`.

    Detector response threshold to accept point

  - **nOctaves**: `int`.

    Maximum octave evolution of the image

  - **nOctaveLayers**: `int`.

    Default number of sublevels per scale level

  - **diffusivity**: `KAZE_DiffusivityType`.

    Diffusivity type. DIFF_PM_G1, DIFF_PM_G2, DIFF_WEICKERT or
    DIFF_CHARBONNIER


  ##### Return
  - **retval**: `Evision.KAZE`



  Python prototype (for reference): 
  ```python3
  create([, extended[, upright[, threshold[, nOctaves[, nOctaveLayers[, diffusivity]]]]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.KAZE.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.kaze_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The KAZE constructor
  ##### Keyword Arguments
  - **extended**: `bool`.

    Set to enable extraction of extended (128-byte) descriptor.

  - **upright**: `bool`.

    Set to enable use of upright descriptors (non rotation-invariant).

  - **threshold**: `float`.

    Detector response threshold to accept point

  - **nOctaves**: `int`.

    Maximum octave evolution of the image

  - **nOctaveLayers**: `int`.

    Default number of sublevels per scale level

  - **diffusivity**: `KAZE_DiffusivityType`.

    Diffusivity type. DIFF_PM_G1, DIFF_PM_G2, DIFF_WEICKERT or
    DIFF_CHARBONNIER


  ##### Return
  - **retval**: `Evision.KAZE`



  Python prototype (for reference): 
  ```python3
  create([, extended[, upright[, threshold[, nOctaves[, nOctaveLayers[, diffusivity]]]]]]) -> retval
  ```

  """
  @spec create() :: Evision.KAZE.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.kaze_create_static(positional)
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
  @spec defaultNorm(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def defaultNorm(self) do
    positional = [
    ]
    :evision_nif.kaze_defaultNorm(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorSize(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def descriptorSize(self) do
    positional = [
    ]
    :evision_nif.kaze_descriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorType(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def descriptorType(self) do
    positional = [
    ]
    :evision_nif.kaze_descriptorType(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detect(Evision.KAZE.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.kaze_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec detect(Evision.KAZE.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.kaze_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detect(Evision.KAZE.t(), list(Evision.Mat.maybe_mat_in())) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.kaze_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec detect(Evision.KAZE.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.kaze_detect(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detectAndCompute(Evision.KAZE.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.kaze_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detectAndCompute(Evision.KAZE.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.kaze_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec empty(Evision.KAZE.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.kaze_empty(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.KAZE.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.kaze_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `KAZE::DiffusivityType`


  Python prototype (for reference): 
  ```python3
  getDiffusivity() -> retval
  ```

  """
  @spec getDiffusivity(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def getDiffusivity(self) do
    positional = [
    ]
    :evision_nif.kaze_getDiffusivity(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getExtended() -> retval
  ```

  """
  @spec getExtended(Evision.KAZE.t()) :: boolean() | {:error, String.t()}
  def getExtended(self) do
    positional = [
    ]
    :evision_nif.kaze_getExtended(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNOctaveLayers() -> retval
  ```

  """
  @spec getNOctaveLayers(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def getNOctaveLayers(self) do
    positional = [
    ]
    :evision_nif.kaze_getNOctaveLayers(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNOctaves() -> retval
  ```

  """
  @spec getNOctaves(Evision.KAZE.t()) :: integer() | {:error, String.t()}
  def getNOctaves(self) do
    positional = [
    ]
    :evision_nif.kaze_getNOctaves(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getThreshold() -> retval
  ```

  """
  @spec getThreshold(Evision.KAZE.t()) :: number() | {:error, String.t()}
  def getThreshold(self) do
    positional = [
    ]
    :evision_nif.kaze_getThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getUpright() -> retval
  ```

  """
  @spec getUpright(Evision.KAZE.t()) :: boolean() | {:error, String.t()}
  def getUpright(self) do
    positional = [
    ]
    :evision_nif.kaze_getUpright(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.KAZE.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, arg1) when is_struct(arg1, Evision.FileNode)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.kaze_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec read(Evision.KAZE.t(), binary()) :: :ok | {:error, String.t()}
  def read(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.kaze_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **diff**: `KAZE_DiffusivityType`



  Python prototype (for reference): 
  ```python3
  setDiffusivity(diff) -> None
  ```

  """
  @spec setDiffusivity(Evision.KAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setDiffusivity(self, diff) when is_integer(diff)
  do
    positional = [
      diff: Evision.Internal.Structurise.from_struct(diff)
    ]
    :evision_nif.kaze_setDiffusivity(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **extended**: `bool`



  Python prototype (for reference): 
  ```python3
  setExtended(extended) -> None
  ```

  """
  @spec setExtended(Evision.KAZE.t(), boolean()) :: :ok | {:error, String.t()}
  def setExtended(self, extended) when is_boolean(extended)
  do
    positional = [
      extended: Evision.Internal.Structurise.from_struct(extended)
    ]
    :evision_nif.kaze_setExtended(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **octaveLayers**: `int`



  Python prototype (for reference): 
  ```python3
  setNOctaveLayers(octaveLayers) -> None
  ```

  """
  @spec setNOctaveLayers(Evision.KAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setNOctaveLayers(self, octaveLayers) when is_integer(octaveLayers)
  do
    positional = [
      octaveLayers: Evision.Internal.Structurise.from_struct(octaveLayers)
    ]
    :evision_nif.kaze_setNOctaveLayers(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **octaves**: `int`



  Python prototype (for reference): 
  ```python3
  setNOctaves(octaves) -> None
  ```

  """
  @spec setNOctaves(Evision.KAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setNOctaves(self, octaves) when is_integer(octaves)
  do
    positional = [
      octaves: Evision.Internal.Structurise.from_struct(octaves)
    ]
    :evision_nif.kaze_setNOctaves(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **threshold**: `double`



  Python prototype (for reference): 
  ```python3
  setThreshold(threshold) -> None
  ```

  """
  @spec setThreshold(Evision.KAZE.t(), number()) :: :ok | {:error, String.t()}
  def setThreshold(self, threshold) when is_number(threshold)
  do
    positional = [
      threshold: Evision.Internal.Structurise.from_struct(threshold)
    ]
    :evision_nif.kaze_setThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **upright**: `bool`



  Python prototype (for reference): 
  ```python3
  setUpright(upright) -> None
  ```

  """
  @spec setUpright(Evision.KAZE.t(), boolean()) :: :ok | {:error, String.t()}
  def setUpright(self, upright) when is_boolean(upright)
  do
    positional = [
      upright: Evision.Internal.Structurise.from_struct(upright)
    ]
    :evision_nif.kaze_setUpright(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.KAZE.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.kaze_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.KAZE.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.kaze_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec write(Evision.KAZE.t(), binary()) :: :ok | {:error, String.t()}
  def write(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.kaze_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
