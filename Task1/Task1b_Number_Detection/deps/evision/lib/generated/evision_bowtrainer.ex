defmodule Evision.BOWTrainer do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BOWTrainer` struct.

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
  def __to_struct__({:ok, %{class: :BOWTrainer, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BOWTrainer, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Adds descriptors to a training set.

  ##### Positional Arguments
  - **descriptors**: `Evision.Mat`.

    Descriptors to add to a training set. Each row of the descriptors matrix is a
    descriptor.




  The training set is clustered using clustermethod to construct the vocabulary.

  Python prototype (for reference): 
  ```python3
  add(descriptors) -> None
  ```

  """
  @spec add(Evision.BOWTrainer.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def add(self, descriptors) when (is_struct(descriptors, Evision.Mat) or is_struct(descriptors, Nx.Tensor))
  do
    positional = [
      descriptors: Evision.Internal.Structurise.from_struct(descriptors)
    ]
    :evision_nif.bowTrainer_add(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.BOWTrainer.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.bowTrainer_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clusters train descriptors.

  ##### Positional Arguments
  - **descriptors**: `Evision.Mat`.

    Descriptors to cluster. Each row of the descriptors matrix is a descriptor.
    Descriptors are not added to the inner train descriptor set.


  ##### Return
  - **retval**: `Evision.Mat`


  The vocabulary consists of cluster centers. So, this method returns the vocabulary. In the first
  variant of the method, train descriptors stored in the object are clustered. In the second variant,
  input descriptors are clustered.

  Python prototype (for reference): 
  ```python3
  cluster(descriptors) -> retval
  ```

  """
  @spec cluster(Evision.BOWTrainer.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def cluster(self, descriptors) when (is_struct(descriptors, Evision.Mat) or is_struct(descriptors, Nx.Tensor))
  do
    positional = [
      descriptors: Evision.Internal.Structurise.from_struct(descriptors)
    ]
    :evision_nif.bowTrainer_cluster(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  cluster() -> retval
  ```

  """
  @spec cluster(Evision.BOWTrainer.t()) :: Evision.Mat.t() | {:error, String.t()}
  def cluster(self) do
    positional = [
    ]
    :evision_nif.bowTrainer_cluster(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the count of all descriptors stored in the training set.
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  descriptorsCount() -> retval
  ```

  """
  @spec descriptorsCount(Evision.BOWTrainer.t()) :: integer() | {:error, String.t()}
  def descriptorsCount(self) do
    positional = [
    ]
    :evision_nif.bowTrainer_descriptorsCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns a training set of descriptors.
  ##### Return
  - **retval**: `std::vector<Mat>`


  Python prototype (for reference): 
  ```python3
  getDescriptors() -> retval
  ```

  """
  @spec getDescriptors(Evision.BOWTrainer.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getDescriptors(self) do
    positional = [
    ]
    :evision_nif.bowTrainer_getDescriptors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
