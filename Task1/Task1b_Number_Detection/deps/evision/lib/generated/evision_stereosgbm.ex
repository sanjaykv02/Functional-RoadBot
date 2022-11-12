defmodule Evision.StereoSGBM do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.StereoSGBM` struct.

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
  def __to_struct__({:ok, %{class: :StereoSGBM, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :StereoSGBM, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Computes disparity map for the specified stereo pair

  ##### Positional Arguments
  - **left**: `Evision.Mat`.

    Left 8-bit single-channel image.

  - **right**: `Evision.Mat`.

    Right image of the same size and the same type as the left one.


  ##### Return
  - **disparity**: `Evision.Mat`.

    Output disparity map. It has the same size as the input images. Some algorithms,
    like StereoBM or StereoSGBM compute 16-bit fixed-point disparity map (where each disparity value
    has 4 fractional bits), whereas other algorithms output 32-bit floating-point disparity map.




  Python prototype (for reference): 
  ```python3
  compute(left, right[, disparity]) -> disparity
  ```

  """
  @spec compute(Evision.StereoSGBM.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def compute(self, left, right, opts) when (is_struct(left, Evision.Mat) or is_struct(left, Nx.Tensor)) and (is_struct(right, Evision.Mat) or is_struct(right, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      left: Evision.Internal.Structurise.from_struct(left),
      right: Evision.Internal.Structurise.from_struct(right)
    ]
    :evision_nif.stereoSGBM_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes disparity map for the specified stereo pair

  ##### Positional Arguments
  - **left**: `Evision.Mat`.

    Left 8-bit single-channel image.

  - **right**: `Evision.Mat`.

    Right image of the same size and the same type as the left one.


  ##### Return
  - **disparity**: `Evision.Mat`.

    Output disparity map. It has the same size as the input images. Some algorithms,
    like StereoBM or StereoSGBM compute 16-bit fixed-point disparity map (where each disparity value
    has 4 fractional bits), whereas other algorithms output 32-bit floating-point disparity map.




  Python prototype (for reference): 
  ```python3
  compute(left, right[, disparity]) -> disparity
  ```

  """
  @spec compute(Evision.StereoSGBM.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def compute(self, left, right) when (is_struct(left, Evision.Mat) or is_struct(left, Nx.Tensor)) and (is_struct(right, Evision.Mat) or is_struct(right, Nx.Tensor))
  do
    positional = [
      left: Evision.Internal.Structurise.from_struct(left),
      right: Evision.Internal.Structurise.from_struct(right)
    ]
    :evision_nif.stereoSGBM_compute(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Creates StereoSGBM object
  ##### Keyword Arguments
  - **minDisparity**: `int`.

    Minimum possible disparity value. Normally, it is zero but sometimes
    rectification algorithms can shift images, so this parameter needs to be adjusted accordingly.

  - **numDisparities**: `int`.

    Maximum disparity minus minimum disparity. The value is always greater than
    zero. In the current implementation, this parameter must be divisible by 16.

  - **blockSize**: `int`.

    Matched block size. It must be an odd number \\>=1 . Normally, it should be
    somewhere in the 3..11 range.

  - **p1**: `int`.

    The first parameter controlling the disparity smoothness. See below.

  - **p2**: `int`.

    The second parameter controlling the disparity smoothness. The larger the values are,
    the smoother the disparity is. P1 is the penalty on the disparity change by plus or minus 1
    between neighbor pixels. P2 is the penalty on the disparity change by more than 1 between neighbor
    pixels. The algorithm requires P2 \\> P1 . See stereo_match.cpp sample where some reasonably good
    P1 and P2 values are shown (like 8\\*number_of_image_channels\\*blockSize\\*blockSize and
    32\\*number_of_image_channels\\*blockSize\\*blockSize , respectively).

  - **disp12MaxDiff**: `int`.

    Maximum allowed difference (in integer pixel units) in the left-right
    disparity check. Set it to a non-positive value to disable the check.

  - **preFilterCap**: `int`.

    Truncation value for the prefiltered image pixels. The algorithm first
    computes x-derivative at each pixel and clips its value by [-preFilterCap, preFilterCap] interval.
    The result values are passed to the Birchfield-Tomasi pixel cost function.

  - **uniquenessRatio**: `int`.

    Margin in percentage by which the best (minimum) computed cost function
    value should "win" the second best value to consider the found match correct. Normally, a value
    within the 5-15 range is good enough.

  - **speckleWindowSize**: `int`.

    Maximum size of smooth disparity regions to consider their noise speckles
    and invalidate. Set it to 0 to disable speckle filtering. Otherwise, set it somewhere in the
    50-200 range.

  - **speckleRange**: `int`.

    Maximum disparity variation within each connected component. If you do speckle
    filtering, set the parameter to a positive value, it will be implicitly multiplied by 16.
    Normally, 1 or 2 is good enough.

  - **mode**: `int`.

    Set it to StereoSGBM::MODE_HH to run the full-scale two-pass dynamic programming
    algorithm. It will consume O(W\\*H\\*numDisparities) bytes, which is large for 640x480 stereo and
    huge for HD-size pictures. By default, it is set to false .


  ##### Return
  - **retval**: `Evision.StereoSGBM`


  The first constructor initializes StereoSGBM with all the default parameters. So, you only have to
  set StereoSGBM::numDisparities at minimum. The second constructor enables you to set each parameter
  to a custom value.


  Python prototype (for reference): 
  ```python3
  create([, minDisparity[, numDisparities[, blockSize[, P1[, P2[, disp12MaxDiff[, preFilterCap[, uniquenessRatio[, speckleWindowSize[, speckleRange[, mode]]]]]]]]]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.StereoSGBM.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.stereoSGBM_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates StereoSGBM object
  ##### Keyword Arguments
  - **minDisparity**: `int`.

    Minimum possible disparity value. Normally, it is zero but sometimes
    rectification algorithms can shift images, so this parameter needs to be adjusted accordingly.

  - **numDisparities**: `int`.

    Maximum disparity minus minimum disparity. The value is always greater than
    zero. In the current implementation, this parameter must be divisible by 16.

  - **blockSize**: `int`.

    Matched block size. It must be an odd number \\>=1 . Normally, it should be
    somewhere in the 3..11 range.

  - **p1**: `int`.

    The first parameter controlling the disparity smoothness. See below.

  - **p2**: `int`.

    The second parameter controlling the disparity smoothness. The larger the values are,
    the smoother the disparity is. P1 is the penalty on the disparity change by plus or minus 1
    between neighbor pixels. P2 is the penalty on the disparity change by more than 1 between neighbor
    pixels. The algorithm requires P2 \\> P1 . See stereo_match.cpp sample where some reasonably good
    P1 and P2 values are shown (like 8\\*number_of_image_channels\\*blockSize\\*blockSize and
    32\\*number_of_image_channels\\*blockSize\\*blockSize , respectively).

  - **disp12MaxDiff**: `int`.

    Maximum allowed difference (in integer pixel units) in the left-right
    disparity check. Set it to a non-positive value to disable the check.

  - **preFilterCap**: `int`.

    Truncation value for the prefiltered image pixels. The algorithm first
    computes x-derivative at each pixel and clips its value by [-preFilterCap, preFilterCap] interval.
    The result values are passed to the Birchfield-Tomasi pixel cost function.

  - **uniquenessRatio**: `int`.

    Margin in percentage by which the best (minimum) computed cost function
    value should "win" the second best value to consider the found match correct. Normally, a value
    within the 5-15 range is good enough.

  - **speckleWindowSize**: `int`.

    Maximum size of smooth disparity regions to consider their noise speckles
    and invalidate. Set it to 0 to disable speckle filtering. Otherwise, set it somewhere in the
    50-200 range.

  - **speckleRange**: `int`.

    Maximum disparity variation within each connected component. If you do speckle
    filtering, set the parameter to a positive value, it will be implicitly multiplied by 16.
    Normally, 1 or 2 is good enough.

  - **mode**: `int`.

    Set it to StereoSGBM::MODE_HH to run the full-scale two-pass dynamic programming
    algorithm. It will consume O(W\\*H\\*numDisparities) bytes, which is large for 640x480 stereo and
    huge for HD-size pictures. By default, it is set to false .


  ##### Return
  - **retval**: `Evision.StereoSGBM`


  The first constructor initializes StereoSGBM with all the default parameters. So, you only have to
  set StereoSGBM::numDisparities at minimum. The second constructor enables you to set each parameter
  to a custom value.


  Python prototype (for reference): 
  ```python3
  create([, minDisparity[, numDisparities[, blockSize[, P1[, P2[, disp12MaxDiff[, preFilterCap[, uniquenessRatio[, speckleWindowSize[, speckleRange[, mode]]]]]]]]]]]) -> retval
  ```

  """
  @spec create() :: Evision.StereoSGBM.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.stereoSGBM_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getBlockSize() -> retval
  ```

  """
  @spec getBlockSize(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getBlockSize(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getDisp12MaxDiff() -> retval
  ```

  """
  @spec getDisp12MaxDiff(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getDisp12MaxDiff(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getDisp12MaxDiff(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMinDisparity() -> retval
  ```

  """
  @spec getMinDisparity(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getMinDisparity(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getMinDisparity(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMode() -> retval
  ```

  """
  @spec getMode(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getMode(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getMode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNumDisparities() -> retval
  ```

  """
  @spec getNumDisparities(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getNumDisparities(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getNumDisparities(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getP1() -> retval
  ```

  """
  @spec getP1(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getP1(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getP1(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getP2() -> retval
  ```

  """
  @spec getP2(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getP2(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getP2(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getPreFilterCap() -> retval
  ```

  """
  @spec getPreFilterCap(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getPreFilterCap(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getPreFilterCap(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getSpeckleRange() -> retval
  ```

  """
  @spec getSpeckleRange(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getSpeckleRange(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getSpeckleRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getSpeckleWindowSize() -> retval
  ```

  """
  @spec getSpeckleWindowSize(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getSpeckleWindowSize(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getSpeckleWindowSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getUniquenessRatio() -> retval
  ```

  """
  @spec getUniquenessRatio(Evision.StereoSGBM.t()) :: integer() | {:error, String.t()}
  def getUniquenessRatio(self) do
    positional = [
    ]
    :evision_nif.stereoSGBM_getUniquenessRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **blockSize**: `int`



  Python prototype (for reference): 
  ```python3
  setBlockSize(blockSize) -> None
  ```

  """
  @spec setBlockSize(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setBlockSize(self, blockSize) when is_integer(blockSize)
  do
    positional = [
      blockSize: Evision.Internal.Structurise.from_struct(blockSize)
    ]
    :evision_nif.stereoSGBM_setBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **disp12MaxDiff**: `int`



  Python prototype (for reference): 
  ```python3
  setDisp12MaxDiff(disp12MaxDiff) -> None
  ```

  """
  @spec setDisp12MaxDiff(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setDisp12MaxDiff(self, disp12MaxDiff) when is_integer(disp12MaxDiff)
  do
    positional = [
      disp12MaxDiff: Evision.Internal.Structurise.from_struct(disp12MaxDiff)
    ]
    :evision_nif.stereoSGBM_setDisp12MaxDiff(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **minDisparity**: `int`



  Python prototype (for reference): 
  ```python3
  setMinDisparity(minDisparity) -> None
  ```

  """
  @spec setMinDisparity(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setMinDisparity(self, minDisparity) when is_integer(minDisparity)
  do
    positional = [
      minDisparity: Evision.Internal.Structurise.from_struct(minDisparity)
    ]
    :evision_nif.stereoSGBM_setMinDisparity(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **mode**: `int`



  Python prototype (for reference): 
  ```python3
  setMode(mode) -> None
  ```

  """
  @spec setMode(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setMode(self, mode) when is_integer(mode)
  do
    positional = [
      mode: Evision.Internal.Structurise.from_struct(mode)
    ]
    :evision_nif.stereoSGBM_setMode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **numDisparities**: `int`



  Python prototype (for reference): 
  ```python3
  setNumDisparities(numDisparities) -> None
  ```

  """
  @spec setNumDisparities(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setNumDisparities(self, numDisparities) when is_integer(numDisparities)
  do
    positional = [
      numDisparities: Evision.Internal.Structurise.from_struct(numDisparities)
    ]
    :evision_nif.stereoSGBM_setNumDisparities(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **p1**: `int`



  Python prototype (for reference): 
  ```python3
  setP1(P1) -> None
  ```

  """
  @spec setP1(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setP1(self, p1) when is_integer(p1)
  do
    positional = [
      p1: Evision.Internal.Structurise.from_struct(p1)
    ]
    :evision_nif.stereoSGBM_setP1(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **p2**: `int`



  Python prototype (for reference): 
  ```python3
  setP2(P2) -> None
  ```

  """
  @spec setP2(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setP2(self, p2) when is_integer(p2)
  do
    positional = [
      p2: Evision.Internal.Structurise.from_struct(p2)
    ]
    :evision_nif.stereoSGBM_setP2(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **preFilterCap**: `int`



  Python prototype (for reference): 
  ```python3
  setPreFilterCap(preFilterCap) -> None
  ```

  """
  @spec setPreFilterCap(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setPreFilterCap(self, preFilterCap) when is_integer(preFilterCap)
  do
    positional = [
      preFilterCap: Evision.Internal.Structurise.from_struct(preFilterCap)
    ]
    :evision_nif.stereoSGBM_setPreFilterCap(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **speckleRange**: `int`



  Python prototype (for reference): 
  ```python3
  setSpeckleRange(speckleRange) -> None
  ```

  """
  @spec setSpeckleRange(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setSpeckleRange(self, speckleRange) when is_integer(speckleRange)
  do
    positional = [
      speckleRange: Evision.Internal.Structurise.from_struct(speckleRange)
    ]
    :evision_nif.stereoSGBM_setSpeckleRange(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **speckleWindowSize**: `int`



  Python prototype (for reference): 
  ```python3
  setSpeckleWindowSize(speckleWindowSize) -> None
  ```

  """
  @spec setSpeckleWindowSize(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setSpeckleWindowSize(self, speckleWindowSize) when is_integer(speckleWindowSize)
  do
    positional = [
      speckleWindowSize: Evision.Internal.Structurise.from_struct(speckleWindowSize)
    ]
    :evision_nif.stereoSGBM_setSpeckleWindowSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **uniquenessRatio**: `int`



  Python prototype (for reference): 
  ```python3
  setUniquenessRatio(uniquenessRatio) -> None
  ```

  """
  @spec setUniquenessRatio(Evision.StereoSGBM.t(), integer()) :: :ok | {:error, String.t()}
  def setUniquenessRatio(self, uniquenessRatio) when is_integer(uniquenessRatio)
  do
    positional = [
      uniquenessRatio: Evision.Internal.Structurise.from_struct(uniquenessRatio)
    ]
    :evision_nif.stereoSGBM_setUniquenessRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
