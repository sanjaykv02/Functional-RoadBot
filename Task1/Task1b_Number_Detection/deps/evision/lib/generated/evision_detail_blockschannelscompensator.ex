defmodule Evision.Detail.BlocksChannelsCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BlocksChannelsCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BlocksChannelsCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BlocksChannelsCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **bl_width**: `int`.
  - **bl_height**: `int`.
  - **nr_feeds**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BlocksChannelsCompensator`



  Python prototype (for reference): 
  ```python3
  BlocksChannelsCompensator([, bl_width[, bl_height[, nr_feeds]]]) -> <detail_BlocksChannelsCompensator object>
  ```

  """
  @spec blocksChannelsCompensator([{atom(), term()},...] | nil) :: Evision.Detail.BlocksChannelsCompensator.t() | {:error, String.t()}
  def blocksChannelsCompensator(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksChannelsCompensator_BlocksChannelsCompensator(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **bl_width**: `int`.
  - **bl_height**: `int`.
  - **nr_feeds**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BlocksChannelsCompensator`



  Python prototype (for reference): 
  ```python3
  BlocksChannelsCompensator([, bl_width[, bl_height[, nr_feeds]]]) -> <detail_BlocksChannelsCompensator object>
  ```

  """
  @spec blocksChannelsCompensator() :: Evision.Detail.BlocksChannelsCompensator.t() | {:error, String.t()}
  def blocksChannelsCompensator() do
    positional = [
    ]
    :evision_nif.detail_detail_BlocksChannelsCompensator_BlocksChannelsCompensator(positional)
    |> __to_struct__()
  end
end
