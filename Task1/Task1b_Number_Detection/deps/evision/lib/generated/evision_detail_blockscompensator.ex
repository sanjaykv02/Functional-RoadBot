defmodule Evision.Detail.BlocksCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BlocksCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BlocksCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BlocksCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **index**: `int`
  - **corner**: `Point`
  - **mask**: `Evision.Mat`

  ##### Return
  - **image**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  apply(index, corner, image, mask) -> image
  ```

  """
  @spec apply(Evision.Detail.BlocksCompensator.t(), integer(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, index, corner, image, mask) when is_integer(index) and is_tuple(corner) and (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      index: Evision.Internal.Structurise.from_struct(index),
      corner: Evision.Internal.Structurise.from_struct(corner),
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.detail_detail_BlocksCompensator_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Size`


  Python prototype (for reference): 
  ```python3
  getBlockSize() -> retval
  ```

  """
  @spec getBlockSize(Evision.Detail.BlocksCompensator.t()) :: {number(), number()} | {:error, String.t()}
  def getBlockSize(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksCompensator_getBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **umv**: `[Evision.Mat]`.



  Python prototype (for reference): 
  ```python3
  getMatGains([, umv]) -> umv
  ```

  """
  @spec getMatGains(Evision.Detail.BlocksCompensator.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getMatGains(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksCompensator_getMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNrFeeds() -> retval
  ```

  """
  @spec getNrFeeds(Evision.Detail.BlocksCompensator.t()) :: integer() | {:error, String.t()}
  def getNrFeeds(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksCompensator_getNrFeeds(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNrGainsFilteringIterations() -> retval
  ```

  """
  @spec getNrGainsFilteringIterations(Evision.Detail.BlocksCompensator.t()) :: integer() | {:error, String.t()}
  def getNrGainsFilteringIterations(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksCompensator_getNrGainsFilteringIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getSimilarityThreshold() -> retval
  ```

  """
  @spec getSimilarityThreshold(Evision.Detail.BlocksCompensator.t()) :: number() | {:error, String.t()}
  def getSimilarityThreshold(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksCompensator_getSimilarityThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **width**: `int`
  - **height**: `int`



  Python prototype (for reference): 
  ```python3
  setBlockSize(width, height) -> None
  ```

  """
  @spec setBlockSize(Evision.Detail.BlocksCompensator.t(), integer(), integer()) :: :ok | {:error, String.t()}
  def setBlockSize(self, width, height) when is_integer(width) and is_integer(height)
  do
    positional = [
      width: Evision.Internal.Structurise.from_struct(width),
      height: Evision.Internal.Structurise.from_struct(height)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **size**: `Size`



  Python prototype (for reference): 
  ```python3
  setBlockSize(size) -> None
  ```

  """
  @spec setBlockSize(Evision.Detail.BlocksCompensator.t(), {number(), number()}) :: :ok | {:error, String.t()}
  def setBlockSize(self, size) when is_tuple(size)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setBlockSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **umv**: `[Evision.Mat]`



  Python prototype (for reference): 
  ```python3
  setMatGains(umv) -> None
  ```

  """
  @spec setMatGains(Evision.Detail.BlocksCompensator.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def setMatGains(self, umv) when is_list(umv)
  do
    positional = [
      umv: Evision.Internal.Structurise.from_struct(umv)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **nr_feeds**: `int`



  Python prototype (for reference): 
  ```python3
  setNrFeeds(nr_feeds) -> None
  ```

  """
  @spec setNrFeeds(Evision.Detail.BlocksCompensator.t(), integer()) :: :ok | {:error, String.t()}
  def setNrFeeds(self, nr_feeds) when is_integer(nr_feeds)
  do
    positional = [
      nr_feeds: Evision.Internal.Structurise.from_struct(nr_feeds)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setNrFeeds(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **nr_iterations**: `int`



  Python prototype (for reference): 
  ```python3
  setNrGainsFilteringIterations(nr_iterations) -> None
  ```

  """
  @spec setNrGainsFilteringIterations(Evision.Detail.BlocksCompensator.t(), integer()) :: :ok | {:error, String.t()}
  def setNrGainsFilteringIterations(self, nr_iterations) when is_integer(nr_iterations)
  do
    positional = [
      nr_iterations: Evision.Internal.Structurise.from_struct(nr_iterations)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setNrGainsFilteringIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **similarity_threshold**: `double`



  Python prototype (for reference): 
  ```python3
  setSimilarityThreshold(similarity_threshold) -> None
  ```

  """
  @spec setSimilarityThreshold(Evision.Detail.BlocksCompensator.t(), number()) :: :ok | {:error, String.t()}
  def setSimilarityThreshold(self, similarity_threshold) when is_number(similarity_threshold)
  do
    positional = [
      similarity_threshold: Evision.Internal.Structurise.from_struct(similarity_threshold)
    ]
    :evision_nif.detail_detail_BlocksCompensator_setSimilarityThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
