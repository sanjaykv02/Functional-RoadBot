defmodule Evision.TrackerDaSiamRPN do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TrackerDaSiamRPN` struct.

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
  def __to_struct__({:ok, %{class: :TrackerDaSiamRPN, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :TrackerDaSiamRPN, ref: ref}) do
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
  - **parameters**: `Evision.TrackerDaSiamRPN.Params`.

    DaSiamRPN parameters TrackerDaSiamRPN::Params


  ##### Return
  - **retval**: `Evision.TrackerDaSiamRPN`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.TrackerDaSiamRPN.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.trackerDaSiamRPN_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Constructor
  ##### Keyword Arguments
  - **parameters**: `Evision.TrackerDaSiamRPN.Params`.

    DaSiamRPN parameters TrackerDaSiamRPN::Params


  ##### Return
  - **retval**: `Evision.TrackerDaSiamRPN`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create() :: Evision.TrackerDaSiamRPN.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.trackerDaSiamRPN_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Return tracking score
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getTrackingScore() -> retval
  ```

  """
  @spec getTrackingScore(Evision.TrackerDaSiamRPN.t()) :: number() | {:error, String.t()}
  def getTrackingScore(self) do
    positional = [
    ]
    :evision_nif.trackerDaSiamRPN_getTrackingScore(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
