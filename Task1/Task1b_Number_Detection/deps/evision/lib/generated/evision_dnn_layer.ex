defmodule Evision.DNN.Layer do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.Layer` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.Layer", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.Layer", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Computes and sets internal parameters according to inputs, outputs and blobs.

  ##### Positional Arguments
  - **inputs**: `[Evision.Mat]`

  ##### Return
  - **outputs**: `[Evision.Mat]`.

    vector of already allocated output blobs



   If this method is called after network has allocated all memory for input and output blobs
   and before inferencing.


  Python prototype (for reference): 
  ```python3
  finalize(inputs[, outputs]) -> outputs
  ```

  """
  @spec finalize(Evision.DNN.Layer.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def finalize(self, inputs, opts) when is_list(inputs) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs)
    ]
    :evision_nif.dnn_dnn_Layer_finalize(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes and sets internal parameters according to inputs, outputs and blobs.

  ##### Positional Arguments
  - **inputs**: `[Evision.Mat]`

  ##### Return
  - **outputs**: `[Evision.Mat]`.

    vector of already allocated output blobs



   If this method is called after network has allocated all memory for input and output blobs
   and before inferencing.


  Python prototype (for reference): 
  ```python3
  finalize(inputs[, outputs]) -> outputs
  ```

  """
  @spec finalize(Evision.DNN.Layer.t(), list(Evision.Mat.maybe_mat_in())) :: list(Evision.Mat.t()) | {:error, String.t()}
  def finalize(self, inputs) when is_list(inputs)
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs)
    ]
    :evision_nif.dnn_dnn_Layer_finalize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns index of output blob in output array.

  ##### Positional Arguments
  - **outputName**: `String`

  ##### Return
  - **retval**: `int`

  @see inputNameToIndex()

  Python prototype (for reference): 
  ```python3
  outputNameToIndex(outputName) -> retval
  ```

  """
  @spec outputNameToIndex(Evision.DNN.Layer.t(), binary()) :: integer() | {:error, String.t()}
  def outputNameToIndex(self, outputName) when is_binary(outputName)
  do
    positional = [
      outputName: Evision.Internal.Structurise.from_struct(outputName)
    ]
    :evision_nif.dnn_dnn_Layer_outputNameToIndex(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Allocates layer and computes output.

  ##### Positional Arguments
  - **inputs**: `[Evision.Mat]`

  ##### Return
  - **outputs**: `[Evision.Mat]`.
  - **internals**: `[Evision.Mat]`

  @deprecated This method will be removed in the future release.


  Python prototype (for reference): 
  ```python3
  run(inputs, internals[, outputs]) -> outputs, internals
  ```

  """
  @spec run(Evision.DNN.Layer.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: {list(Evision.Mat.t()), list(Evision.Mat.t())} | {:error, String.t()}
  def run(self, inputs, internals, opts) when is_list(inputs) and is_list(internals) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs),
      internals: Evision.Internal.Structurise.from_struct(internals)
    ]
    :evision_nif.dnn_dnn_Layer_run(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Allocates layer and computes output.

  ##### Positional Arguments
  - **inputs**: `[Evision.Mat]`

  ##### Return
  - **outputs**: `[Evision.Mat]`.
  - **internals**: `[Evision.Mat]`

  @deprecated This method will be removed in the future release.


  Python prototype (for reference): 
  ```python3
  run(inputs, internals[, outputs]) -> outputs, internals
  ```

  """
  @spec run(Evision.DNN.Layer.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in())) :: {list(Evision.Mat.t()), list(Evision.Mat.t())} | {:error, String.t()}
  def run(self, inputs, internals) when is_list(inputs) and is_list(internals)
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs),
      internals: Evision.Internal.Structurise.from_struct(internals)
    ]
    :evision_nif.dnn_dnn_Layer_run(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec get_blobs(Evision.DNN.Layer.t()) :: list(Evision.Mat.t())
  def get_blobs(self) do
    :evision_nif.dnn_Layer_get_blobs(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_blobs(Evision.DNN.Layer.t(), list(Evision.Mat.maybe_mat_in())) :: Evision.DNN.Layer.t()
  def set_blobs(self, prop) do
    :evision_nif.dnn_Layer_set_blobs(Evision.Internal.Structurise.from_struct(self), [blobs: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_name(Evision.DNN.Layer.t()) :: binary()
  def get_name(self) do
    :evision_nif.dnn_Layer_get_name(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_preferableTarget(Evision.DNN.Layer.t()) :: integer()
  def get_preferableTarget(self) do
    :evision_nif.dnn_Layer_get_preferableTarget(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec get_type(Evision.DNN.Layer.t()) :: binary()
  def get_type(self) do
    :evision_nif.dnn_Layer_get_type(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
end
