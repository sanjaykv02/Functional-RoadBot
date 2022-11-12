defmodule Evision.SparseOpticalFlow do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.SparseOpticalFlow` struct.

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
  def __to_struct__({:ok, %{class: :SparseOpticalFlow, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :SparseOpticalFlow, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Calculates a sparse optical flow.

  ##### Positional Arguments
  - **prevImg**: `Evision.Mat`.

    First input image.

  - **nextImg**: `Evision.Mat`.

    Second input image of the same size and the same type as prevImg.

  - **prevPts**: `Evision.Mat`.

    Vector of 2D points for which the flow needs to be found.


  ##### Return
  - **nextPts**: `Evision.Mat`.

    Output vector of 2D points containing the calculated new positions of input features in the second image.

  - **status**: `Evision.Mat`.

    Output status vector. Each element of the vector is set to 1 if the
    flow for the corresponding features has been found. Otherwise, it is set to 0.

  - **err**: `Evision.Mat`.

    Optional output vector that contains error response for each point (inverse confidence).




  Python prototype (for reference): 
  ```python3
  calc(prevImg, nextImg, prevPts, nextPts[, status[, err]]) -> nextPts, status, err
  ```

  """
  @spec calc(Evision.SparseOpticalFlow.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def calc(self, prevImg, nextImg, prevPts, nextPts, opts) when (is_struct(prevImg, Evision.Mat) or is_struct(prevImg, Nx.Tensor)) and (is_struct(nextImg, Evision.Mat) or is_struct(nextImg, Nx.Tensor)) and (is_struct(prevPts, Evision.Mat) or is_struct(prevPts, Nx.Tensor)) and (is_struct(nextPts, Evision.Mat) or is_struct(nextPts, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      prevImg: Evision.Internal.Structurise.from_struct(prevImg),
      nextImg: Evision.Internal.Structurise.from_struct(nextImg),
      prevPts: Evision.Internal.Structurise.from_struct(prevPts),
      nextPts: Evision.Internal.Structurise.from_struct(nextPts)
    ]
    :evision_nif.sparseOpticalFlow_calc(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Calculates a sparse optical flow.

  ##### Positional Arguments
  - **prevImg**: `Evision.Mat`.

    First input image.

  - **nextImg**: `Evision.Mat`.

    Second input image of the same size and the same type as prevImg.

  - **prevPts**: `Evision.Mat`.

    Vector of 2D points for which the flow needs to be found.


  ##### Return
  - **nextPts**: `Evision.Mat`.

    Output vector of 2D points containing the calculated new positions of input features in the second image.

  - **status**: `Evision.Mat`.

    Output status vector. Each element of the vector is set to 1 if the
    flow for the corresponding features has been found. Otherwise, it is set to 0.

  - **err**: `Evision.Mat`.

    Optional output vector that contains error response for each point (inverse confidence).




  Python prototype (for reference): 
  ```python3
  calc(prevImg, nextImg, prevPts, nextPts[, status[, err]]) -> nextPts, status, err
  ```

  """
  @spec calc(Evision.SparseOpticalFlow.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def calc(self, prevImg, nextImg, prevPts, nextPts) when (is_struct(prevImg, Evision.Mat) or is_struct(prevImg, Nx.Tensor)) and (is_struct(nextImg, Evision.Mat) or is_struct(nextImg, Nx.Tensor)) and (is_struct(prevPts, Evision.Mat) or is_struct(prevPts, Nx.Tensor)) and (is_struct(nextPts, Evision.Mat) or is_struct(nextPts, Nx.Tensor))
  do
    positional = [
      prevImg: Evision.Internal.Structurise.from_struct(prevImg),
      nextImg: Evision.Internal.Structurise.from_struct(nextImg),
      prevPts: Evision.Internal.Structurise.from_struct(prevPts),
      nextPts: Evision.Internal.Structurise.from_struct(nextPts)
    ]
    :evision_nif.sparseOpticalFlow_calc(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
