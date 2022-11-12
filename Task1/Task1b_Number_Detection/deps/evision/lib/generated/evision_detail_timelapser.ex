defmodule Evision.Detail.Timelapser do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.Timelapser` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.Timelapser", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.Timelapser", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **type**: `int`

  ##### Return
  - **retval**: `Evision.Detail.Timelapser`


  Python prototype (for reference): 
  ```python3
  createDefault(type) -> retval
  ```

  """
  @spec createDefault(integer()) :: Evision.Detail.Timelapser.t() | {:error, String.t()}
  def createDefault(type) when is_integer(type)
  do
    positional = [
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.detail_detail_Timelapser_createDefault_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getDst() -> retval
  ```

  """
  @spec getDst(Evision.Detail.Timelapser.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getDst(self) do
    positional = [
    ]
    :evision_nif.detail_detail_Timelapser_getDst(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **corners**: `[Point]`
  - **sizes**: `[Size]`



  Python prototype (for reference): 
  ```python3
  initialize(corners, sizes) -> None
  ```

  """
  @spec initialize(Evision.Detail.Timelapser.t(), list({number(), number()}), list({number(), number()})) :: :ok | {:error, String.t()}
  def initialize(self, corners, sizes) when is_list(corners) and is_list(sizes)
  do
    positional = [
      corners: Evision.Internal.Structurise.from_struct(corners),
      sizes: Evision.Internal.Structurise.from_struct(sizes)
    ]
    :evision_nif.detail_detail_Timelapser_initialize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **img**: `Evision.Mat`
  - **mask**: `Evision.Mat`
  - **tl**: `Point`



  Python prototype (for reference): 
  ```python3
  process(img, mask, tl) -> None
  ```

  """
  @spec process(Evision.Detail.Timelapser.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: :ok | {:error, String.t()}
  def process(self, img, mask, tl) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor)) and is_tuple(tl)
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      mask: Evision.Internal.Structurise.from_struct(mask),
      tl: Evision.Internal.Structurise.from_struct(tl)
    ]
    :evision_nif.detail_detail_Timelapser_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
