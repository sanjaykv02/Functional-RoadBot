defmodule Evision.Utils.Nested.OriginalClassName do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Utils.Nested.OriginalClassName` struct.

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
  def __to_struct__({:ok, %{class: :"Utils.Nested.OriginalClassName", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Utils.Nested.OriginalClassName", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Keyword Arguments
  - **params**: `Evision.Utils.Nested.OriginalClassName.Params`.

  ##### Return
  - **retval**: `Evision.Utils.Nested.OriginalClassName`



  Python prototype (for reference): 
  ```python3
  create([, params]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.Utils.Nested.OriginalClassName.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.utils_nested_utils_nested_OriginalClassName_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **params**: `Evision.Utils.Nested.OriginalClassName.Params`.

  ##### Return
  - **retval**: `Evision.Utils.Nested.OriginalClassName`



  Python prototype (for reference): 
  ```python3
  create([, params]) -> retval
  ```

  """
  @spec create() :: Evision.Utils.Nested.OriginalClassName.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.utils_nested_utils_nested_OriginalClassName_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getFloatParam() -> retval
  ```

  """
  @spec getFloatParam(Evision.Utils.Nested.OriginalClassName.t()) :: number() | {:error, String.t()}
  def getFloatParam(self) do
    positional = [
    ]
    :evision_nif.utils_nested_utils_nested_OriginalClassName_getFloatParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getIntParam() -> retval
  ```

  """
  @spec getIntParam(Evision.Utils.Nested.OriginalClassName.t()) :: integer() | {:error, String.t()}
  def getIntParam(self) do
    positional = [
    ]
    :evision_nif.utils_nested_utils_nested_OriginalClassName_getIntParam(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  originalName() -> retval
  ```

  """
  @spec originalName() :: binary() | {:error, String.t()}
  def originalName() do
    positional = [
    ]
    :evision_nif.utils_nested_utils_nested_OriginalClassName_originalName_static(positional)
    |> __to_struct__()
  end
end
