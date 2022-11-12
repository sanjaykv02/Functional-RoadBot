defmodule Evision.Detail.AffineBestOf2NearestMatcher do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.AffineBestOf2NearestMatcher` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.AffineBestOf2NearestMatcher", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.AffineBestOf2NearestMatcher", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Constructs a "best of 2 nearest" matcher that expects affine transformation
  between images

  ##### Keyword Arguments
  - **full_affine**: `bool`.

    whether to use full affine transformation with 6 degress of freedom or reduced
    transformation with 4 degrees of freedom using only rotation, translation and uniform scaling

  - **try_use_gpu**: `bool`.

    Should try to use GPU or not

  - **match_conf**: `float`.

    Match distances ration threshold

  - **num_matches_thresh1**: `int`.

    Minimum number of matches required for the 2D affine transform
    estimation used in the inliers classification step


  ##### Return
  - **self**: `Evision.Detail.AffineBestOf2NearestMatcher`


  @sa cv::estimateAffine2D cv::estimateAffinePartial2D


  Python prototype (for reference): 
  ```python3
  AffineBestOf2NearestMatcher([, full_affine[, try_use_gpu[, match_conf[, num_matches_thresh1]]]]) -> <detail_AffineBestOf2NearestMatcher object>
  ```

  """
  @spec affineBestOf2NearestMatcher([{atom(), term()},...] | nil) :: Evision.Detail.AffineBestOf2NearestMatcher.t() | {:error, String.t()}
  def affineBestOf2NearestMatcher(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_AffineBestOf2NearestMatcher(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Constructs a "best of 2 nearest" matcher that expects affine transformation
  between images

  ##### Keyword Arguments
  - **full_affine**: `bool`.

    whether to use full affine transformation with 6 degress of freedom or reduced
    transformation with 4 degrees of freedom using only rotation, translation and uniform scaling

  - **try_use_gpu**: `bool`.

    Should try to use GPU or not

  - **match_conf**: `float`.

    Match distances ration threshold

  - **num_matches_thresh1**: `int`.

    Minimum number of matches required for the 2D affine transform
    estimation used in the inliers classification step


  ##### Return
  - **self**: `Evision.Detail.AffineBestOf2NearestMatcher`


  @sa cv::estimateAffine2D cv::estimateAffinePartial2D


  Python prototype (for reference): 
  ```python3
  AffineBestOf2NearestMatcher([, full_affine[, try_use_gpu[, match_conf[, num_matches_thresh1]]]]) -> <detail_AffineBestOf2NearestMatcher object>
  ```

  """
  @spec affineBestOf2NearestMatcher() :: Evision.Detail.AffineBestOf2NearestMatcher.t() | {:error, String.t()}
  def affineBestOf2NearestMatcher() do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_AffineBestOf2NearestMatcher(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **features1**: `Evision.Detail.ImageFeatures`.

    First image features

  - **features2**: `Evision.Detail.ImageFeatures`.

    Second image features


  ##### Return
  - **matches_info**: `Evision.Detail.MatchesInfo`.

    Found matches


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  apply(features1, features2) -> matches_info
  ```

  """
  @spec apply(Evision.Detail.AffineBestOf2NearestMatcher.t(), Evision.Detail.ImageFeatures.t(), Evision.Detail.ImageFeatures.t()) :: Evision.Detail.MatchesInfo.t() | {:error, String.t()}
  def apply(self, features1, features2) when is_struct(features1, Evision.Detail.ImageFeatures) and is_struct(features2, Evision.Detail.ImageFeatures)
  do
    positional = [
      features1: Evision.Internal.Structurise.from_struct(features1),
      features2: Evision.Internal.Structurise.from_struct(features2)
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Performs images matching.

  ##### Positional Arguments
  - **features**: `[Evision.Detail.ImageFeatures]`.

    Features of the source images


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask indicating which image pairs must be matched


  ##### Return
  - **pairwise_matches**: `[Evision.Detail.MatchesInfo]`.

    Found pairwise matches



  The function is parallelized with the TBB library.
  @sa detail::MatchesInfo


  Python prototype (for reference): 
  ```python3
  apply2(features[, mask]) -> pairwise_matches
  ```

  """
  @spec apply2(Evision.Detail.AffineBestOf2NearestMatcher.t(), list(Evision.Detail.ImageFeatures.t()), [{atom(), term()},...] | nil) :: list(Evision.Detail.MatchesInfo.t()) | {:error, String.t()}
  def apply2(self, features, opts) when is_list(features) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features)
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_apply2(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs images matching.

  ##### Positional Arguments
  - **features**: `[Evision.Detail.ImageFeatures]`.

    Features of the source images


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask indicating which image pairs must be matched


  ##### Return
  - **pairwise_matches**: `[Evision.Detail.MatchesInfo]`.

    Found pairwise matches



  The function is parallelized with the TBB library.
  @sa detail::MatchesInfo


  Python prototype (for reference): 
  ```python3
  apply2(features[, mask]) -> pairwise_matches
  ```

  """
  @spec apply2(Evision.Detail.AffineBestOf2NearestMatcher.t(), list(Evision.Detail.ImageFeatures.t())) :: list(Evision.Detail.MatchesInfo.t()) | {:error, String.t()}
  def apply2(self, features) when is_list(features)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features)
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_apply2(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  collectGarbage() -> None
  ```

  """
  @spec collectGarbage(Evision.Detail.AffineBestOf2NearestMatcher.t()) :: :ok | {:error, String.t()}
  def collectGarbage(self) do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_collectGarbage(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **try_use_gpu**: `bool`.
  - **match_conf**: `float`.
  - **num_matches_thresh1**: `int`.
  - **num_matches_thresh2**: `int`.

  ##### Return
  - **retval**: `Evision.Detail.BestOf2NearestMatcher`



  Python prototype (for reference): 
  ```python3
  create([, try_use_gpu[, match_conf[, num_matches_thresh1[, num_matches_thresh2]]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.Detail.BestOf2NearestMatcher.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **try_use_gpu**: `bool`.
  - **match_conf**: `float`.
  - **num_matches_thresh1**: `int`.
  - **num_matches_thresh2**: `int`.

  ##### Return
  - **retval**: `Evision.Detail.BestOf2NearestMatcher`



  Python prototype (for reference): 
  ```python3
  create([, try_use_gpu[, match_conf[, num_matches_thresh1[, num_matches_thresh2]]]]) -> retval
  ```

  """
  @spec create() :: Evision.Detail.BestOf2NearestMatcher.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @return True, if it's possible to use the same matcher instance in parallel, false otherwise

  Python prototype (for reference): 
  ```python3
  isThreadSafe() -> retval
  ```

  """
  @spec isThreadSafe(Evision.Detail.AffineBestOf2NearestMatcher.t()) :: boolean() | {:error, String.t()}
  def isThreadSafe(self) do
    positional = [
    ]
    :evision_nif.detail_detail_AffineBestOf2NearestMatcher_isThreadSafe(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
