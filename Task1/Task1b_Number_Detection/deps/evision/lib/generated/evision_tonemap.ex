defmodule Evision.Tonemap do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Tonemap` struct.

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
  def __to_struct__({:ok, %{class: :Tonemap, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Tonemap, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getGamma() -> retval
  ```

  """
  @spec getGamma(Evision.Tonemap.t()) :: number() | {:error, String.t()}
  def getGamma(self) do
    positional = [
    ]
    :evision_nif.tonemap_getGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Tonemaps image

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    source image - CV_32FC3 Mat (float 32 bits 3 channels)


  ##### Return
  - **dst**: `Evision.Mat`.

    destination image - CV_32FC3 Mat with values in [0, 1] range




  Python prototype (for reference): 
  ```python3
  process(src[, dst]) -> dst
  ```

  """
  @spec process(Evision.Tonemap.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, opts) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.tonemap_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Tonemaps image

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    source image - CV_32FC3 Mat (float 32 bits 3 channels)


  ##### Return
  - **dst**: `Evision.Mat`.

    destination image - CV_32FC3 Mat with values in [0, 1] range




  Python prototype (for reference): 
  ```python3
  process(src[, dst]) -> dst
  ```

  """
  @spec process(Evision.Tonemap.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.tonemap_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **gamma**: `float`



  Python prototype (for reference): 
  ```python3
  setGamma(gamma) -> None
  ```

  """
  @spec setGamma(Evision.Tonemap.t(), number()) :: :ok | {:error, String.t()}
  def setGamma(self, gamma) when is_float(gamma)
  do
    positional = [
      gamma: Evision.Internal.Structurise.from_struct(gamma)
    ]
    :evision_nif.tonemap_setGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
