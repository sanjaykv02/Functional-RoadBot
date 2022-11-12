defmodule Evision.CLAHE do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.CLAHE` struct.

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
  def __to_struct__({:ok, %{class: :CLAHE, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :CLAHE, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Equalizes the histogram of a grayscale image using Contrast Limited Adaptive Histogram Equalization.

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    Source image of type CV_8UC1 or CV_16UC1.


  ##### Return
  - **dst**: `Evision.Mat`.

    Destination image.




  Python prototype (for reference): 
  ```python3
  apply(src[, dst]) -> dst
  ```

  """
  @spec apply(Evision.CLAHE.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, src, opts) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.clahe_apply(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Equalizes the histogram of a grayscale image using Contrast Limited Adaptive Histogram Equalization.

  ##### Positional Arguments
  - **src**: `Evision.Mat`.

    Source image of type CV_8UC1 or CV_16UC1.


  ##### Return
  - **dst**: `Evision.Mat`.

    Destination image.




  Python prototype (for reference): 
  ```python3
  apply(src[, dst]) -> dst
  ```

  """
  @spec apply(Evision.CLAHE.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, src) when (is_struct(src, Evision.Mat) or is_struct(src, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.clahe_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  collectGarbage() -> None
  ```

  """
  @spec collectGarbage(Evision.CLAHE.t()) :: :ok | {:error, String.t()}
  def collectGarbage(self) do
    positional = [
    ]
    :evision_nif.clahe_collectGarbage(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getClipLimit() -> retval
  ```

  """
  @spec getClipLimit(Evision.CLAHE.t()) :: number() | {:error, String.t()}
  def getClipLimit(self) do
    positional = [
    ]
    :evision_nif.clahe_getClipLimit(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Size`


  Python prototype (for reference): 
  ```python3
  getTilesGridSize() -> retval
  ```

  """
  @spec getTilesGridSize(Evision.CLAHE.t()) :: {number(), number()} | {:error, String.t()}
  def getTilesGridSize(self) do
    positional = [
    ]
    :evision_nif.clahe_getTilesGridSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets threshold for contrast limiting.

  ##### Positional Arguments
  - **clipLimit**: `double`.

    threshold value.





  Python prototype (for reference): 
  ```python3
  setClipLimit(clipLimit) -> None
  ```

  """
  @spec setClipLimit(Evision.CLAHE.t(), number()) :: :ok | {:error, String.t()}
  def setClipLimit(self, clipLimit) when is_number(clipLimit)
  do
    positional = [
      clipLimit: Evision.Internal.Structurise.from_struct(clipLimit)
    ]
    :evision_nif.clahe_setClipLimit(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets size of grid for histogram equalization. Input image will be divided into
  equally sized rectangular tiles.


  ##### Positional Arguments
  - **tileGridSize**: `Size`.

    defines the number of tiles in row and column.





  Python prototype (for reference): 
  ```python3
  setTilesGridSize(tileGridSize) -> None
  ```

  """
  @spec setTilesGridSize(Evision.CLAHE.t(), {number(), number()}) :: :ok | {:error, String.t()}
  def setTilesGridSize(self, tileGridSize) when is_tuple(tileGridSize)
  do
    positional = [
      tileGridSize: Evision.Internal.Structurise.from_struct(tileGridSize)
    ]
    :evision_nif.clahe_setTilesGridSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
