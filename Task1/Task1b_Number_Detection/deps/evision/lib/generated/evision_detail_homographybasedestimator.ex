defmodule Evision.Detail.HomographyBasedEstimator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.HomographyBasedEstimator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.HomographyBasedEstimator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.HomographyBasedEstimator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **is_focals_estimated**: `bool`.

  ##### Return
  - **self**: `Evision.Detail.HomographyBasedEstimator`



  Python prototype (for reference): 
  ```python3
  HomographyBasedEstimator([, is_focals_estimated]) -> <detail_HomographyBasedEstimator object>
  ```

  """
  @spec homographyBasedEstimator([{atom(), term()},...] | nil) :: Evision.Detail.HomographyBasedEstimator.t() | {:error, String.t()}
  def homographyBasedEstimator(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.detail_detail_HomographyBasedEstimator_HomographyBasedEstimator(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **is_focals_estimated**: `bool`.

  ##### Return
  - **self**: `Evision.Detail.HomographyBasedEstimator`



  Python prototype (for reference): 
  ```python3
  HomographyBasedEstimator([, is_focals_estimated]) -> <detail_HomographyBasedEstimator object>
  ```

  """
  @spec homographyBasedEstimator() :: Evision.Detail.HomographyBasedEstimator.t() | {:error, String.t()}
  def homographyBasedEstimator() do
    positional = [
    ]
    :evision_nif.detail_detail_HomographyBasedEstimator_HomographyBasedEstimator(positional)
    |> __to_struct__()
  end
end
