defmodule Evision.IPP do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.IPP` struct.

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
  def __to_struct__({:ok, %{class: :IPP, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :IPP, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  getIppVersion() -> retval
  ```

  """
  @spec getIppVersion() :: binary() | {:error, String.t()}
  def getIppVersion() do
    positional = [
    ]
    :evision_nif.ipp_getIppVersion(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **flag**: `bool`



  Python prototype (for reference): 
  ```python3
  setUseIPP(flag) -> None
  ```

  """
  @spec setUseIPP(boolean()) :: :ok | {:error, String.t()}
  def setUseIPP(flag) when is_boolean(flag)
  do
    positional = [
      flag: Evision.Internal.Structurise.from_struct(flag)
    ]
    :evision_nif.ipp_setUseIPP(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  proxy for hal::Cholesky

  Python prototype (for reference): 
  ```python3
  useIPP() -> retval
  ```

  """
  @spec useIPP() :: boolean() | {:error, String.t()}
  def useIPP() do
    positional = [
    ]
    :evision_nif.ipp_useIPP(positional)
    |> __to_struct__()
  end
end
