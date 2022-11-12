defmodule Evision.AlignExposures do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.AlignExposures` struct.

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
  def __to_struct__({:ok, %{class: :AlignExposures, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :AlignExposures, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Aligns images

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images

  - **dst**: `[Evision.Mat]`.

    vector of aligned images

  - **times**: `Evision.Mat`.

    vector of exposure time values for each image

  - **response**: `Evision.Mat`.

    256x1 matrix with inverse camera response function for each pixel value, it should
    have the same number of channels as images.





  Python prototype (for reference): 
  ```python3
  process(src, dst, times, response) -> None
  ```

  """
  @spec process(Evision.AlignExposures.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def process(self, src, dst, times, response) when is_list(src) and is_list(dst) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      dst: Evision.Internal.Structurise.from_struct(dst),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.alignExposures_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
