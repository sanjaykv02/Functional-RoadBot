defmodule Evision.DNN.KeypointsModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.KeypointsModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.KeypointsModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.KeypointsModel", ref: ref}) do
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
  - **self**: `Evision.DNN.KeypointsModel`



  Python prototype (for reference): 
  ```python3
  KeypointsModel(network) -> <dnn_KeypointsModel object>
  ```

  #### Variant 2:
  Create keypoints model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.KeypointsModel`



  Python prototype (for reference): 
  ```python3
  KeypointsModel(model[, config]) -> <dnn_KeypointsModel object>
  ```


  """
  @spec keypointsModel(Evision.DNN.Net.t()) :: Evision.DNN.KeypointsModel.t() | {:error, String.t()}
  def keypointsModel(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_KeypointsModel_KeypointsModel(positional)
    |> __to_struct__()
  end
  @spec keypointsModel(binary()) :: Evision.DNN.KeypointsModel.t() | {:error, String.t()}
  def keypointsModel(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_KeypointsModel_KeypointsModel(positional)
    |> __to_struct__()
  end

  @doc """
  Create keypoints model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.KeypointsModel`



  Python prototype (for reference): 
  ```python3
  KeypointsModel(model[, config]) -> <dnn_KeypointsModel object>
  ```

  """
  @spec keypointsModel(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.KeypointsModel.t() | {:error, String.t()}
  def keypointsModel(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_KeypointsModel_KeypointsModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Keyword Arguments
  - **thresh**: `float`.

    minimum confidence threshold to select a keypoint


  ##### Return
  - **retval**: `std::vector<Point2f>`

  @returns a vector holding the x and y coordinates of each detected keypoint


  Python prototype (for reference): 
  ```python3
  estimate(frame[, thresh]) -> retval
  ```

  """
  @spec estimate(Evision.DNN.KeypointsModel.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list({number(), number()}) | {:error, String.t()}
  def estimate(self, frame, opts) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_KeypointsModel_estimate(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Keyword Arguments
  - **thresh**: `float`.

    minimum confidence threshold to select a keypoint


  ##### Return
  - **retval**: `std::vector<Point2f>`

  @returns a vector holding the x and y coordinates of each detected keypoint


  Python prototype (for reference): 
  ```python3
  estimate(frame[, thresh]) -> retval
  ```

  """
  @spec estimate(Evision.DNN.KeypointsModel.t(), Evision.Mat.maybe_mat_in()) :: list({number(), number()}) | {:error, String.t()}
  def estimate(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_KeypointsModel_estimate(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
