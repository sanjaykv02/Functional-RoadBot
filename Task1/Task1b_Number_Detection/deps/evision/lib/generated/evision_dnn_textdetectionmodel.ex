defmodule Evision.DNN.TextDetectionModel do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DNN.TextDetectionModel` struct.

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
  def __to_struct__({:ok, %{class: :"DNN.TextDetectionModel", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"DNN.TextDetectionModel", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **detections**: `[[Point]]`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  detect(frame) -> detections
  ```

  """
  @spec detect(Evision.DNN.TextDetectionModel.t(), Evision.Mat.maybe_mat_in()) :: list(list({number(), number()})) | {:error, String.t()}
  def detect(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **frame**: `Evision.Mat`

  ##### Return
  - **detections**: `[{centre={x, y}, size={s1, s2}, angle}]`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  detectTextRectangles(frame) -> detections
  ```

  """
  @spec detectTextRectangles(Evision.DNN.TextDetectionModel.t(), Evision.Mat.maybe_mat_in()) :: list({{number(), number()}, {number(), number()}, number()}) | {:error, String.t()}
  def detectTextRectangles(self, frame) when (is_struct(frame, Evision.Mat) or is_struct(frame, Nx.Tensor))
  do
    positional = [
      frame: Evision.Internal.Structurise.from_struct(frame)
    ]
    :evision_nif.dnn_dnn_TextDetectionModel_detectTextRectangles(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
