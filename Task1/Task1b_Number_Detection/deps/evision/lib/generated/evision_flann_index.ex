defmodule Evision.Flann.Index do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Flann.Index` struct.

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
  def __to_struct__({:ok, %{class: :"Flann.Index", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Flann.Index", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **features**: `Evision.Mat`
  - **params**: `IndexParams`

  ##### Keyword Arguments
  - **distType**: `cvflann_flann_distance_t`.

  ##### Return
  - **self**: `Evision.Flann.Index`



  Python prototype (for reference): 
  ```python3
  Index(features, params[, distType]) -> <flann_Index object>
  ```

  """
  @spec index(Evision.Mat.maybe_mat_in(), map(), [{atom(), term()},...] | nil) :: Evision.Flann.Index.t() | {:error, String.t()}
  def index(features, params, opts) when (is_struct(features, Evision.Mat) or is_struct(features, Nx.Tensor)) and is_map(params) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.flann_flann_Index_Index(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **features**: `Evision.Mat`
  - **params**: `IndexParams`

  ##### Keyword Arguments
  - **distType**: `cvflann_flann_distance_t`.

  ##### Return
  - **self**: `Evision.Flann.Index`



  Python prototype (for reference): 
  ```python3
  Index(features, params[, distType]) -> <flann_Index object>
  ```

  """
  @spec index(Evision.Mat.maybe_mat_in(), map()) :: Evision.Flann.Index.t() | {:error, String.t()}
  def index(features, params) when (is_struct(features, Evision.Mat) or is_struct(features, Nx.Tensor)) and is_map(params)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.flann_flann_Index_Index(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.Flann.Index`


  Python prototype (for reference): 
  ```python3
  Index() -> <flann_Index object>
  ```

  """
  @spec index() :: Evision.Flann.Index.t() | {:error, String.t()}
  def index() do
    positional = [
    ]
    :evision_nif.flann_flann_Index_Index(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **features**: `Evision.Mat`
  - **params**: `IndexParams`

  ##### Keyword Arguments
  - **distType**: `cvflann_flann_distance_t`.




  Python prototype (for reference): 
  ```python3
  build(features, params[, distType]) -> None
  ```

  """
  @spec build(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), map(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def build(self, features, params, opts) when (is_struct(features, Evision.Mat) or is_struct(features, Nx.Tensor)) and is_map(params) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.flann_flann_Index_build(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **features**: `Evision.Mat`
  - **params**: `IndexParams`

  ##### Keyword Arguments
  - **distType**: `cvflann_flann_distance_t`.




  Python prototype (for reference): 
  ```python3
  build(features, params[, distType]) -> None
  ```

  """
  @spec build(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), map()) :: :ok | {:error, String.t()}
  def build(self, features, params) when (is_struct(features, Evision.Mat) or is_struct(features, Nx.Tensor)) and is_map(params)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.flann_flann_Index_build(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `cvflann::flann_algorithm_t`


  Python prototype (for reference): 
  ```python3
  getAlgorithm() -> retval
  ```

  """
  @spec getAlgorithm(Evision.Flann.Index.t()) :: integer() | {:error, String.t()}
  def getAlgorithm(self) do
    positional = [
    ]
    :evision_nif.flann_flann_Index_getAlgorithm(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `cvflann::flann_distance_t`


  Python prototype (for reference): 
  ```python3
  getDistance() -> retval
  ```

  """
  @spec getDistance(Evision.Flann.Index.t()) :: integer() | {:error, String.t()}
  def getDistance(self) do
    positional = [
    ]
    :evision_nif.flann_flann_Index_getDistance(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **query**: `Evision.Mat`
  - **knn**: `int`

  ##### Keyword Arguments
  - **params**: `SearchParams`.

  ##### Return
  - **indices**: `Evision.Mat`.
  - **dists**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  knnSearch(query, knn[, indices[, dists[, params]]]) -> indices, dists
  ```

  """
  @spec knnSearch(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def knnSearch(self, query, knn, opts) when (is_struct(query, Evision.Mat) or is_struct(query, Nx.Tensor)) and is_integer(knn) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      query: Evision.Internal.Structurise.from_struct(query),
      knn: Evision.Internal.Structurise.from_struct(knn)
    ]
    :evision_nif.flann_flann_Index_knnSearch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **query**: `Evision.Mat`
  - **knn**: `int`

  ##### Keyword Arguments
  - **params**: `SearchParams`.

  ##### Return
  - **indices**: `Evision.Mat`.
  - **dists**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  knnSearch(query, knn[, indices[, dists[, params]]]) -> indices, dists
  ```

  """
  @spec knnSearch(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), integer()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def knnSearch(self, query, knn) when (is_struct(query, Evision.Mat) or is_struct(query, Nx.Tensor)) and is_integer(knn)
  do
    positional = [
      query: Evision.Internal.Structurise.from_struct(query),
      knn: Evision.Internal.Structurise.from_struct(knn)
    ]
    :evision_nif.flann_flann_Index_knnSearch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **features**: `Evision.Mat`
  - **filename**: `String`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  load(features, filename) -> retval
  ```

  """
  @spec load(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), binary()) :: boolean() | {:error, String.t()}
  def load(self, features, filename) when (is_struct(features, Evision.Mat) or is_struct(features, Nx.Tensor)) and is_binary(filename)
  do
    positional = [
      features: Evision.Internal.Structurise.from_struct(features),
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.flann_flann_Index_load(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **query**: `Evision.Mat`
  - **radius**: `double`
  - **maxResults**: `int`

  ##### Keyword Arguments
  - **params**: `SearchParams`.

  ##### Return
  - **retval**: `int`
  - **indices**: `Evision.Mat`.
  - **dists**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  radiusSearch(query, radius, maxResults[, indices[, dists[, params]]]) -> retval, indices, dists
  ```

  """
  @spec radiusSearch(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), number(), integer(), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def radiusSearch(self, query, radius, maxResults, opts) when (is_struct(query, Evision.Mat) or is_struct(query, Nx.Tensor)) and is_number(radius) and is_integer(maxResults) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      query: Evision.Internal.Structurise.from_struct(query),
      radius: Evision.Internal.Structurise.from_struct(radius),
      maxResults: Evision.Internal.Structurise.from_struct(maxResults)
    ]
    :evision_nif.flann_flann_Index_radiusSearch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **query**: `Evision.Mat`
  - **radius**: `double`
  - **maxResults**: `int`

  ##### Keyword Arguments
  - **params**: `SearchParams`.

  ##### Return
  - **retval**: `int`
  - **indices**: `Evision.Mat`.
  - **dists**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  radiusSearch(query, radius, maxResults[, indices[, dists[, params]]]) -> retval, indices, dists
  ```

  """
  @spec radiusSearch(Evision.Flann.Index.t(), Evision.Mat.maybe_mat_in(), number(), integer()) :: {integer(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def radiusSearch(self, query, radius, maxResults) when (is_struct(query, Evision.Mat) or is_struct(query, Nx.Tensor)) and is_number(radius) and is_integer(maxResults)
  do
    positional = [
      query: Evision.Internal.Structurise.from_struct(query),
      radius: Evision.Internal.Structurise.from_struct(radius),
      maxResults: Evision.Internal.Structurise.from_struct(maxResults)
    ]
    :evision_nif.flann_flann_Index_radiusSearch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  release() -> None
  ```

  """
  @spec release(Evision.Flann.Index.t()) :: :ok | {:error, String.t()}
  def release(self) do
    positional = [
    ]
    :evision_nif.flann_flann_Index_release(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **filename**: `String`



  Python prototype (for reference): 
  ```python3
  save(filename) -> None
  ```

  """
  @spec save(Evision.Flann.Index.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.flann_flann_Index_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
