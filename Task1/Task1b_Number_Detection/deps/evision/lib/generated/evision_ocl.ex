defmodule Evision.OCL do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.OCL` struct.

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
  def __to_struct__({:ok, %{class: :OCL, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :OCL, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  finish() -> None
  ```

  """
  @spec finish() :: :ok | {:error, String.t()}
  def finish() do
    positional = [
    ]
    :evision_nif.ocl_finish(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  haveAmdBlas() -> retval
  ```

  """
  @spec haveAmdBlas() :: boolean() | {:error, String.t()}
  def haveAmdBlas() do
    positional = [
    ]
    :evision_nif.ocl_haveAmdBlas(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  haveAmdFft() -> retval
  ```

  """
  @spec haveAmdFft() :: boolean() | {:error, String.t()}
  def haveAmdFft() do
    positional = [
    ]
    :evision_nif.ocl_haveAmdFft(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  haveOpenCL() -> retval
  ```

  """
  @spec haveOpenCL() :: boolean() | {:error, String.t()}
  def haveOpenCL() do
    positional = [
    ]
    :evision_nif.ocl_haveOpenCL(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **flag**: `bool`



  Python prototype (for reference): 
  ```python3
  setUseOpenCL(flag) -> None
  ```

  """
  @spec setUseOpenCL(boolean()) :: :ok | {:error, String.t()}
  def setUseOpenCL(flag) when is_boolean(flag)
  do
    positional = [
      flag: Evision.Internal.Structurise.from_struct(flag)
    ]
    :evision_nif.ocl_setUseOpenCL(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  useOpenCL() -> retval
  ```

  """
  @spec useOpenCL() :: boolean() | {:error, String.t()}
  def useOpenCL() do
    positional = [
    ]
    :evision_nif.ocl_useOpenCL(positional)
    |> __to_struct__()
  end
end
