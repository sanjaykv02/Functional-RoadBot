defmodule Evision.AffineFeature do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.AffineFeature` struct.

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
  def __to_struct__({:ok, %{class: :AffineFeature, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :AffineFeature, ref: ref}) do
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
  @spec compute(Evision.AffineFeature.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t())), [{atom(), term()},...] | nil) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints, opts) when is_list(images) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.affineFeature_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec compute(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t()), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.affineFeature_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec compute(Evision.AffineFeature.t(), list(Evision.Mat.maybe_mat_in()), list(list(Evision.KeyPoint.t()))) :: {list(list(Evision.KeyPoint.t())), list(Evision.Mat.t())} | {:error, String.t()}
  def compute(self, images, keypoints) when is_list(images) and is_list(keypoints)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.affineFeature_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec compute(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in(), list(Evision.KeyPoint.t())) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def compute(self, image, keypoints) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_list(keypoints)
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      keypoints: Evision.Internal.Structurise.from_struct(keypoints)
    ]
    :evision_nif.affineFeature_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **backend**: `Evision.Feature2D`.

    The detector/extractor you want to use as backend.


  ##### Keyword Arguments
  - **maxTilt**: `int`.

    The highest power index of tilt factor. 5 is used in the paper as tilt sampling range n.

  - **minTilt**: `int`.

    The lowest power index of tilt factor. 0 is used in the paper.

  - **tiltStep**: `float`.

    Tilt sampling step \\f$\\delta_t\\f$ in Algorithm 1 in the paper.

  - **rotateStepBase**: `float`.

    Rotation sampling step factor b in Algorithm 1 in the paper.


  ##### Return
  - **retval**: `Evision.AffineFeature`



  Python prototype (for reference): 
  ```python3
  create(backend[, maxTilt[, minTilt[, tiltStep[, rotateStepBase]]]]) -> retval
  ```

  """
  @spec create(Evision.Feature2D.t(), [{atom(), term()},...] | nil) :: Evision.AffineFeature.t() | {:error, String.t()}
  def create(backend, opts) when is_struct(backend, Evision.Feature2D) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      backend: Evision.Internal.Structurise.from_struct(backend)
    ]
    :evision_nif.affineFeature_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **backend**: `Evision.Feature2D`.

    The detector/extractor you want to use as backend.


  ##### Keyword Arguments
  - **maxTilt**: `int`.

    The highest power index of tilt factor. 5 is used in the paper as tilt sampling range n.

  - **minTilt**: `int`.

    The lowest power index of tilt factor. 0 is used in the paper.

  - **tiltStep**: `float`.

    Tilt sampling step \\f$\\delta_t\\f$ in Algorithm 1 in the paper.

  - **rotateStepBase**: `float`.

    Rotation sampling step factor b in Algorithm 1 in the paper.


  ##### Return
  - **retval**: `Evision.AffineFeature`



  Python prototype (for reference): 
  ```python3
  create(backend[, maxTilt[, minTilt[, tiltStep[, rotateStepBase]]]]) -> retval
  ```

  """
  @spec create(Evision.Feature2D.t()) :: Evision.AffineFeature.t() | {:error, String.t()}
  def create(backend) when is_struct(backend, Evision.Feature2D)
  do
    positional = [
      backend: Evision.Internal.Structurise.from_struct(backend)
    ]
    :evision_nif.affineFeature_create_static(positional)
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
  @spec defaultNorm(Evision.AffineFeature.t()) :: integer() | {:error, String.t()}
  def defaultNorm(self) do
    positional = [
    ]
    :evision_nif.affineFeature_defaultNorm(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorSize(Evision.AffineFeature.t()) :: integer() | {:error, String.t()}
  def descriptorSize(self) do
    positional = [
    ]
    :evision_nif.affineFeature_descriptorSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec descriptorType(Evision.AffineFeature.t()) :: integer() | {:error, String.t()}
  def descriptorType(self) do
    positional = [
    ]
    :evision_nif.affineFeature_descriptorType(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detect(Evision.AffineFeature.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.affineFeature_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec detect(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.affineFeature_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detect(Evision.AffineFeature.t(), list(Evision.Mat.maybe_mat_in())) :: list(list(Evision.KeyPoint.t())) | {:error, String.t()}
  def detect(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.affineFeature_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec detect(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.affineFeature_detect(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec detectAndCompute(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.affineFeature_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec detectAndCompute(Evision.AffineFeature.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {list(Evision.KeyPoint.t()), Evision.Mat.t()} | {:error, String.t()}
  def detectAndCompute(self, image, mask) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.affineFeature_detectAndCompute(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec empty(Evision.AffineFeature.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.affineFeature_empty(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.AffineFeature.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.affineFeature_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **tilts**: `[float]`
  - **rolls**: `[float]`



  Python prototype (for reference): 
  ```python3
  getViewParams(tilts, rolls) -> None
  ```

  """
  @spec getViewParams(Evision.AffineFeature.t(), list(number()), list(number())) :: :ok | {:error, String.t()}
  def getViewParams(self, tilts, rolls) when is_list(tilts) and is_list(rolls)
  do
    positional = [
      tilts: Evision.Internal.Structurise.from_struct(tilts),
      rolls: Evision.Internal.Structurise.from_struct(rolls)
    ]
    :evision_nif.affineFeature_getViewParams(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.AffineFeature.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, arg1) when is_struct(arg1, Evision.FileNode)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.affineFeature_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec read(Evision.AffineFeature.t(), binary()) :: :ok | {:error, String.t()}
  def read(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.affineFeature_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **tilts**: `[float]`
  - **rolls**: `[float]`



  Python prototype (for reference): 
  ```python3
  setViewParams(tilts, rolls) -> None
  ```

  """
  @spec setViewParams(Evision.AffineFeature.t(), list(number()), list(number())) :: :ok | {:error, String.t()}
  def setViewParams(self, tilts, rolls) when is_list(tilts) and is_list(rolls)
  do
    positional = [
      tilts: Evision.Internal.Structurise.from_struct(tilts),
      rolls: Evision.Internal.Structurise.from_struct(rolls)
    ]
    :evision_nif.affineFeature_setViewParams(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.AffineFeature.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.affineFeature_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.AffineFeature.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.affineFeature_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec write(Evision.AffineFeature.t(), binary()) :: :ok | {:error, String.t()}
  def write(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.affineFeature_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
