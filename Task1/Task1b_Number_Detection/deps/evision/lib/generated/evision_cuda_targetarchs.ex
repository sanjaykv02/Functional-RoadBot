defmodule Evision.CUDA.TargetArchs do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CUDA.TargetArchs` struct.

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
  def __to_struct__({:ok, %{class: :"CUDA.TargetArchs", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"CUDA.TargetArchs", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  There is a set of methods to check whether the module contains intermediate (PTX) or binary CUDA
  code for the given architecture(s):


  ##### Positional Arguments
  - **major**: `int`.

    Major compute capability version.

  - **minor**: `int`.

    Minor compute capability version.


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  has(major, minor) -> retval
  ```

  """
  @spec has(integer(), integer()) :: boolean() | {:error, String.t()}
  def has(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_has_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasBin(major, minor) -> retval
  ```

  """
  @spec hasBin(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasBin(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasBin_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasEqualOrGreater(major, minor) -> retval
  ```

  """
  @spec hasEqualOrGreater(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasEqualOrGreater(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasEqualOrGreater_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasEqualOrGreaterBin(major, minor) -> retval
  ```

  """
  @spec hasEqualOrGreaterBin(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasEqualOrGreaterBin(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasEqualOrGreaterBin_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasEqualOrGreaterPtx(major, minor) -> retval
  ```

  """
  @spec hasEqualOrGreaterPtx(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasEqualOrGreaterPtx(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasEqualOrGreaterPtx_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasEqualOrLessPtx(major, minor) -> retval
  ```

  """
  @spec hasEqualOrLessPtx(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasEqualOrLessPtx(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasEqualOrLessPtx_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **major**: `int`
  - **minor**: `int`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hasPtx(major, minor) -> retval
  ```

  """
  @spec hasPtx(integer(), integer()) :: boolean() | {:error, String.t()}
  def hasPtx(major, minor) when is_integer(major) and is_integer(minor)
  do
    positional = [
      major: Evision.Internal.Structurise.from_struct(major),
      minor: Evision.Internal.Structurise.from_struct(minor)
    ]
    :evision_nif.cuda_cuda_TargetArchs_hasPtx_static(positional)
    |> __to_struct__()
  end
end
