defmodule Evision.BOWKMeansTrainer do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BOWKMeansTrainer` struct.

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
  def __to_struct__({:ok, %{class: :BOWKMeansTrainer, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BOWKMeansTrainer, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  The constructor.

  ##### Positional Arguments
  - **clusterCount**: `int`

  ##### Keyword Arguments
  - **termcrit**: `TermCriteria`.
  - **attempts**: `int`.
  - **flags**: `int`.

  ##### Return
  - **self**: `Evision.BOWKMeansTrainer`

  @see cv::kmeans


  Python prototype (for reference): 
  ```python3
  BOWKMeansTrainer(clusterCount[, termcrit[, attempts[, flags]]]) -> <BOWKMeansTrainer object>
  ```

  """
  @spec bowKMeansTrainer(integer(), [{atom(), term()},...] | nil) :: Evision.BOWKMeansTrainer.t() | {:error, String.t()}
  def bowKMeansTrainer(clusterCount, opts) when is_integer(clusterCount) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      clusterCount: Evision.Internal.Structurise.from_struct(clusterCount)
    ]
    :evision_nif.bowKMeansTrainer_BOWKMeansTrainer(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  The constructor.

  ##### Positional Arguments
  - **clusterCount**: `int`

  ##### Keyword Arguments
  - **termcrit**: `TermCriteria`.
  - **attempts**: `int`.
  - **flags**: `int`.

  ##### Return
  - **self**: `Evision.BOWKMeansTrainer`

  @see cv::kmeans


  Python prototype (for reference): 
  ```python3
  BOWKMeansTrainer(clusterCount[, termcrit[, attempts[, flags]]]) -> <BOWKMeansTrainer object>
  ```

  """
  @spec bowKMeansTrainer(integer()) :: Evision.BOWKMeansTrainer.t() | {:error, String.t()}
  def bowKMeansTrainer(clusterCount) when is_integer(clusterCount)
  do
    positional = [
      clusterCount: Evision.Internal.Structurise.from_struct(clusterCount)
    ]
    :evision_nif.bowKMeansTrainer_BOWKMeansTrainer(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **descriptors**: `Evision.Mat`

  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  cluster(descriptors) -> retval
  ```

  """
  @spec cluster(Evision.BOWKMeansTrainer.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def cluster(self, descriptors) when (is_struct(descriptors, Evision.Mat) or is_struct(descriptors, Nx.Tensor))
  do
    positional = [
      descriptors: Evision.Internal.Structurise.from_struct(descriptors)
    ]
    :evision_nif.bowKMeansTrainer_cluster(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  cluster() -> retval
  ```

  """
  @spec cluster(Evision.BOWKMeansTrainer.t()) :: Evision.Mat.t() | {:error, String.t()}
  def cluster(self) do
    positional = [
    ]
    :evision_nif.bowKMeansTrainer_cluster(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
