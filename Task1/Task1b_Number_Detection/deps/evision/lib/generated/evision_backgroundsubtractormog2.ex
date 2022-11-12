defmodule Evision.BackgroundSubtractorMOG2 do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BackgroundSubtractorMOG2` struct.

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
  def __to_struct__({:ok, %{class: :BackgroundSubtractorMOG2, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BackgroundSubtractorMOG2, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Computes a foreground mask.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Next video frame. Floating point frame will be used without scaling and should be in range \\f$[0,255]\\f$.


  ##### Keyword Arguments
  - **learningRate**: `double`.

    The value between 0 and 1 that indicates how fast the background model is
    learnt. Negative parameter value makes the algorithm to use some automatically chosen learning
    rate. 0 means that the background model is not updated at all, 1 means that the background model
    is completely reinitialized from the last frame.


  ##### Return
  - **fgmask**: `Evision.Mat`.

    The output foreground mask as an 8-bit binary image.




  Python prototype (for reference): 
  ```python3
  apply(image[, fgmask[, learningRate]]) -> fgmask
  ```

  """
  @spec apply(Evision.BackgroundSubtractorMOG2.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.backgroundSubtractorMOG2_apply(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes a foreground mask.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Next video frame. Floating point frame will be used without scaling and should be in range \\f$[0,255]\\f$.


  ##### Keyword Arguments
  - **learningRate**: `double`.

    The value between 0 and 1 that indicates how fast the background model is
    learnt. Negative parameter value makes the algorithm to use some automatically chosen learning
    rate. 0 means that the background model is not updated at all, 1 means that the background model
    is completely reinitialized from the last frame.


  ##### Return
  - **fgmask**: `Evision.Mat`.

    The output foreground mask as an 8-bit binary image.




  Python prototype (for reference): 
  ```python3
  apply(image[, fgmask[, learningRate]]) -> fgmask
  ```

  """
  @spec apply(Evision.BackgroundSubtractorMOG2.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.backgroundSubtractorMOG2_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the "background ratio" parameter of the algorithm
  ##### Return
  - **retval**: `double`

  If a foreground pixel keeps semi-constant value for about backgroundRatio\\*history frames, it's
  considered background and added to the model as a center of a new component. It corresponds to TB
  parameter in the paper.

  Python prototype (for reference): 
  ```python3
  getBackgroundRatio() -> retval
  ```

  """
  @spec getBackgroundRatio(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getBackgroundRatio(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getBackgroundRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the complexity reduction threshold
  ##### Return
  - **retval**: `double`

  This parameter defines the number of samples needed to accept to prove the component exists. CT=0.05
  is a default value for all the samples. By setting CT=0 you get an algorithm very similar to the
  standard Stauffer&Grimson algorithm.

  Python prototype (for reference): 
  ```python3
  getComplexityReductionThreshold() -> retval
  ```

  """
  @spec getComplexityReductionThreshold(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getComplexityReductionThreshold(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getComplexityReductionThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the shadow detection flag
  ##### Return
  - **retval**: `bool`

  If true, the algorithm detects shadows and marks them. See createBackgroundSubtractorMOG2 for
  details.

  Python prototype (for reference): 
  ```python3
  getDetectShadows() -> retval
  ```

  """
  @spec getDetectShadows(Evision.BackgroundSubtractorMOG2.t()) :: boolean() | {:error, String.t()}
  def getDetectShadows(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getDetectShadows(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the number of last frames that affect the background model
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getHistory() -> retval
  ```

  """
  @spec getHistory(Evision.BackgroundSubtractorMOG2.t()) :: integer() | {:error, String.t()}
  def getHistory(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getHistory(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the number of gaussian components in the background model
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNMixtures() -> retval
  ```

  """
  @spec getNMixtures(Evision.BackgroundSubtractorMOG2.t()) :: integer() | {:error, String.t()}
  def getNMixtures(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getNMixtures(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the shadow threshold
  ##### Return
  - **retval**: `double`

  A shadow is detected if pixel is a darker version of the background. The shadow threshold (Tau in
  the paper) is a threshold defining how much darker the shadow can be. Tau= 0.5 means that if a pixel
  is more than twice darker then it is not shadow. See Prati, Mikic, Trivedi and Cucchiara,
  Detecting Moving Shadows...*, IEEE PAMI,2003.

  Python prototype (for reference): 
  ```python3
  getShadowThreshold() -> retval
  ```

  """
  @spec getShadowThreshold(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getShadowThreshold(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getShadowThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the shadow value
  ##### Return
  - **retval**: `int`

  Shadow value is the value used to mark shadows in the foreground mask. Default value is 127. Value 0
  in the mask always means background, 255 means foreground.

  Python prototype (for reference): 
  ```python3
  getShadowValue() -> retval
  ```

  """
  @spec getShadowValue(Evision.BackgroundSubtractorMOG2.t()) :: integer() | {:error, String.t()}
  def getShadowValue(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getShadowValue(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the initial variance of each gaussian component
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getVarInit() -> retval
  ```

  """
  @spec getVarInit(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getVarInit(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getVarInit(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getVarMax() -> retval
  ```

  """
  @spec getVarMax(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getVarMax(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getVarMax(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getVarMin() -> retval
  ```

  """
  @spec getVarMin(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getVarMin(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getVarMin(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the variance threshold for the pixel-model match
  ##### Return
  - **retval**: `double`

  The main threshold on the squared Mahalanobis distance to decide if the sample is well described by
  the background model or not. Related to Cthr from the paper.

  Python prototype (for reference): 
  ```python3
  getVarThreshold() -> retval
  ```

  """
  @spec getVarThreshold(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getVarThreshold(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getVarThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the variance threshold for the pixel-model match used for new mixture component generation
  ##### Return
  - **retval**: `double`

  Threshold for the squared Mahalanobis distance that helps decide when a sample is close to the
  existing components (corresponds to Tg in the paper). If a pixel is not close to any component, it
  is considered foreground or added as a new component. 3 sigma =\\> Tg=3\\*3=9 is default. A smaller Tg
  value generates more components. A higher Tg value may result in a small number of components but
  they can grow too large.

  Python prototype (for reference): 
  ```python3
  getVarThresholdGen() -> retval
  ```

  """
  @spec getVarThresholdGen(Evision.BackgroundSubtractorMOG2.t()) :: number() | {:error, String.t()}
  def getVarThresholdGen(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractorMOG2_getVarThresholdGen(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the "background ratio" parameter of the algorithm

  ##### Positional Arguments
  - **ratio**: `double`



  Python prototype (for reference): 
  ```python3
  setBackgroundRatio(ratio) -> None
  ```

  """
  @spec setBackgroundRatio(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setBackgroundRatio(self, ratio) when is_number(ratio)
  do
    positional = [
      ratio: Evision.Internal.Structurise.from_struct(ratio)
    ]
    :evision_nif.backgroundSubtractorMOG2_setBackgroundRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the complexity reduction threshold

  ##### Positional Arguments
  - **ct**: `double`



  Python prototype (for reference): 
  ```python3
  setComplexityReductionThreshold(ct) -> None
  ```

  """
  @spec setComplexityReductionThreshold(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setComplexityReductionThreshold(self, ct) when is_number(ct)
  do
    positional = [
      ct: Evision.Internal.Structurise.from_struct(ct)
    ]
    :evision_nif.backgroundSubtractorMOG2_setComplexityReductionThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Enables or disables shadow detection

  ##### Positional Arguments
  - **detectShadows**: `bool`



  Python prototype (for reference): 
  ```python3
  setDetectShadows(detectShadows) -> None
  ```

  """
  @spec setDetectShadows(Evision.BackgroundSubtractorMOG2.t(), boolean()) :: :ok | {:error, String.t()}
  def setDetectShadows(self, detectShadows) when is_boolean(detectShadows)
  do
    positional = [
      detectShadows: Evision.Internal.Structurise.from_struct(detectShadows)
    ]
    :evision_nif.backgroundSubtractorMOG2_setDetectShadows(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the number of last frames that affect the background model

  ##### Positional Arguments
  - **history**: `int`



  Python prototype (for reference): 
  ```python3
  setHistory(history) -> None
  ```

  """
  @spec setHistory(Evision.BackgroundSubtractorMOG2.t(), integer()) :: :ok | {:error, String.t()}
  def setHistory(self, history) when is_integer(history)
  do
    positional = [
      history: Evision.Internal.Structurise.from_struct(history)
    ]
    :evision_nif.backgroundSubtractorMOG2_setHistory(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the number of gaussian components in the background model.

  ##### Positional Arguments
  - **nmixtures**: `int`


  The model needs to be reinitalized to reserve memory.

  Python prototype (for reference): 
  ```python3
  setNMixtures(nmixtures) -> None
  ```

  """
  @spec setNMixtures(Evision.BackgroundSubtractorMOG2.t(), integer()) :: :ok | {:error, String.t()}
  def setNMixtures(self, nmixtures) when is_integer(nmixtures)
  do
    positional = [
      nmixtures: Evision.Internal.Structurise.from_struct(nmixtures)
    ]
    :evision_nif.backgroundSubtractorMOG2_setNMixtures(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the shadow threshold

  ##### Positional Arguments
  - **threshold**: `double`



  Python prototype (for reference): 
  ```python3
  setShadowThreshold(threshold) -> None
  ```

  """
  @spec setShadowThreshold(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setShadowThreshold(self, threshold) when is_number(threshold)
  do
    positional = [
      threshold: Evision.Internal.Structurise.from_struct(threshold)
    ]
    :evision_nif.backgroundSubtractorMOG2_setShadowThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the shadow value

  ##### Positional Arguments
  - **value**: `int`



  Python prototype (for reference): 
  ```python3
  setShadowValue(value) -> None
  ```

  """
  @spec setShadowValue(Evision.BackgroundSubtractorMOG2.t(), integer()) :: :ok | {:error, String.t()}
  def setShadowValue(self, value) when is_integer(value)
  do
    positional = [
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.backgroundSubtractorMOG2_setShadowValue(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the initial variance of each gaussian component

  ##### Positional Arguments
  - **varInit**: `double`



  Python prototype (for reference): 
  ```python3
  setVarInit(varInit) -> None
  ```

  """
  @spec setVarInit(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setVarInit(self, varInit) when is_number(varInit)
  do
    positional = [
      varInit: Evision.Internal.Structurise.from_struct(varInit)
    ]
    :evision_nif.backgroundSubtractorMOG2_setVarInit(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **varMax**: `double`



  Python prototype (for reference): 
  ```python3
  setVarMax(varMax) -> None
  ```

  """
  @spec setVarMax(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setVarMax(self, varMax) when is_number(varMax)
  do
    positional = [
      varMax: Evision.Internal.Structurise.from_struct(varMax)
    ]
    :evision_nif.backgroundSubtractorMOG2_setVarMax(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **varMin**: `double`



  Python prototype (for reference): 
  ```python3
  setVarMin(varMin) -> None
  ```

  """
  @spec setVarMin(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setVarMin(self, varMin) when is_number(varMin)
  do
    positional = [
      varMin: Evision.Internal.Structurise.from_struct(varMin)
    ]
    :evision_nif.backgroundSubtractorMOG2_setVarMin(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the variance threshold for the pixel-model match

  ##### Positional Arguments
  - **varThreshold**: `double`



  Python prototype (for reference): 
  ```python3
  setVarThreshold(varThreshold) -> None
  ```

  """
  @spec setVarThreshold(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setVarThreshold(self, varThreshold) when is_number(varThreshold)
  do
    positional = [
      varThreshold: Evision.Internal.Structurise.from_struct(varThreshold)
    ]
    :evision_nif.backgroundSubtractorMOG2_setVarThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets the variance threshold for the pixel-model match used for new mixture component generation

  ##### Positional Arguments
  - **varThresholdGen**: `double`



  Python prototype (for reference): 
  ```python3
  setVarThresholdGen(varThresholdGen) -> None
  ```

  """
  @spec setVarThresholdGen(Evision.BackgroundSubtractorMOG2.t(), number()) :: :ok | {:error, String.t()}
  def setVarThresholdGen(self, varThresholdGen) when is_number(varThresholdGen)
  do
    positional = [
      varThresholdGen: Evision.Internal.Structurise.from_struct(varThresholdGen)
    ]
    :evision_nif.backgroundSubtractorMOG2_setVarThresholdGen(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
