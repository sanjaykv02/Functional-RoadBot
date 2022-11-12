defmodule Evision.MergeDebevec do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.MergeDebevec` struct.

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
  def __to_struct__({:ok, %{class: :MergeDebevec, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :MergeDebevec, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`
  - **response**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times, response[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeDebevec.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, response, opts) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.mergeDebevec_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`
  - **response**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times, response[, dst]) -> dst
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times[, dst]) -> dst
  ```


  """
  @spec process(Evision.MergeDebevec.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, opts) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times)
    ]
    :evision_nif.mergeDebevec_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec process(Evision.MergeDebevec.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, response) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.mergeDebevec_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeDebevec.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times)
    ]
    :evision_nif.mergeDebevec_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
