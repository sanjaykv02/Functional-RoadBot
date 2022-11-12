defmodule Evision.TrackerGOTURN do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TrackerGOTURN` struct.

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
  def __to_struct__({:ok, %{class: :TrackerGOTURN, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :TrackerGOTURN, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Constructor
  ##### Keyword Arguments
  - **parameters**: `Evision.TrackerGOTURN.Params`.

    GOTURN parameters TrackerGOTURN::Params


  ##### Return
  - **retval**: `Evision.TrackerGOTURN`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.TrackerGOTURN.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.trackerGOTURN_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Constructor
  ##### Keyword Arguments
  - **parameters**: `Evision.TrackerGOTURN.Params`.

    GOTURN parameters TrackerGOTURN::Params


  ##### Return
  - **retval**: `Evision.TrackerGOTURN`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create() :: Evision.TrackerGOTURN.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.trackerGOTURN_create_static(positional)
    |> __to_struct__()
  end
end
