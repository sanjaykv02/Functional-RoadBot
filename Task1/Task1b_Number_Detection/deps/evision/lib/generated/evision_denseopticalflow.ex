defmodule Evision.DenseOpticalFlow do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.DenseOpticalFlow` struct.

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
  def __to_struct__({:ok, %{class: :DenseOpticalFlow, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :DenseOpticalFlow, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Calculates an optical flow.

  ##### Positional Arguments
  - **i0**: `Evision.Mat`.

    first 8-bit single-channel input image.

  - **i1**: `Evision.Mat`.

    second input image of the same size and the same type as prev.


  ##### Return
  - **flow**: `Evision.Mat`.

    computed flow image that has the same size as prev and type CV_32FC2.




  Python prototype (for reference): 
  ```python3
  calc(I0, I1, flow) -> flow
  ```

  """
  @spec calc(Evision.DenseOpticalFlow.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def calc(self, i0, i1, flow) when (is_struct(i0, Evision.Mat) or is_struct(i0, Nx.Tensor)) and (is_struct(i1, Evision.Mat) or is_struct(i1, Nx.Tensor)) and (is_struct(flow, Evision.Mat) or is_struct(flow, Nx.Tensor))
  do
    positional = [
      i0: Evision.Internal.Structurise.from_struct(i0),
      i1: Evision.Internal.Structurise.from_struct(i1),
      flow: Evision.Internal.Structurise.from_struct(flow)
    ]
    :evision_nif.denseOpticalFlow_calc(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Releases all inner buffers.


  Python prototype (for reference): 
  ```python3
  collectGarbage() -> None
  ```

  """
  @spec collectGarbage(Evision.DenseOpticalFlow.t()) :: :ok | {:error, String.t()}
  def collectGarbage(self) do
    positional = [
    ]
    :evision_nif.denseOpticalFlow_collectGarbage(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
