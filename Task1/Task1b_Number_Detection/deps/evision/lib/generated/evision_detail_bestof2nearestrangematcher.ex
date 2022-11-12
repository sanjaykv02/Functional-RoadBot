defmodule Evision.Detail.BestOf2NearestRangeMatcher do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.BestOf2NearestRangeMatcher` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.BestOf2NearestRangeMatcher", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.BestOf2NearestRangeMatcher", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **range_width**: `int`.
  - **try_use_gpu**: `bool`.
  - **match_conf**: `float`.
  - **num_matches_thresh1**: `int`.
  - **num_matches_thresh2**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BestOf2NearestRangeMatcher`



  Python prototype (for reference): 
  ```python3
  BestOf2NearestRangeMatcher([, range_width[, try_use_gpu[, match_conf[, num_matches_thresh1[, num_matches_thresh2]]]]]) -> <detail_BestOf2NearestRangeMatcher object>
  ```

  """
  @spec bestOf2NearestRangeMatcher([{atom(), term()},...] | nil) :: Evision.Detail.BestOf2NearestRangeMatcher.t() | {:error, String.t()}
  def bestOf2NearestRangeMatcher(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_BestOf2NearestRangeMatcher(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **range_width**: `int`.
  - **try_use_gpu**: `bool`.
  - **match_conf**: `float`.
  - **num_matches_thresh1**: `int`.
  - **num_matches_thresh2**: `int`.

  ##### Return
  - **self**: `Evision.Detail.BestOf2NearestRangeMatcher`



  Python prototype (for reference): 
  ```python3
  BestOf2NearestRangeMatcher([, range_width[, try_use_gpu[, match_conf[, num_matches_thresh1[, num_matches_thresh2]]]]]) -> <detail_BestOf2NearestRangeMatcher object>
  ```

  """
  @spec bestOf2NearestRangeMatcher() :: Evision.Detail.BestOf2NearestRangeMatcher.t() | {:error, String.t()}
  def bestOf2NearestRangeMatcher() do
    positional = [
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_BestOf2NearestRangeMatcher(positional)
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
  @spec apply(Evision.Detail.BestOf2NearestRangeMatcher.t(), Evision.Detail.ImageFeatures.t(), Evision.Detail.ImageFeatures.t()) :: Evision.Detail.MatchesInfo.t() | {:error, String.t()}
  def apply(self, features1, features2) when is_struct(features1, Evision.Detail.ImageFeatures) and is_struct(features2, Evision.Detail.ImageFeatures)
  do
    positional = [
      features1: Evision.Internal.Structurise.from_struct(features1),
      features2: Evision.Internal.Structurise.from_struct(features2)
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_apply(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec apply2(Evision.Detail.BestOf2NearestRangeMatcher.t(), list(Evision.Detail.ImageFeatures.t()), [{atom(), term()},...] | nil) :: list(Evision.Detail.MatchesInfo.t()) | {:error, String.t()}
  def apply2(self, features, opts) when is_list(features) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features)
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_apply2(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec apply2(Evision.Detail.BestOf2NearestRangeMatcher.t(), list(Evision.Detail.ImageFeatures.t())) :: list(Evision.Detail.MatchesInfo.t()) | {:error, String.t()}
  def apply2(self, features) when is_list(features)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features)
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_apply2(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  collectGarbage() -> None
  ```

  """
  @spec collectGarbage(Evision.Detail.BestOf2NearestRangeMatcher.t()) :: :ok | {:error, String.t()}
  def collectGarbage(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_collectGarbage(Evision.Internal.Structurise.from_struct(self), positional)
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
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_create_static(positional)
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
  @spec isThreadSafe(Evision.Detail.BestOf2NearestRangeMatcher.t()) :: boolean() | {:error, String.t()}
  def isThreadSafe(self) do
    positional = [
    ]
    :evision_nif.detail_detail_BestOf2NearestRangeMatcher_isThreadSafe(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
