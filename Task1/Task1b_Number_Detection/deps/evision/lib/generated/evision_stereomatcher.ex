defmodule Evision.StereoMatcher do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.StereoMatcher` struct.

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
  def __to_struct__({:ok, %{class: :StereoMatcher, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :StereoMatcher, ref: ref}) do
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
  @spec compute(Evision.StereoMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def compute(self, left, right, opts) when (is_struct(left, Evision.Mat) or is_struct(left, Nx.Tensor)) and (is_struct(right, Evision.Mat) or is_struct(right, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      left: Evision.Internal.Structurise.from_struct(left),
      right: Evision.Internal.Structurise.from_struct(right)
    ]
    :evision_nif.stereoMatcher_compute(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec compute(Evision.StereoMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def compute(self, left, right) when (is_struct(left, Evision.Mat) or is_struct(left, Nx.Tensor)) and (is_struct(right, Evision.Mat) or is_struct(right, Nx.Tensor))
  do
    positional = [
      left: Evision.Internal.Structurise.from_struct(left),
      right: Evision.Internal.Structurise.from_struct(right)
    ]
    :evision_nif.stereoMatcher_compute(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getBlockSize(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getBlockSize(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDisp12MaxDiff(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getDisp12MaxDiff(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getDisp12MaxDiff(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getMinDisparity(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getMinDisparity(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getMinDisparity(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getNumDisparities(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getNumDisparities(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getNumDisparities(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getSpeckleRange(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getSpeckleRange(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getSpeckleRange(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getSpeckleWindowSize(Evision.StereoMatcher.t()) :: integer() | {:error, String.t()}
  def getSpeckleWindowSize(self) do
    positional = [
    ]
    :evision_nif.stereoMatcher_getSpeckleWindowSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setBlockSize(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setBlockSize(self, blockSize) when is_integer(blockSize)
  do
    positional = [
      blockSize: Evision.Internal.Structurise.from_struct(blockSize)
    ]
    :evision_nif.stereoMatcher_setBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setDisp12MaxDiff(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setDisp12MaxDiff(self, disp12MaxDiff) when is_integer(disp12MaxDiff)
  do
    positional = [
      disp12MaxDiff: Evision.Internal.Structurise.from_struct(disp12MaxDiff)
    ]
    :evision_nif.stereoMatcher_setDisp12MaxDiff(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setMinDisparity(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setMinDisparity(self, minDisparity) when is_integer(minDisparity)
  do
    positional = [
      minDisparity: Evision.Internal.Structurise.from_struct(minDisparity)
    ]
    :evision_nif.stereoMatcher_setMinDisparity(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setNumDisparities(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setNumDisparities(self, numDisparities) when is_integer(numDisparities)
  do
    positional = [
      numDisparities: Evision.Internal.Structurise.from_struct(numDisparities)
    ]
    :evision_nif.stereoMatcher_setNumDisparities(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setSpeckleRange(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setSpeckleRange(self, speckleRange) when is_integer(speckleRange)
  do
    positional = [
      speckleRange: Evision.Internal.Structurise.from_struct(speckleRange)
    ]
    :evision_nif.stereoMatcher_setSpeckleRange(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setSpeckleWindowSize(Evision.StereoMatcher.t(), integer()) :: :ok | {:error, String.t()}
  def setSpeckleWindowSize(self, speckleWindowSize) when is_integer(speckleWindowSize)
  do
    positional = [
      speckleWindowSize: Evision.Internal.Structurise.from_struct(speckleWindowSize)
    ]
    :evision_nif.stereoMatcher_setSpeckleWindowSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
