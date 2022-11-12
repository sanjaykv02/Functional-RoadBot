defmodule Evision.Detail.NoExposureCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.NoExposureCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.NoExposureCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.NoExposureCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **arg1**: `int`
  - **arg2**: `Point`
  - **arg4**: `Evision.Mat`

  ##### Return
  - **arg3**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  apply(arg1, arg2, arg3, arg4) -> arg3
  ```

  """
  @spec apply(Evision.Detail.NoExposureCompensator.t(), integer(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, arg1, arg2, arg3, arg4) when is_integer(arg1) and is_tuple(arg2) and (is_struct(arg3, Evision.Mat) or is_struct(arg3, Nx.Tensor)) and (is_struct(arg4, Evision.Mat) or is_struct(arg4, Nx.Tensor))
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1),
      arg2: Evision.Internal.Structurise.from_struct(arg2),
      arg3: Evision.Internal.Structurise.from_struct(arg3),
      arg4: Evision.Internal.Structurise.from_struct(arg4)
    ]
    :evision_nif.detail_detail_NoExposureCompensator_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **umv**: `[Evision.Mat]`.



  Python prototype (for reference): 
  ```python3
  getMatGains([, umv]) -> umv
  ```

  """
  @spec getMatGains(Evision.Detail.NoExposureCompensator.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getMatGains(self) do
    positional = [
    ]
    :evision_nif.detail_detail_NoExposureCompensator_getMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **umv**: `[Evision.Mat]`



  Python prototype (for reference): 
  ```python3
  setMatGains(umv) -> None
  ```

  """
  @spec setMatGains(Evision.Detail.NoExposureCompensator.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def setMatGains(self, umv) when is_list(umv)
  do
    positional = [
      umv: Evision.Internal.Structurise.from_struct(umv)
    ]
    :evision_nif.detail_detail_NoExposureCompensator_setMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
