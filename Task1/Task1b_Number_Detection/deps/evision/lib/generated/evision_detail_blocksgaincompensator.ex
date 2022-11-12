defmodule Evision.Detail.BlocksGainCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BlocksGainCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BlocksGainCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BlocksGainCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **bl_width**: `int`
  - **bl_height**: `int`
  - **nr_feeds**: `int`

  ##### Return
  - **self**: `Evision.Detail.BlocksGainCompensator`


  Python prototype (for reference): 
  ```python3
  BlocksGainCompensator(bl_width, bl_height, nr_feeds) -> <detail_BlocksGainCompensator object>
  ```

  """
  @spec blocksGainCompensator(integer(), integer(), integer()) :: Evision.Detail.BlocksGainCompensator.t() | {:error, String.t()}
  def blocksGainCompensator(bl_width, bl_height, nr_feeds) when is_integer(bl_width) and is_integer(bl_height) and is_integer(nr_feeds)
  do
    positional = [
      bl_width: Evision.Internal.Structurise.from_struct(bl_width),
      bl_height: Evision.Internal.Structurise.from_struct(bl_height),
      nr_feeds: Evision.Internal.Structurise.from_struct(nr_feeds)
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_BlocksGainCompensator(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **bl_width**: `int`.
  - **bl_height**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BlocksGainCompensator`



  Python prototype (for reference): 
  ```python3
  BlocksGainCompensator([, bl_width[, bl_height]]) -> <detail_BlocksGainCompensator object>
  ```

  """
  @spec blocksGainCompensator([{atom(), term()},...] | nil) :: Evision.Detail.BlocksGainCompensator.t() | {:error, String.t()}
  def blocksGainCompensator(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_BlocksGainCompensator(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **bl_width**: `int`.
  - **bl_height**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BlocksGainCompensator`



  Python prototype (for reference): 
  ```python3
  BlocksGainCompensator([, bl_width[, bl_height]]) -> <detail_BlocksGainCompensator object>
  ```

  """
  @spec blocksGainCompensator() :: Evision.Detail.BlocksGainCompensator.t() | {:error, String.t()}
  def blocksGainCompensator() do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_BlocksGainCompensator(positional)
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
  @spec apply(Evision.Detail.BlocksGainCompensator.t(), integer(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, index, corner, image, mask) when is_integer(index) and is_tuple(corner) and (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      index: Evision.Internal.Structurise.from_struct(index),
      corner: Evision.Internal.Structurise.from_struct(corner),
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_apply(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getMatGains(Evision.Detail.BlocksGainCompensator.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getMatGains(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_getMatGains(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setMatGains(Evision.Detail.BlocksGainCompensator.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def setMatGains(self, umv) when is_list(umv)
  do
    positional = [
      umv: Evision.Internal.Structurise.from_struct(umv)
    ]
    :evision_nif.detail_detail_BlocksGainCompensator_setMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
