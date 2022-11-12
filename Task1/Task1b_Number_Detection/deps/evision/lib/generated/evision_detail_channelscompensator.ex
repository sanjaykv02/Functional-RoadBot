defmodule Evision.Detail.ChannelsCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.ChannelsCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.ChannelsCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.ChannelsCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **nr_feeds**: `int`.

  ##### Return
  - **self**: `Evision.Detail.ChannelsCompensator`



  Python prototype (for reference): 
  ```python3
  ChannelsCompensator([, nr_feeds]) -> <detail_ChannelsCompensator object>
  ```

  """
  @spec channelsCompensator([{atom(), term()},...] | nil) :: Evision.Detail.ChannelsCompensator.t() | {:error, String.t()}
  def channelsCompensator(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_ChannelsCompensator_ChannelsCompensator(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **nr_feeds**: `int`.

  ##### Return
  - **self**: `Evision.Detail.ChannelsCompensator`



  Python prototype (for reference): 
  ```python3
  ChannelsCompensator([, nr_feeds]) -> <detail_ChannelsCompensator object>
  ```

  """
  @spec channelsCompensator() :: Evision.Detail.ChannelsCompensator.t() | {:error, String.t()}
  def channelsCompensator() do
    positional = [
    ]
    :evision_nif.detail_detail_ChannelsCompensator_ChannelsCompensator(positional)
    |> __to_struct__()
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
  @spec apply(Evision.Detail.ChannelsCompensator.t(), integer(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, index, corner, image, mask) when is_integer(index) and is_tuple(corner) and (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      index: Evision.Internal.Structurise.from_struct(index),
      corner: Evision.Internal.Structurise.from_struct(corner),
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.detail_detail_ChannelsCompensator_apply(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getMatGains(Evision.Detail.ChannelsCompensator.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getMatGains(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ChannelsCompensator_getMatGains(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getNrFeeds(Evision.Detail.ChannelsCompensator.t()) :: integer() | {:error, String.t()}
  def getNrFeeds(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ChannelsCompensator_getNrFeeds(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getSimilarityThreshold(Evision.Detail.ChannelsCompensator.t()) :: number() | {:error, String.t()}
  def getSimilarityThreshold(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ChannelsCompensator_getSimilarityThreshold(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setMatGains(Evision.Detail.ChannelsCompensator.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def setMatGains(self, umv) when is_list(umv)
  do
    positional = [
      umv: Evision.Internal.Structurise.from_struct(umv)
    ]
    :evision_nif.detail_detail_ChannelsCompensator_setMatGains(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setNrFeeds(Evision.Detail.ChannelsCompensator.t(), integer()) :: :ok | {:error, String.t()}
  def setNrFeeds(self, nr_feeds) when is_integer(nr_feeds)
  do
    positional = [
      nr_feeds: Evision.Internal.Structurise.from_struct(nr_feeds)
    ]
    :evision_nif.detail_detail_ChannelsCompensator_setNrFeeds(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setSimilarityThreshold(Evision.Detail.ChannelsCompensator.t(), number()) :: :ok | {:error, String.t()}
  def setSimilarityThreshold(self, similarity_threshold) when is_number(similarity_threshold)
  do
    positional = [
      similarity_threshold: Evision.Internal.Structurise.from_struct(similarity_threshold)
    ]
    :evision_nif.detail_detail_ChannelsCompensator_setSimilarityThreshold(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
