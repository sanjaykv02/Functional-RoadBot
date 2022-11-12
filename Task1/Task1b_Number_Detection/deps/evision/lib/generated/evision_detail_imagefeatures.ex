defmodule Evision.Detail.ImageFeatures do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.ImageFeatures` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.ImageFeatures", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.ImageFeatures", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **retval**: `std::vector<KeyPoint>`


  Python prototype (for reference): 
  ```python3
  getKeypoints() -> retval
  ```

  """
  @spec getKeypoints(Evision.Detail.ImageFeatures.t()) :: list(Evision.KeyPoint.t()) | {:error, String.t()}
  def getKeypoints(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ImageFeatures_getKeypoints(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec get_descriptors(Evision.Detail.ImageFeatures.t()) :: Evision.Mat.t()
  def get_descriptors(self) do
    :evision_nif.detail_ImageFeatures_get_descriptors(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_descriptors(Evision.Detail.ImageFeatures.t(), Evision.Mat.maybe_mat_in()) :: Evision.Detail.ImageFeatures.t()
  def set_descriptors(self, prop) do
    :evision_nif.detail_ImageFeatures_set_descriptors(Evision.Internal.Structurise.from_struct(self), [descriptors: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_img_idx(Evision.Detail.ImageFeatures.t()) :: integer()
  def get_img_idx(self) do
    :evision_nif.detail_ImageFeatures_get_img_idx(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_img_idx(Evision.Detail.ImageFeatures.t(), integer()) :: Evision.Detail.ImageFeatures.t()
  def set_img_idx(self, prop) do
    :evision_nif.detail_ImageFeatures_set_img_idx(Evision.Internal.Structurise.from_struct(self), [img_idx: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_img_size(Evision.Detail.ImageFeatures.t()) :: {number(), number()}
  def get_img_size(self) do
    :evision_nif.detail_ImageFeatures_get_img_size(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_img_size(Evision.Detail.ImageFeatures.t(), {number(), number()}) :: Evision.Detail.ImageFeatures.t()
  def set_img_size(self, prop) do
    :evision_nif.detail_ImageFeatures_set_img_size(Evision.Internal.Structurise.from_struct(self), [img_size: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_keypoints(Evision.Detail.ImageFeatures.t()) :: list(Evision.KeyPoint.t())
  def get_keypoints(self) do
    :evision_nif.detail_ImageFeatures_get_keypoints(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_keypoints(Evision.Detail.ImageFeatures.t(), list(Evision.KeyPoint.t())) :: Evision.Detail.ImageFeatures.t()
  def set_keypoints(self, prop) do
    :evision_nif.detail_ImageFeatures_set_keypoints(Evision.Internal.Structurise.from_struct(self), [keypoints: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
end
