defmodule Evision.UMat do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.UMat` struct.

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
  def __to_struct__({:ok, %{class: :UMat, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :UMat, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(rows, cols, type, s[, usageFlags]) -> <UMat object>
  ```

  """
  @spec uMat(integer(), integer(), integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(rows, cols, type, s, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and is_tuple(s) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(rows, cols, type, s[, usageFlags]) -> <UMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(size, type, s[, usageFlags]) -> <UMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(rows, cols, type[, usageFlags]) -> <UMat object>
  ```


  """
  @spec uMat({number(), number()}, integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}, [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(size, type, s, opts) when is_tuple(size) and is_integer(type) and is_tuple(s) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec uMat(integer(), integer(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(rows, cols, type, opts) when is_integer(rows) and is_integer(cols) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec uMat(integer(), integer(), integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(rows, cols, type, s) when is_integer(rows) and is_integer(cols) and is_integer(type) and is_tuple(s)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`
  - **s**: `Scalar`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(size, type, s[, usageFlags]) -> <UMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **rows**: `int`
  - **cols**: `int`
  - **type**: `int`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(rows, cols, type[, usageFlags]) -> <UMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **m**: `Evision.Mat`
  - **rowRange**: `Range`

  ##### Keyword Arguments
  - **colRange**: `Range`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(m, rowRange[, colRange]) -> <UMat object>
  ```

  #### Variant 4:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(size, type[, usageFlags]) -> <UMat object>
  ```


  """
  @spec uMat(Evision.Mat.maybe_mat_in(), {integer(), integer()} | :all, [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(m, rowRange, opts) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor)) and (is_tuple(rowRange) or rowRange == :all) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      rowRange: Evision.Internal.Structurise.from_struct(rowRange)
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec uMat({number(), number()}, integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(size, type, opts) when is_tuple(size) and is_integer(type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec uMat({number(), number()}, integer(), {number()} | {number(), number()} | {number() | number() | number()} | {number(), number(), number(), number()}) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(size, type, s) when is_tuple(size) and is_integer(type) and is_tuple(s)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type),
      s: Evision.Internal.Structurise.from_struct(s)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end
  @spec uMat(integer(), integer(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(rows, cols, type) when is_integer(rows) and is_integer(cols) and is_integer(type)
  do
    positional = [
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **m**: `Evision.Mat`
  - **ranges**: `[Range]`

  ##### Return
  - **self**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  UMat(m, ranges) -> <UMat object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **m**: `Evision.Mat`
  - **roi**: `Rect`

  ##### Return
  - **self**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  UMat(m, roi) -> <UMat object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **m**: `Evision.Mat`
  - **rowRange**: `Range`

  ##### Keyword Arguments
  - **colRange**: `Range`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(m, rowRange[, colRange]) -> <UMat object>
  ```

  #### Variant 4:
  

  ##### Positional Arguments
  - **size**: `Size`
  - **type**: `int`

  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat(size, type[, usageFlags]) -> <UMat object>
  ```


  """
  @spec uMat(Evision.Mat.maybe_mat_in(), list({integer(), integer()} | :all)) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(m, ranges) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor)) and is_list(ranges)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      ranges: Evision.Internal.Structurise.from_struct(ranges)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end
  @spec uMat(Evision.Mat.maybe_mat_in(), {number(), number(), number(), number()}) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(m, roi) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor)) and is_tuple(roi)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      roi: Evision.Internal.Structurise.from_struct(roi)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end
  @spec uMat(Evision.Mat.maybe_mat_in(), {integer(), integer()} | :all) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(m, rowRange) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor)) and (is_tuple(rowRange) or rowRange == :all)
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m),
      rowRange: Evision.Internal.Structurise.from_struct(rowRange)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end
  @spec uMat({number(), number()}, integer()) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(size, type) when is_tuple(size) and is_integer(type)
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **m**: `Evision.Mat`

  ##### Return
  - **self**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  UMat(m) -> <UMat object>
  ```

  #### Variant 2:
  
  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat([, usageFlags]) -> <UMat object>
  ```


  """
  @spec uMat([{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.uMat_UMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec uMat(Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def uMat(m) when (is_struct(m, Evision.Mat) or is_struct(m, Nx.Tensor))
  do
    positional = [
      m: Evision.Internal.Structurise.from_struct(m)
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Keyword Arguments
  - **usageFlags**: `UMatUsageFlags`.

  ##### Return
  - **self**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  UMat([, usageFlags]) -> <UMat object>
  ```

  """
  @spec uMat() :: Evision.Mat.t() | {:error, String.t()}
  def uMat() do
    positional = [
    ]
    :evision_nif.uMat_UMat(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `void*`


  Python prototype (for reference): 
  ```python3
  context() -> retval
  ```

  """
  @spec context() :: :ok | {:error, String.t()}
  def context() do
    positional = [
    ]
    :evision_nif.uMat_context_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  get() -> retval
  ```

  """
  @spec get(Evision.Mat.t()) :: Evision.Mat.t() | {:error, String.t()}
  def get(self) do
    positional = [
    ]
    :evision_nif.uMat_get(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **accessFlags**: `AccessFlag`

  ##### Return
  - **retval**: `void*`


  Python prototype (for reference): 
  ```python3
  handle(accessFlags) -> retval
  ```

  """
  @spec handle(Evision.Mat.t(), integer()) :: :ok | {:error, String.t()}
  def handle(self, accessFlags) when is_integer(accessFlags)
  do
    positional = [
      accessFlags: Evision.Internal.Structurise.from_struct(accessFlags)
    ]
    :evision_nif.uMat_handle(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isContinuous() -> retval
  ```

  """
  @spec isContinuous(Evision.Mat.t()) :: boolean() | {:error, String.t()}
  def isContinuous(self) do
    positional = [
    ]
    :evision_nif.uMat_isContinuous(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isSubmatrix() -> retval
  ```

  """
  @spec isSubmatrix(Evision.Mat.t()) :: boolean() | {:error, String.t()}
  def isSubmatrix(self) do
    positional = [
    ]
    :evision_nif.uMat_isSubmatrix(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `void*`


  Python prototype (for reference): 
  ```python3
  queue() -> retval
  ```

  """
  @spec queue() :: :ok | {:error, String.t()}
  def queue() do
    positional = [
    ]
    :evision_nif.uMat_queue_static(positional)
    |> __to_struct__()
  end
  @spec get_offset(Evision.Mat.maybe_mat_in()) :: integer()
  def get_offset(self) do
    :evision_nif.uMat_get_offset(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_offset(Evision.Mat.maybe_mat_in(), integer()) :: Evision.Mat.t()
  def set_offset(self, prop) do
    :evision_nif.uMat_set_offset(Evision.Internal.Structurise.from_struct(self), [offset: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
end
