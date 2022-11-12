defmodule Evision.TrackerMIL do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TrackerMIL` struct.

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
  def __to_struct__({:ok, %{class: :TrackerMIL, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :TrackerMIL, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Create MIL tracker instance
  ##### Keyword Arguments
  - **parameters**: `Evision.TrackerMIL.Params`.

    MIL parameters TrackerMIL::Params


  ##### Return
  - **retval**: `Evision.TrackerMIL`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.TrackerMIL.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.trackerMIL_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Create MIL tracker instance
  ##### Keyword Arguments
  - **parameters**: `Evision.TrackerMIL.Params`.

    MIL parameters TrackerMIL::Params


  ##### Return
  - **retval**: `Evision.TrackerMIL`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create() :: Evision.TrackerMIL.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.trackerMIL_create_static(positional)
    |> __to_struct__()
  end
end
