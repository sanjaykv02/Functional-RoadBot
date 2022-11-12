defmodule Evision.Detail.Estimator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.Estimator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.Estimator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.Estimator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Estimates camera parameters.

  ##### Positional Arguments
  - **features**: `[Evision.Detail.ImageFeatures]`.

    Features of images

  - **pairwise_matches**: `[Evision.Detail.MatchesInfo]`.

    Pairwise matches of images


  ##### Return
  - **retval**: `bool`
  - **cameras**: `[Evision.Detail.CameraParams]`.

    Estimated camera parameters


  @return True in case of success, false otherwise

  Python prototype (for reference): 
  ```python3
  apply(features, pairwise_matches, cameras) -> retval, cameras
  ```

  """
  @spec apply(Evision.Detail.Estimator.t(), list(Evision.Detail.ImageFeatures.t()), list(Evision.Detail.MatchesInfo.t()), list(Evision.Detail.CameraParams.t())) :: list(Evision.Detail.CameraParams.t()) | false | {:error, String.t()}
  def apply(self, features, pairwise_matches, cameras) when is_list(features) and is_list(pairwise_matches) and is_list(cameras)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      pairwise_matches: Evision.Internal.Structurise.from_struct(pairwise_matches),
      cameras: Evision.Internal.Structurise.from_struct(cameras)
    ]
    :evision_nif.detail_detail_Estimator_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
