defmodule Evision.DISOpticalFlow do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DISOpticalFlow` struct.

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
  def __to_struct__({:ok, %{class: :DISOpticalFlow, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :DISOpticalFlow, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Creates an instance of DISOpticalFlow
  ##### Keyword Arguments
  - **preset**: `int`.

    one of PRESET_ULTRAFAST, PRESET_FAST and PRESET_MEDIUM


  ##### Return
  - **retval**: `Evision.DISOpticalFlow`



  Python prototype (for reference): 
  ```python3
  create([, preset]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.DISOpticalFlow.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.disOpticalFlow_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates an instance of DISOpticalFlow
  ##### Keyword Arguments
  - **preset**: `int`.

    one of PRESET_ULTRAFAST, PRESET_FAST and PRESET_MEDIUM


  ##### Return
  - **retval**: `Evision.DISOpticalFlow`



  Python prototype (for reference): 
  ```python3
  create([, preset]) -> retval
  ```

  """
  @spec create() :: Evision.DISOpticalFlow.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.disOpticalFlow_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Finest level of the Gaussian pyramid on which the flow is computed (zero level
  corresponds to the original image resolution). The final flow is obtained by bilinear upscaling.

  ##### Return
  - **retval**: `int`

  @see `setFinestScale/2`

  Python prototype (for reference): 
  ```python3
  getFinestScale() -> retval
  ```

  """
  @spec getFinestScale(Evision.DISOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getFinestScale(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getFinestScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Maximum number of gradient descent iterations in the patch inverse search stage. Higher values
  may improve quality in some cases.

  ##### Return
  - **retval**: `int`

  @see `setGradientDescentIterations/2`

  Python prototype (for reference): 
  ```python3
  getGradientDescentIterations() -> retval
  ```

  """
  @spec getGradientDescentIterations(Evision.DISOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getGradientDescentIterations(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getGradientDescentIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Size of an image patch for matching (in pixels). Normally, default 8x8 patches work well
  enough in most cases.

  ##### Return
  - **retval**: `int`

  @see `setPatchSize/2`

  Python prototype (for reference): 
  ```python3
  getPatchSize() -> retval
  ```

  """
  @spec getPatchSize(Evision.DISOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getPatchSize(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getPatchSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Stride between neighbor patches. Must be less than patch size. Lower values correspond
  to higher flow quality.

  ##### Return
  - **retval**: `int`

  @see `setPatchStride/2`

  Python prototype (for reference): 
  ```python3
  getPatchStride() -> retval
  ```

  """
  @spec getPatchStride(Evision.DISOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getPatchStride(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getPatchStride(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Whether to use mean-normalization of patches when computing patch distance. It is turned on
  by default as it typically provides a noticeable quality boost because of increased robustness to
  illumination variations. Turn it off if you are certain that your sequence doesn't contain any changes
  in illumination.

  ##### Return
  - **retval**: `bool`

  @see `setUseMeanNormalization/2`

  Python prototype (for reference): 
  ```python3
  getUseMeanNormalization() -> retval
  ```

  """
  @spec getUseMeanNormalization(Evision.DISOpticalFlow.t()) :: boolean() | {:error, String.t()}
  def getUseMeanNormalization(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getUseMeanNormalization(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Whether to use spatial propagation of good optical flow vectors. This option is turned on by
  default, as it tends to work better on average and can sometimes help recover from major errors
  introduced by the coarse-to-fine scheme employed by the DIS optical flow algorithm. Turning this
  option off can make the output flow field a bit smoother, however.

  ##### Return
  - **retval**: `bool`

  @see `setUseSpatialPropagation/2`

  Python prototype (for reference): 
  ```python3
  getUseSpatialPropagation() -> retval
  ```

  """
  @spec getUseSpatialPropagation(Evision.DISOpticalFlow.t()) :: boolean() | {:error, String.t()}
  def getUseSpatialPropagation(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getUseSpatialPropagation(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the smoothness term
  ##### Return
  - **retval**: `float`

  @see `setVariationalRefinementAlpha/2`

  Python prototype (for reference): 
  ```python3
  getVariationalRefinementAlpha() -> retval
  ```

  """
  @spec getVariationalRefinementAlpha(Evision.DISOpticalFlow.t()) :: number() | {:error, String.t()}
  def getVariationalRefinementAlpha(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getVariationalRefinementAlpha(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the color constancy term
  ##### Return
  - **retval**: `float`

  @see `setVariationalRefinementDelta/2`

  Python prototype (for reference): 
  ```python3
  getVariationalRefinementDelta() -> retval
  ```

  """
  @spec getVariationalRefinementDelta(Evision.DISOpticalFlow.t()) :: number() | {:error, String.t()}
  def getVariationalRefinementDelta(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getVariationalRefinementDelta(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the gradient constancy term
  ##### Return
  - **retval**: `float`

  @see `setVariationalRefinementGamma/2`

  Python prototype (for reference): 
  ```python3
  getVariationalRefinementGamma() -> retval
  ```

  """
  @spec getVariationalRefinementGamma(Evision.DISOpticalFlow.t()) :: number() | {:error, String.t()}
  def getVariationalRefinementGamma(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getVariationalRefinementGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Number of fixed point iterations of variational refinement per scale. Set to zero to
  disable variational refinement completely. Higher values will typically result in more smooth and
  high-quality flow.

  ##### Return
  - **retval**: `int`

  @see `setGradientDescentIterations/2`

  Python prototype (for reference): 
  ```python3
  getVariationalRefinementIterations() -> retval
  ```

  """
  @spec getVariationalRefinementIterations(Evision.DISOpticalFlow.t()) :: integer() | {:error, String.t()}
  def getVariationalRefinementIterations(self) do
    positional = [
    ]
    :evision_nif.disOpticalFlow_getVariationalRefinementIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getFinestScale/1`

  Python prototype (for reference): 
  ```python3
  setFinestScale(val) -> None
  ```

  """
  @spec setFinestScale(Evision.DISOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setFinestScale(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setFinestScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getGradientDescentIterations/1`

  Python prototype (for reference): 
  ```python3
  setGradientDescentIterations(val) -> None
  ```

  """
  @spec setGradientDescentIterations(Evision.DISOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setGradientDescentIterations(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setGradientDescentIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getPatchSize/1`

  Python prototype (for reference): 
  ```python3
  setPatchSize(val) -> None
  ```

  """
  @spec setPatchSize(Evision.DISOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setPatchSize(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setPatchSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getPatchStride/1`

  Python prototype (for reference): 
  ```python3
  setPatchStride(val) -> None
  ```

  """
  @spec setPatchStride(Evision.DISOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setPatchStride(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setPatchStride(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getUseMeanNormalization/1`

  Python prototype (for reference): 
  ```python3
  setUseMeanNormalization(val) -> None
  ```

  """
  @spec setUseMeanNormalization(Evision.DISOpticalFlow.t(), boolean()) :: :ok | {:error, String.t()}
  def setUseMeanNormalization(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setUseMeanNormalization(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getUseSpatialPropagation/1`

  Python prototype (for reference): 
  ```python3
  setUseSpatialPropagation(val) -> None
  ```

  """
  @spec setUseSpatialPropagation(Evision.DISOpticalFlow.t(), boolean()) :: :ok | {:error, String.t()}
  def setUseSpatialPropagation(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setUseSpatialPropagation(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getVariationalRefinementAlpha/1`

  Python prototype (for reference): 
  ```python3
  setVariationalRefinementAlpha(val) -> None
  ```

  """
  @spec setVariationalRefinementAlpha(Evision.DISOpticalFlow.t(), number()) :: :ok | {:error, String.t()}
  def setVariationalRefinementAlpha(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setVariationalRefinementAlpha(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getVariationalRefinementDelta/1`

  Python prototype (for reference): 
  ```python3
  setVariationalRefinementDelta(val) -> None
  ```

  """
  @spec setVariationalRefinementDelta(Evision.DISOpticalFlow.t(), number()) :: :ok | {:error, String.t()}
  def setVariationalRefinementDelta(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setVariationalRefinementDelta(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getVariationalRefinementGamma/1`

  Python prototype (for reference): 
  ```python3
  setVariationalRefinementGamma(val) -> None
  ```

  """
  @spec setVariationalRefinementGamma(Evision.DISOpticalFlow.t(), number()) :: :ok | {:error, String.t()}
  def setVariationalRefinementGamma(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setVariationalRefinementGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getGradientDescentIterations/1`

  Python prototype (for reference): 
  ```python3
  setVariationalRefinementIterations(val) -> None
  ```

  """
  @spec setVariationalRefinementIterations(Evision.DISOpticalFlow.t(), integer()) :: :ok | {:error, String.t()}
  def setVariationalRefinementIterations(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.disOpticalFlow_setVariationalRefinementIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
