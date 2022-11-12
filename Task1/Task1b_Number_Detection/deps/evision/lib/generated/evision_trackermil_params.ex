defmodule Evision.TrackerMIL.Params do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.TrackerMIL.Params` struct.

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
  def __to_struct__({:ok, %{class: :"TrackerMIL.Params", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"TrackerMIL.Params", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.TrackerMIL.Params`


  Python prototype (for reference): 
  ```python3
  TrackerMIL_Params() -> <TrackerMIL_Params object>
  ```

  """
  @spec params() :: Evision.TrackerMIL.Params.t() | {:error, String.t()}
  def params() do
    positional = [
    ]
    :evision_nif.trackerMIL_Params_TrackerMIL_Params(positional)
    |> __to_struct__()
  end
  @spec get_featureSetNumFeatures(Evision.TrackerMIL.Params.t()) :: integer()
  def get_featureSetNumFeatures(self) do
    :evision_nif.trackerMIL_Params_get_featureSetNumFeatures(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_featureSetNumFeatures(Evision.TrackerMIL.Params.t(), integer()) :: Evision.TrackerMIL.Params.t()
  def set_featureSetNumFeatures(self, prop) do
    :evision_nif.trackerMIL_Params_set_featureSetNumFeatures(Evision.Internal.Structurise.from_struct(self), [featureSetNumFeatures: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerInitInRadius(Evision.TrackerMIL.Params.t()) :: number()
  def get_samplerInitInRadius(self) do
    :evision_nif.trackerMIL_Params_get_samplerInitInRadius(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerInitInRadius(Evision.TrackerMIL.Params.t(), number()) :: Evision.TrackerMIL.Params.t()
  def set_samplerInitInRadius(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerInitInRadius(Evision.Internal.Structurise.from_struct(self), [samplerInitInRadius: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerInitMaxNegNum(Evision.TrackerMIL.Params.t()) :: integer()
  def get_samplerInitMaxNegNum(self) do
    :evision_nif.trackerMIL_Params_get_samplerInitMaxNegNum(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerInitMaxNegNum(Evision.TrackerMIL.Params.t(), integer()) :: Evision.TrackerMIL.Params.t()
  def set_samplerInitMaxNegNum(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerInitMaxNegNum(Evision.Internal.Structurise.from_struct(self), [samplerInitMaxNegNum: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerSearchWinSize(Evision.TrackerMIL.Params.t()) :: number()
  def get_samplerSearchWinSize(self) do
    :evision_nif.trackerMIL_Params_get_samplerSearchWinSize(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerSearchWinSize(Evision.TrackerMIL.Params.t(), number()) :: Evision.TrackerMIL.Params.t()
  def set_samplerSearchWinSize(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerSearchWinSize(Evision.Internal.Structurise.from_struct(self), [samplerSearchWinSize: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerTrackInRadius(Evision.TrackerMIL.Params.t()) :: number()
  def get_samplerTrackInRadius(self) do
    :evision_nif.trackerMIL_Params_get_samplerTrackInRadius(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerTrackInRadius(Evision.TrackerMIL.Params.t(), number()) :: Evision.TrackerMIL.Params.t()
  def set_samplerTrackInRadius(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerTrackInRadius(Evision.Internal.Structurise.from_struct(self), [samplerTrackInRadius: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerTrackMaxNegNum(Evision.TrackerMIL.Params.t()) :: integer()
  def get_samplerTrackMaxNegNum(self) do
    :evision_nif.trackerMIL_Params_get_samplerTrackMaxNegNum(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerTrackMaxNegNum(Evision.TrackerMIL.Params.t(), integer()) :: Evision.TrackerMIL.Params.t()
  def set_samplerTrackMaxNegNum(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerTrackMaxNegNum(Evision.Internal.Structurise.from_struct(self), [samplerTrackMaxNegNum: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_samplerTrackMaxPosNum(Evision.TrackerMIL.Params.t()) :: integer()
  def get_samplerTrackMaxPosNum(self) do
    :evision_nif.trackerMIL_Params_get_samplerTrackMaxPosNum(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_samplerTrackMaxPosNum(Evision.TrackerMIL.Params.t(), integer()) :: Evision.TrackerMIL.Params.t()
  def set_samplerTrackMaxPosNum(self, prop) do
    :evision_nif.trackerMIL_Params_set_samplerTrackMaxPosNum(Evision.Internal.Structurise.from_struct(self), [samplerTrackMaxPosNum: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
end
