defmodule Evision.DNN.SegmentationModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.SegmentationModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.SegmentationModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.SegmentationModel", ref: ref}) do
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
  - **self**: `Evision.DNN.SegmentationModel`



  Python prototype (for reference): 
  ```python3
  SegmentationModel(network) -> <dnn_SegmentationModel object>
  ```

  #### Variant 2:
  Create segmentation model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.SegmentationModel`



  Python prototype (for reference): 
  ```python3
  SegmentationModel(model[, config]) -> <dnn_SegmentationModel object>
  ```


  """
  @spec segmentationModel(Evision.DNN.Net.t()) :: Evision.DNN.SegmentationModel.t() | {:error, String.t()}
  def segmentationModel(network) when is_struct(network, Evision.DNN.Net)
  do
    positional = [
      network: Evision.Internal.Structurise.from_struct(network)
    ]
    :evision_nif.dnn_dnn_SegmentationModel_SegmentationModel(positional)
    |> __to_struct__()
  end
  @spec segmentationModel(binary()) :: Evision.DNN.SegmentationModel.t() | {:error, String.t()}
  def segmentationModel(model) when is_binary(model)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_SegmentationModel_SegmentationModel(positional)
    |> __to_struct__()
  end

  @doc """
  Create segmentation model from network represented in one of the supported formats.
  An order of @p model and @p config arguments does not matter.


  ##### Positional Arguments
  - **model**: `String`.

    Binary file contains trained weights.


  ##### Keyword Arguments
  - **config**: `String`.

    Text file contains network configuration.


  ##### Return
  - **self**: `Evision.DNN.SegmentationModel`



  Python prototype (for reference): 
  ```python3
  SegmentationModel(model[, config]) -> <dnn_SegmentationModel object>
  ```

  """
  @spec segmentationModel(binary(), [{atom(), term()},...] | nil) :: Evision.DNN.SegmentationModel.t() | {:error, String.t()}
  def segmentationModel(model, opts) when is_binary(model) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model)
    ]
    :evision_nif.dnn_dnn_SegmentationModel_SegmentationModel(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **mask**: `Evision.Mat`.

    Allocated class prediction for each pixel




  Python prototype (for reference): 
  ```python3
  segment(frame[, mask]) -> mask
  ```

  """
  @spec segment(Evision.DNN.SegmentationModel.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def segment(self, frame, opts) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_SegmentationModel_segment(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Given the @p input frame, create input blob, run net

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **mask**: `Evision.Mat`.

    Allocated class prediction for each pixel




  Python prototype (for reference): 
  ```python3
  segment(frame[, mask]) -> mask
  ```

  """
  @spec segment(Evision.DNN.SegmentationModel.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def segment(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_SegmentationModel_segment(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
