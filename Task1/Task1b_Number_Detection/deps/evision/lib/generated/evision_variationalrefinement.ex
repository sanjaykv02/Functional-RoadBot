defmodule Evision.VariationalRefinement do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.VariationalRefinement` struct.

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
  def __to_struct__({:ok, %{class: :VariationalRefinement, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :VariationalRefinement, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  @ref calc function overload to handle separate horizontal (u) and vertical (v) flow components
  (to avoid extra splits/merges)


  ##### Positional Arguments
  - **i0**: `Evision.Mat`
  - **i1**: `Evision.Mat`

  ##### Return
  - **flow_u**: `Evision.Mat`
  - **flow_v**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  calcUV(I0, I1, flow_u, flow_v) -> flow_u, flow_v
  ```

  """
  @spec calcUV(Evision.VariationalRefinement.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def calcUV(self, i0, i1, flow_u, flow_v) when (is_struct(i0, Evision.Mat) or is_struct(i0, Nx.Tensor)) and (is_struct(i1, Evision.Mat) or is_struct(i1, Nx.Tensor)) and (is_struct(flow_u, Evision.Mat) or is_struct(flow_u, Nx.Tensor)) and (is_struct(flow_v, Evision.Mat) or is_struct(flow_v, Nx.Tensor))
  do
    positional = [
      i0: Evision.Internal.Structurise.from_struct(i0),
      i1: Evision.Internal.Structurise.from_struct(i1),
      flow_u: Evision.Internal.Structurise.from_struct(flow_u),
      flow_v: Evision.Internal.Structurise.from_struct(flow_v)
    ]
    :evision_nif.variationalRefinement_calcUV(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Creates an instance of VariationalRefinement
  ##### Return
  - **retval**: `Evision.VariationalRefinement`


  Python prototype (for reference): 
  ```python3
  create() -> retval
  ```

  """
  @spec create() :: Evision.VariationalRefinement.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.variationalRefinement_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the smoothness term
  ##### Return
  - **retval**: `float`

  @see `setAlpha/2`

  Python prototype (for reference): 
  ```python3
  getAlpha() -> retval
  ```

  """
  @spec getAlpha(Evision.VariationalRefinement.t()) :: number() | {:error, String.t()}
  def getAlpha(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getAlpha(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the color constancy term
  ##### Return
  - **retval**: `float`

  @see `setDelta/2`

  Python prototype (for reference): 
  ```python3
  getDelta() -> retval
  ```

  """
  @spec getDelta(Evision.VariationalRefinement.t()) :: number() | {:error, String.t()}
  def getDelta(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getDelta(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Number of outer (fixed-point) iterations in the minimization procedure.
  ##### Return
  - **retval**: `int`

  @see `setFixedPointIterations/2`

  Python prototype (for reference): 
  ```python3
  getFixedPointIterations() -> retval
  ```

  """
  @spec getFixedPointIterations(Evision.VariationalRefinement.t()) :: integer() | {:error, String.t()}
  def getFixedPointIterations(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getFixedPointIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Weight of the gradient constancy term
  ##### Return
  - **retval**: `float`

  @see `setGamma/2`

  Python prototype (for reference): 
  ```python3
  getGamma() -> retval
  ```

  """
  @spec getGamma(Evision.VariationalRefinement.t()) :: number() | {:error, String.t()}
  def getGamma(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Relaxation factor in SOR
  ##### Return
  - **retval**: `float`

  @see `setOmega/2`

  Python prototype (for reference): 
  ```python3
  getOmega() -> retval
  ```

  """
  @spec getOmega(Evision.VariationalRefinement.t()) :: number() | {:error, String.t()}
  def getOmega(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getOmega(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Number of inner successive over-relaxation (SOR) iterations
  in the minimization procedure to solve the respective linear system.

  ##### Return
  - **retval**: `int`

  @see `setSorIterations/2`

  Python prototype (for reference): 
  ```python3
  getSorIterations() -> retval
  ```

  """
  @spec getSorIterations(Evision.VariationalRefinement.t()) :: integer() | {:error, String.t()}
  def getSorIterations(self) do
    positional = [
    ]
    :evision_nif.variationalRefinement_getSorIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getAlpha/1`

  Python prototype (for reference): 
  ```python3
  setAlpha(val) -> None
  ```

  """
  @spec setAlpha(Evision.VariationalRefinement.t(), number()) :: :ok | {:error, String.t()}
  def setAlpha(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setAlpha(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getDelta/1`

  Python prototype (for reference): 
  ```python3
  setDelta(val) -> None
  ```

  """
  @spec setDelta(Evision.VariationalRefinement.t(), number()) :: :ok | {:error, String.t()}
  def setDelta(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setDelta(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getFixedPointIterations/1`

  Python prototype (for reference): 
  ```python3
  setFixedPointIterations(val) -> None
  ```

  """
  @spec setFixedPointIterations(Evision.VariationalRefinement.t(), integer()) :: :ok | {:error, String.t()}
  def setFixedPointIterations(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setFixedPointIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getGamma/1`

  Python prototype (for reference): 
  ```python3
  setGamma(val) -> None
  ```

  """
  @spec setGamma(Evision.VariationalRefinement.t(), number()) :: :ok | {:error, String.t()}
  def setGamma(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getOmega/1`

  Python prototype (for reference): 
  ```python3
  setOmega(val) -> None
  ```

  """
  @spec setOmega(Evision.VariationalRefinement.t(), number()) :: :ok | {:error, String.t()}
  def setOmega(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setOmega(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getSorIterations/1`

  Python prototype (for reference): 
  ```python3
  setSorIterations(val) -> None
  ```

  """
  @spec setSorIterations(Evision.VariationalRefinement.t(), integer()) :: :ok | {:error, String.t()}
  def setSorIterations(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.variationalRefinement_setSorIterations(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
