defmodule Evision.TrackerGOTURN.Params do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TrackerGOTURN.Params` struct.

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
  def __to_struct__({:ok, %{class: :"TrackerGOTURN.Params", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"TrackerGOTURN.Params", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.TrackerGOTURN.Params`


  Python prototype (for reference): 
  ```python3
  TrackerGOTURN_Params() -> <TrackerGOTURN_Params object>
  ```

  """
  @spec params() :: Evision.TrackerGOTURN.Params.t() | {:error, String.t()}
  def params() do
    positional = [
    ]
    :evision_nif.trackerGOTURN_Params_TrackerGOTURN_Params(positional)
    |> __to_struct__()
  end
  @spec get_modelBin(Evision.TrackerGOTURN.Params.t()) :: binary()
  def get_modelBin(self) do
    :evision_nif.trackerGOTURN_Params_get_modelBin(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_modelBin(Evision.TrackerGOTURN.Params.t(), binary()) :: Evision.TrackerGOTURN.Params.t()
  def set_modelBin(self, prop) do
    :evision_nif.trackerGOTURN_Params_set_modelBin(Evision.Internal.Structurise.from_struct(self), [modelBin: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_modelTxt(Evision.TrackerGOTURN.Params.t()) :: binary()
  def get_modelTxt(self) do
    :evision_nif.trackerGOTURN_Params_get_modelTxt(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_modelTxt(Evision.TrackerGOTURN.Params.t(), binary()) :: Evision.TrackerGOTURN.Params.t()
  def set_modelTxt(self, prop) do
    :evision_nif.trackerGOTURN_Params_set_modelTxt(Evision.Internal.Structurise.from_struct(self), [modelTxt: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
end
