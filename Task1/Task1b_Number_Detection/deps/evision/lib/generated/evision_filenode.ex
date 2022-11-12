defmodule Evision.FileNode do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.FileNode` struct.

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
  def __to_struct__({:ok, %{class: :FileNode, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :FileNode, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  The constructors.
  ##### Return
  - **self**: `Evision.FileNode`

  These constructors are used to create a default file node, construct it from obsolete structures or
  from the another file node.

  Python prototype (for reference): 
  ```python3
  FileNode() -> <FileNode object>
  ```

  """
  @spec fileNode() :: Evision.FileNode.t() | {:error, String.t()}
  def fileNode() do
    positional = [
    ]
    :evision_nif.fileNode_FileNode(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **i**: `int`.

    Index of an element in the sequence node.


  ##### Return
  - **retval**: `Evision.FileNode`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  at(i) -> retval
  ```

  """
  @spec at(Evision.FileNode.t(), integer()) :: Evision.FileNode.t() | {:error, String.t()}
  def at(self, i) when is_integer(i)
  do
    positional = [
      i: Evision.Internal.Structurise.from_struct(i)
    ]
    :evision_nif.fileNode_at(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.fileNode_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **nodename**: `c_string`.

    Name of an element in the mapping node.


  ##### Return
  - **retval**: `Evision.FileNode`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  getNode(nodename) -> retval
  ```

  """
  @spec getNode(Evision.FileNode.t(), binary()) :: Evision.FileNode.t() | {:error, String.t()}
  def getNode(self, nodename) when is_binary(nodename)
  do
    positional = [
      nodename: Evision.Internal.Structurise.from_struct(nodename)
    ]
    :evision_nif.fileNode_getNode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isInt() -> retval
  ```

  """
  @spec isInt(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isInt(self) do
    positional = [
    ]
    :evision_nif.fileNode_isInt(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isMap() -> retval
  ```

  """
  @spec isMap(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isMap(self) do
    positional = [
    ]
    :evision_nif.fileNode_isMap(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isNamed() -> retval
  ```

  """
  @spec isNamed(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isNamed(self) do
    positional = [
    ]
    :evision_nif.fileNode_isNamed(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isNone() -> retval
  ```

  """
  @spec isNone(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isNone(self) do
    positional = [
    ]
    :evision_nif.fileNode_isNone(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isReal() -> retval
  ```

  """
  @spec isReal(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isReal(self) do
    positional = [
    ]
    :evision_nif.fileNode_isReal(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isSeq() -> retval
  ```

  """
  @spec isSeq(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isSeq(self) do
    positional = [
    ]
    :evision_nif.fileNode_isSeq(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isString() -> retval
  ```

  """
  @spec isString(Evision.FileNode.t()) :: boolean() | {:error, String.t()}
  def isString(self) do
    positional = [
    ]
    :evision_nif.fileNode_isString(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns keys of a mapping node.
  ##### Return
  - **retval**: `std::vector<String>`

  @returns Keys of a mapping node.

  Python prototype (for reference): 
  ```python3
  keys() -> retval
  ```

  """
  @spec keys(Evision.FileNode.t()) :: list(binary()) | {:error, String.t()}
  def keys(self) do
    positional = [
    ]
    :evision_nif.fileNode_keys(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  mat() -> retval
  ```

  """
  @spec mat(Evision.FileNode.t()) :: Evision.Mat.t() | {:error, String.t()}
  def mat(self) do
    positional = [
    ]
    :evision_nif.fileNode_mat(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  name() -> retval
  ```

  """
  @spec name(Evision.FileNode.t()) :: binary() | {:error, String.t()}
  def name(self) do
    positional = [
    ]
    :evision_nif.fileNode_name(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  rawSize() -> retval
  ```

  """
  @spec rawSize(Evision.FileNode.t()) :: integer() | {:error, String.t()}
  def rawSize(self) do
    positional = [
    ]
    :evision_nif.fileNode_rawSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  Internal method used when reading FileStorage.
  Sets the type (int, real or string) and value of the previously created node.

  Python prototype (for reference): 
  ```python3
  real() -> retval
  ```

  """
  @spec real(Evision.FileNode.t()) :: number() | {:error, String.t()}
  def real(self) do
    positional = [
    ]
    :evision_nif.fileNode_real(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  size() -> retval
  ```

  """
  @spec size(Evision.FileNode.t()) :: integer() | {:error, String.t()}
  def size(self) do
    positional = [
    ]
    :evision_nif.fileNode_size(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  string() -> retval
  ```

  """
  @spec string(Evision.FileNode.t()) :: binary() | {:error, String.t()}
  def string(self) do
    positional = [
    ]
    :evision_nif.fileNode_string(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns type of the node.
  ##### Return
  - **retval**: `int`

  @returns Type of the node. See FileNode::Type

  Python prototype (for reference): 
  ```python3
  type() -> retval
  ```

  """
  @spec type(Evision.FileNode.t()) :: integer() | {:error, String.t()}
  def type(self) do
    positional = [
    ]
    :evision_nif.fileNode_type(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
