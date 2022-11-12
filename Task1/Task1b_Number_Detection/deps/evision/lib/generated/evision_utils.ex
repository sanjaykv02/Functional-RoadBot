defmodule Evision.Utils do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Utils` struct.

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
  def __to_struct__({:ok, %{class: :Utils, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Utils, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `bool`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpBool(argument) -> retval
  ```

  """
  @spec dumpBool(boolean()) :: binary() | {:error, String.t()}
  def dumpBool(argument) when is_boolean(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpBool(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `c_string`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpCString(argument) -> retval
  ```

  """
  @spec dumpCString(binary()) :: binary() | {:error, String.t()}
  def dumpCString(argument) when is_binary(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpCString(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `double`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpDouble(argument) -> retval
  ```

  """
  @spec dumpDouble(number()) :: binary() | {:error, String.t()}
  def dumpDouble(argument) when is_number(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpDouble(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `float`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpFloat(argument) -> retval
  ```

  """
  @spec dumpFloat(number()) :: binary() | {:error, String.t()}
  def dumpFloat(argument) when is_float(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpFloat(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `Evision.Mat`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpInputArray(argument) -> retval
  ```

  """
  @spec dumpInputArray(Evision.Mat.maybe_mat_in()) :: binary() | {:error, String.t()}
  def dumpInputArray(argument) when (is_struct(argument, Evision.Mat) or is_struct(argument, Nx.Tensor))
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpInputArray(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `[Evision.Mat]`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpInputArrayOfArrays(argument) -> retval
  ```

  """
  @spec dumpInputArrayOfArrays(list(Evision.Mat.maybe_mat_in())) :: binary() | {:error, String.t()}
  def dumpInputArrayOfArrays(argument) when is_list(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpInputArrayOfArrays(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`
  - **argument**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  dumpInputOutputArray(argument) -> retval, argument
  ```

  """
  @spec dumpInputOutputArray(Evision.Mat.maybe_mat_in()) :: {binary(), Evision.Mat.t()} | {:error, String.t()}
  def dumpInputOutputArray(argument) when (is_struct(argument, Evision.Mat) or is_struct(argument, Nx.Tensor))
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpInputOutputArray(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`
  - **argument**: `[Evision.Mat]`


  Python prototype (for reference): 
  ```python3
  dumpInputOutputArrayOfArrays(argument) -> retval, argument
  ```

  """
  @spec dumpInputOutputArrayOfArrays(list(Evision.Mat.maybe_mat_in())) :: {binary(), list(Evision.Mat.t())} | {:error, String.t()}
  def dumpInputOutputArrayOfArrays(argument) when is_list(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpInputOutputArrayOfArrays(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `int`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpInt(argument) -> retval
  ```

  """
  @spec dumpInt(integer()) :: binary() | {:error, String.t()}
  def dumpInt(argument) when is_integer(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpInt(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `Range`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpRange(argument) -> retval
  ```

  """
  @spec dumpRange({integer(), integer()} | :all) :: binary() | {:error, String.t()}
  def dumpRange(argument) when (is_tuple(argument) or argument == :all)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpRange(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `Rect`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpRect(argument) -> retval
  ```

  """
  @spec dumpRect({number(), number(), number(), number()}) :: binary() | {:error, String.t()}
  def dumpRect(argument) when is_tuple(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpRect(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `{centre={x, y}, size={s1, s2}, angle}`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpRotatedRect(argument) -> retval
  ```

  """
  @spec dumpRotatedRect({{number(), number()}, {number(), number()}, number()}) :: binary() | {:error, String.t()}
  def dumpRotatedRect(argument) when is_tuple(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpRotatedRect(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `size_t`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpSizeT(argument) -> retval
  ```

  """
  @spec dumpSizeT(integer()) :: binary() | {:error, String.t()}
  def dumpSizeT(argument) when is_integer(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpSizeT(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `String`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpString(argument) -> retval
  ```

  """
  @spec dumpString(binary()) :: binary() | {:error, String.t()}
  def dumpString(argument) when is_binary(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpString(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `TermCriteria`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpTermCriteria(argument) -> retval
  ```

  """
  @spec dumpTermCriteria({integer(), integer(), number()}) :: binary() | {:error, String.t()}
  def dumpTermCriteria(argument) when is_tuple(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_dumpTermCriteria(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **vec**: `[double]`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpVectorOfDouble(vec) -> retval
  ```

  """
  @spec dumpVectorOfDouble(list(number())) :: binary() | {:error, String.t()}
  def dumpVectorOfDouble(vec) when is_list(vec)
  do
    positional = [
      vec: Evision.Internal.Structurise.from_struct(vec)
    ]
    :evision_nif.utils_dumpVectorOfDouble(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **vec**: `[int]`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpVectorOfInt(vec) -> retval
  ```

  """
  @spec dumpVectorOfInt(list(integer())) :: binary() | {:error, String.t()}
  def dumpVectorOfInt(vec) when is_list(vec)
  do
    positional = [
      vec: Evision.Internal.Structurise.from_struct(vec)
    ]
    :evision_nif.utils_dumpVectorOfInt(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **vec**: `[Rect]`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  dumpVectorOfRect(vec) -> retval
  ```

  """
  @spec dumpVectorOfRect(list({number(), number(), number(), number()})) :: binary() | {:error, String.t()}
  def dumpVectorOfRect(vec) when is_list(vec)
  do
    positional = [
      vec: Evision.Internal.Structurise.from_struct(vec)
    ]
    :evision_nif.utils_dumpVectorOfRect(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **len**: `size_t`

  ##### Return
  - **vec**: `[int]`


  Python prototype (for reference): 
  ```python3
  generateVectorOfInt(len) -> vec
  ```

  """
  @spec generateVectorOfInt(integer()) :: list(integer()) | {:error, String.t()}
  def generateVectorOfInt(len) when is_integer(len)
  do
    positional = [
      len: Evision.Internal.Structurise.from_struct(len)
    ]
    :evision_nif.utils_generateVectorOfInt(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **len**: `size_t`
  - **rows**: `int`
  - **cols**: `int`
  - **dtype**: `int`

  ##### Return
  - **vec**: `[Evision.Mat]`.



  Python prototype (for reference): 
  ```python3
  generateVectorOfMat(len, rows, cols, dtype[, vec]) -> vec
  ```

  """
  @spec generateVectorOfMat(integer(), integer(), integer(), integer(), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def generateVectorOfMat(len, rows, cols, dtype, opts) when is_integer(len) and is_integer(rows) and is_integer(cols) and is_integer(dtype) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      len: Evision.Internal.Structurise.from_struct(len),
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      dtype: Evision.Internal.Structurise.from_struct(dtype)
    ]
    :evision_nif.utils_generateVectorOfMat(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **len**: `size_t`
  - **rows**: `int`
  - **cols**: `int`
  - **dtype**: `int`

  ##### Return
  - **vec**: `[Evision.Mat]`.



  Python prototype (for reference): 
  ```python3
  generateVectorOfMat(len, rows, cols, dtype[, vec]) -> vec
  ```

  """
  @spec generateVectorOfMat(integer(), integer(), integer(), integer()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def generateVectorOfMat(len, rows, cols, dtype) when is_integer(len) and is_integer(rows) and is_integer(cols) and is_integer(dtype)
  do
    positional = [
      len: Evision.Internal.Structurise.from_struct(len),
      rows: Evision.Internal.Structurise.from_struct(rows),
      cols: Evision.Internal.Structurise.from_struct(cols),
      dtype: Evision.Internal.Structurise.from_struct(dtype)
    ]
    :evision_nif.utils_generateVectorOfMat(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **len**: `size_t`

  ##### Return
  - **vec**: `[Rect]`


  Python prototype (for reference): 
  ```python3
  generateVectorOfRect(len) -> vec
  ```

  """
  @spec generateVectorOfRect(integer()) :: list({number(), number(), number(), number()}) | {:error, String.t()}
  def generateVectorOfRect(len) when is_integer(len)
  do
    positional = [
      len: Evision.Internal.Structurise.from_struct(len)
    ]
    :evision_nif.utils_generateVectorOfRect(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `Evision.Mat`

  ##### Return
  - **retval**: `Evision.AsyncArray`


  Python prototype (for reference): 
  ```python3
  testAsyncArray(argument) -> retval
  ```

  """
  @spec testAsyncArray(Evision.Mat.maybe_mat_in()) :: Evision.AsyncArray.t() | {:error, String.t()}
  def testAsyncArray(argument) when (is_struct(argument, Evision.Mat) or is_struct(argument, Nx.Tensor))
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_testAsyncArray(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.AsyncArray`


  Python prototype (for reference): 
  ```python3
  testAsyncException() -> retval
  ```

  """
  @spec testAsyncException() :: Evision.AsyncArray.t() | {:error, String.t()}
  def testAsyncException() do
    positional = [
    ]
    :evision_nif.utils_testAsyncException(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **rect**: `Rect`

  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  testOverloadResolution(rect) -> retval
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **value**: `int`

  ##### Keyword Arguments
  - **point**: `Point`.

  ##### Return
  - **retval**: `String`



  Python prototype (for reference): 
  ```python3
  testOverloadResolution(value[, point]) -> retval
  ```


  """
  @spec testOverloadResolution({number(), number(), number(), number()}) :: binary() | {:error, String.t()}
  def testOverloadResolution(rect) when is_tuple(rect)
  do
    positional = [
      rect: Evision.Internal.Structurise.from_struct(rect)
    ]
    :evision_nif.utils_testOverloadResolution(positional)
    |> __to_struct__()
  end
  @spec testOverloadResolution(integer()) :: binary() | {:error, String.t()}
  def testOverloadResolution(value) when is_integer(value)
  do
    positional = [
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.utils_testOverloadResolution(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **value**: `int`

  ##### Keyword Arguments
  - **point**: `Point`.

  ##### Return
  - **retval**: `String`



  Python prototype (for reference): 
  ```python3
  testOverloadResolution(value[, point]) -> retval
  ```

  """
  @spec testOverloadResolution(integer(), [{atom(), term()},...] | nil) :: binary() | {:error, String.t()}
  def testOverloadResolution(value, opts) when is_integer(value) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.utils_testOverloadResolution(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **argument**: `int`

  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  testOverwriteNativeMethod(argument) -> retval
  ```

  """
  @spec testOverwriteNativeMethod(integer()) :: integer() | {:error, String.t()}
  def testOverwriteNativeMethod(argument) when is_integer(argument)
  do
    positional = [
      argument: Evision.Internal.Structurise.from_struct(argument)
    ]
    :evision_nif.utils_testOverwriteNativeMethod(positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  testRaiseGeneralException() -> None
  ```

  """
  @spec testRaiseGeneralException() :: :ok | {:error, String.t()}
  def testRaiseGeneralException() do
    positional = [
    ]
    :evision_nif.utils_testRaiseGeneralException(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **positional_argument**: `int`

  ##### Keyword Arguments
  - **lambda**: `int`.
  - **from**: `int`.

  ##### Return
  - **retval**: `String`



  Python prototype (for reference): 
  ```python3
  testReservedKeywordConversion(positional_argument[, lambda[, from]]) -> retval
  ```

  """
  @spec testReservedKeywordConversion(integer(), [{atom(), term()},...] | nil) :: binary() | {:error, String.t()}
  def testReservedKeywordConversion(positional_argument, opts) when is_integer(positional_argument) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      positional_argument: Evision.Internal.Structurise.from_struct(positional_argument)
    ]
    :evision_nif.utils_testReservedKeywordConversion(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **positional_argument**: `int`

  ##### Keyword Arguments
  - **lambda**: `int`.
  - **from**: `int`.

  ##### Return
  - **retval**: `String`



  Python prototype (for reference): 
  ```python3
  testReservedKeywordConversion(positional_argument[, lambda[, from]]) -> retval
  ```

  """
  @spec testReservedKeywordConversion(integer()) :: binary() | {:error, String.t()}
  def testReservedKeywordConversion(positional_argument) when is_integer(positional_argument)
  do
    positional = [
      positional_argument: Evision.Internal.Structurise.from_struct(positional_argument)
    ]
    :evision_nif.utils_testReservedKeywordConversion(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **x**: `float`
  - **y**: `float`
  - **w**: `float`
  - **h**: `float`
  - **angle**: `float`

  ##### Return
  - **retval**: `{centre={x, y}, size={s1, s2}, angle}`


  Python prototype (for reference): 
  ```python3
  testRotatedRect(x, y, w, h, angle) -> retval
  ```

  """
  @spec testRotatedRect(number(), number(), number(), number(), number()) :: {{number(), number()}, {number(), number()}, number()} | {:error, String.t()}
  def testRotatedRect(x, y, w, h, angle) when is_float(x) and is_float(y) and is_float(w) and is_float(h) and is_float(angle)
  do
    positional = [
      x: Evision.Internal.Structurise.from_struct(x),
      y: Evision.Internal.Structurise.from_struct(y),
      w: Evision.Internal.Structurise.from_struct(w),
      h: Evision.Internal.Structurise.from_struct(h),
      angle: Evision.Internal.Structurise.from_struct(angle)
    ]
    :evision_nif.utils_testRotatedRect(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **x**: `float`
  - **y**: `float`
  - **w**: `float`
  - **h**: `float`
  - **angle**: `float`

  ##### Return
  - **retval**: `std::vector<RotatedRect>`


  Python prototype (for reference): 
  ```python3
  testRotatedRectVector(x, y, w, h, angle) -> retval
  ```

  """
  @spec testRotatedRectVector(number(), number(), number(), number(), number()) :: list({{number(), number()}, {number(), number()}, number()}) | {:error, String.t()}
  def testRotatedRectVector(x, y, w, h, angle) when is_float(x) and is_float(y) and is_float(w) and is_float(h) and is_float(angle)
  do
    positional = [
      x: Evision.Internal.Structurise.from_struct(x),
      y: Evision.Internal.Structurise.from_struct(y),
      w: Evision.Internal.Structurise.from_struct(w),
      h: Evision.Internal.Structurise.from_struct(h),
      angle: Evision.Internal.Structurise.from_struct(angle)
    ]
    :evision_nif.utils_testRotatedRectVector(positional)
    |> __to_struct__()
  end
end
