defmodule Evision.AKAZE do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.AKAZE` struct.

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
  def __to_struct__({:ok, %{class: :AKAZE, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :AKAZE, ref: ref}) do
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
  @spec compute(Evision.AKAZE.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t())), [{atom(), term()},...] | nil) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints, opts) when is_list(images) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.akaze_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec compute(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t()), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.akaze_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec compute(Evision.AKAZE.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t()))) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints) when is_list(images) and is_list(keypoints)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.akaze_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec compute(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t())) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints)
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.akaze_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  The AKAZE constructor
  ##### Keyword Arguments
  - **descriptor_type**: `AKAZE_DescriptorType`.

    Type of the extracted descriptor: DESCRIPTOR_KAZE,
    DESCRIPTOR_KAZE_UPRIGHT, DESCRIPTOR_MLDB or DESCRIPTOR_MLDB_UPRIGHT.

  - **descriptor_size**: `int`.

    Size of the descriptor in bits. 0 -\\> Full size

  - **descriptor_channels**: `int`.

    Number of channels in the descriptor (1, 2, 3)

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
  - **retval**: `Evision.AKAZE`



  Python prototype (for reference): 
  ```python3
  create([, descriptor_type[, descriptor_size[, descriptor_channels[, threshold[, nOctaves[, nOctaveLayers[, diffusivity]]]]]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.AKAZE.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.akaze_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The AKAZE constructor
  ##### Keyword Arguments
  - **descriptor_type**: `AKAZE_DescriptorType`.

    Type of the extracted descriptor: DESCRIPTOR_KAZE,
    DESCRIPTOR_KAZE_UPRIGHT, DESCRIPTOR_MLDB or DESCRIPTOR_MLDB_UPRIGHT.

  - **descriptor_size**: `int`.

    Size of the descriptor in bits. 0 -\\> Full size

  - **descriptor_channels**: `int`.

    Number of channels in the descriptor (1, 2, 3)

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
  - **retval**: `Evision.AKAZE`



  Python prototype (for reference): 
  ```python3
  create([, descriptor_type[, descriptor_size[, descriptor_channels[, threshold[, nOctaves[, nOctaveLayers[, diffusivity]]]]]]]) -> retval
  ```

  """
  @spec create() :: Evision.AKAZE.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.akaze_create_static(positional)
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
  @spec defaultNorm(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def defaultNorm(self) do
    positional = [
    ]
    :evision_nif.akaze_defaultNorm(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorSize(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def descriptorSize(self) do
    positional = [
    ]
    :evision_nif.akaze_descriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorType(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def descriptorType(self) do
    positional = [
    ]
    :evision_nif.akaze_descriptorType(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detect(Evision.AKAZE.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.akaze_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec detect(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.akaze_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detect(Evision.AKAZE.t(), list(Evision.Mat.maybe_mat_in())) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.akaze_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec detect(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.akaze_detect(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detectAndCompute(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.akaze_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detectAndCompute(Evision.AKAZE.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.akaze_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec empty(Evision.AKAZE.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.akaze_empty(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.AKAZE.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.akaze_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getDescriptorChannels() -> retval
  ```

  """
  @spec getDescriptorChannels(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getDescriptorChannels(self) do
    positional = [
    ]
    :evision_nif.akaze_getDescriptorChannels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getDescriptorSize() -> retval
  ```

  """
  @spec getDescriptorSize(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getDescriptorSize(self) do
    positional = [
    ]
    :evision_nif.akaze_getDescriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `AKAZE::DescriptorType`


  Python prototype (for reference): 
  ```python3
  getDescriptorType() -> retval
  ```

  """
  @spec getDescriptorType(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getDescriptorType(self) do
    positional = [
    ]
    :evision_nif.akaze_getDescriptorType(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDiffusivity(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getDiffusivity(self) do
    positional = [
    ]
    :evision_nif.akaze_getDiffusivity(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getNOctaveLayers(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getNOctaveLayers(self) do
    positional = [
    ]
    :evision_nif.akaze_getNOctaveLayers(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getNOctaves(Evision.AKAZE.t()) :: integer() | {:error, String.t()}
  def getNOctaves(self) do
    positional = [
    ]
    :evision_nif.akaze_getNOctaves(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getThreshold(Evision.AKAZE.t()) :: number() | {:error, String.t()}
  def getThreshold(self) do
    positional = [
    ]
    :evision_nif.akaze_getThreshold(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.AKAZE.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, arg1) when is_struct(arg1, Evision.FileNode)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.akaze_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec read(Evision.AKAZE.t(), binary()) :: :ok | {:error, String.t()}
  def read(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.akaze_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dch**: `int`



  Python prototype (for reference): 
  ```python3
  setDescriptorChannels(dch) -> None
  ```

  """
  @spec setDescriptorChannels(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setDescriptorChannels(self, dch) when is_integer(dch)
  do
    positional = [
      dch: Evision.Internal.Structurise.from_struct(dch)
    ]
    :evision_nif.akaze_setDescriptorChannels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dsize**: `int`



  Python prototype (for reference): 
  ```python3
  setDescriptorSize(dsize) -> None
  ```

  """
  @spec setDescriptorSize(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setDescriptorSize(self, dsize) when is_integer(dsize)
  do
    positional = [
      dsize: Evision.Internal.Structurise.from_struct(dsize)
    ]
    :evision_nif.akaze_setDescriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dtype**: `AKAZE_DescriptorType`



  Python prototype (for reference): 
  ```python3
  setDescriptorType(dtype) -> None
  ```

  """
  @spec setDescriptorType(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setDescriptorType(self, dtype) when is_integer(dtype)
  do
    positional = [
      dtype: Evision.Internal.Structurise.from_struct(dtype)
    ]
    :evision_nif.akaze_setDescriptorType(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setDiffusivity(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setDiffusivity(self, diff) when is_integer(diff)
  do
    positional = [
      diff: Evision.Internal.Structurise.from_struct(diff)
    ]
    :evision_nif.akaze_setDiffusivity(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setNOctaveLayers(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setNOctaveLayers(self, octaveLayers) when is_integer(octaveLayers)
  do
    positional = [
      octaveLayers: Evision.Internal.Structurise.from_struct(octaveLayers)
    ]
    :evision_nif.akaze_setNOctaveLayers(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setNOctaves(Evision.AKAZE.t(), integer()) :: :ok | {:error, String.t()}
  def setNOctaves(self, octaves) when is_integer(octaves)
  do
    positional = [
      octaves: Evision.Internal.Structurise.from_struct(octaves)
    ]
    :evision_nif.akaze_setNOctaves(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setThreshold(Evision.AKAZE.t(), number()) :: :ok | {:error, String.t()}
  def setThreshold(self, threshold) when is_number(threshold)
  do
    positional = [
      threshold: Evision.Internal.Structurise.from_struct(threshold)
    ]
    :evision_nif.akaze_setThreshold(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.AKAZE.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.akaze_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.AKAZE.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.akaze_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec write(Evision.AKAZE.t(), binary()) :: :ok | {:error, String.t()}
  def write(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.akaze_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
