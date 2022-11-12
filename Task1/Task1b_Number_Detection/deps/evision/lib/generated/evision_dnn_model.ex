defmodule Evision.DNN.Model do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.Model` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.Model", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.Model", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  #### Variant 1:
  Create model from deep learning network.

  ##### Positional Arguments
  - **network**: `Evision.DNN.Net`.

    Net object.


  ##### Return
  - **self**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  Model(network) -> <dnn_Model object>
  ```

  #### Variant 2:
  Create model from deep learning network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  Model(model[, config]) -> <dnn_Model object>
  ```


  """
  @spec model(Evision.DNN.Net.t()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def model(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_Model_Model(positional)
    |> __to_struct__()
  end
  @spec model(binary()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def model(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_Model_Model(positional)
    |> __to_struct__()
  end

  @doc """
  Create model from deep learning network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  Model(model[, config]) -> <dnn_Model object>
  ```

  """
  @spec model(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.Model.t() | {:error, String.t()}
  def model(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_Model_Model(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return the output @p blobs.

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **outs**: `[Evision.Mat]`.

    Allocated output blobs, which will store results of the computation.




  Python prototype (for reference): 
  ```python3
  predict(frame[, outs]) -> outs
  ```

  """
  @spec predict(Evision.DNN.Model.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def predict(self, frame, opts) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_Model_predict(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net and return the output @p blobs.

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **outs**: `[Evision.Mat]`.

    Allocated output blobs, which will store results of the computation.




  Python prototype (for reference): 
  ```python3
  predict(frame[, outs]) -> outs
  ```

  """
  @spec predict(Evision.DNN.Model.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def predict(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_Model_predict(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set flag crop for frame.

  ##### Positional Arguments
  - **crop**: `bool`.

    Flag which indicates whether image will be cropped after resize or not.


  ##### Return
  - **retval**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  setInputCrop(crop) -> retval
  ```

  """
  @spec setInputCrop(Evision.DNN.Model.t(), boolean()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputCrop(self, crop) when is_boolean(crop)
  do
    positional = [
      crop: Evision.Internal.Structurise.from_struct(crop)
    ]
    :evision_nif.dnn_dnn_Model_setInputCrop(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set mean value for frame.

  ##### Positional Arguments
  - **mean**: `Scalar`.

    Scalar with mean values which are subtracted from channels.


  ##### Return
  - **retval**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  setInputMean(mean) -> retval
  ```

  """
  @spec setInputMean(Evision.DNN.Model.t(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputMean(self, mean) when is_tuple(mean)
  do
    positional = [
      mean: Evision.Internal.Structurise.from_struct(mean)
    ]
    :evision_nif.dnn_dnn_Model_setInputMean(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set preprocessing parameters for frame.
  ##### Keyword Arguments
  - **scale**: `double`.

    Multiplier for frame values.

  - **size**: `Size`.

    New input size.

  - **mean**: `Scalar`.

    Scalar with mean values which are subtracted from channels.

  - **swapRB**: `bool`.

    Flag which indicates that swap first and last channels.

  - **crop**: `bool`.

    Flag which indicates whether image will be cropped after resize or not.
    blob(n, c, y, x) = scale * resize( frame(y, x, c) ) - mean(c) )





  Python prototype (for reference): 
  ```python3
  setInputParams([, scale[, size[, mean[, swapRB[, crop]]]]]) -> None
  ```

  """
  @spec setInputParams(Evision.DNN.Model.t()) :: :ok | {:error, String.t()}
  def setInputParams(self) do
    positional = [
    ]
    :evision_nif.dnn_dnn_Model_setInputParams(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set scalefactor value for frame.

  ##### Positional Arguments
  - **scale**: `double`.

    Multiplier for frame values.


  ##### Return
  - **retval**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  setInputScale(scale) -> retval
  ```

  """
  @spec setInputScale(Evision.DNN.Model.t(), number()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputScale(self, scale) when is_number(scale)
  do
    positional = [
      scale: Evision.Internal.Structurise.from_struct(scale)
    ]
    :evision_nif.dnn_dnn_Model_setInputScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **width**: `int`.

    New input width.

  - **height**: `int`.

    New input height.


  ##### Return
  - **retval**: `Evision.DNN.Model`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  setInputSize(width, height) -> retval
  ```

  """
  @spec setInputSize(Evision.DNN.Model.t(), integer(), integer()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputSize(self, width, height) when is_integer(width) and is_integer(height)
  do
    positional = [
      width: Evision.Internal.Structurise.from_struct(width),
      height: Evision.Internal.Structurise.from_struct(height)
    ]
    :evision_nif.dnn_dnn_Model_setInputSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set input size for frame.

  ##### Positional Arguments
  - **size**: `Size`.

    New input size.


  ##### Return
  - **retval**: `Evision.DNN.Model`

  **Note**: If shape of the new blob less than 0, then frame size not change.

  Python prototype (for reference): 
  ```python3
  setInputSize(size) -> retval
  ```

  """
  @spec setInputSize(Evision.DNN.Model.t(), {number(), number()}) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputSize(self, size) when is_tuple(size)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size)
    ]
    :evision_nif.dnn_dnn_Model_setInputSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Set flag swapRB for frame.

  ##### Positional Arguments
  - **swapRB**: `bool`.

    Flag which indicates that swap first and last channels.


  ##### Return
  - **retval**: `Evision.DNN.Model`



  Python prototype (for reference): 
  ```python3
  setInputSwapRB(swapRB) -> retval
  ```

  """
  @spec setInputSwapRB(Evision.DNN.Model.t(), boolean()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setInputSwapRB(self, swapRB) when is_boolean(swapRB)
  do
    positional = [
      swapRB: Evision.Internal.Structurise.from_struct(swapRB)
    ]
    :evision_nif.dnn_dnn_Model_setInputSwapRB(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **backendId**: `dnn_Backend`

  ##### Return
  - **retval**: `Evision.DNN.Model`


  Python prototype (for reference): 
  ```python3
  setPreferableBackend(backendId) -> retval
  ```

  """
  @spec setPreferableBackend(Evision.DNN.Model.t(), integer()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setPreferableBackend(self, backendId) when is_integer(backendId)
  do
    positional = [
      backendId: Evision.Internal.Structurise.from_struct(backendId)
    ]
    :evision_nif.dnn_dnn_Model_setPreferableBackend(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **targetId**: `dnn_Target`

  ##### Return
  - **retval**: `Evision.DNN.Model`


  Python prototype (for reference): 
  ```python3
  setPreferableTarget(targetId) -> retval
  ```

  """
  @spec setPreferableTarget(Evision.DNN.Model.t(), integer()) :: Evision.DNN.Model.t() | {:error, String.t()}
  def setPreferableTarget(self, targetId) when is_integer(targetId)
  do
    positional = [
      targetId: Evision.Internal.Structurise.from_struct(targetId)
    ]
    :evision_nif.dnn_dnn_Model_setPreferableTarget(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
