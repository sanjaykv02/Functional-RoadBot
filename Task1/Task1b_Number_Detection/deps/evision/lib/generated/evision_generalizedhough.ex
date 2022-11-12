defmodule Evision.GeneralizedHough do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.GeneralizedHough` struct.

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
  def __to_struct__({:ok, %{class: :GeneralizedHough, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :GeneralizedHough, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  

  ##### Positional Arguments
  - **edges**: `Evision.Mat`
  - **dx**: `Evision.Mat`
  - **dy**: `Evision.Mat`

  ##### Return
  - **positions**: `Evision.Mat`.
  - **votes**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  detect(edges, dx, dy[, positions[, votes]]) -> positions, votes
  ```

  """
  @spec detect(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, edges, dx, dy, opts) when (is_struct(edges, Evision.Mat) or is_struct(edges, Nx.Tensor)) and (is_struct(dx, Evision.Mat) or is_struct(dx, Nx.Tensor)) and (is_struct(dy, Evision.Mat) or is_struct(dy, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      edges: Evision.Internal.Structurise.from_struct(edges),
      dx: Evision.Internal.Structurise.from_struct(dx),
      dy: Evision.Internal.Structurise.from_struct(dy)
    ]
    :evision_nif.generalizedHough_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **edges**: `Evision.Mat`
  - **dx**: `Evision.Mat`
  - **dy**: `Evision.Mat`

  ##### Return
  - **positions**: `Evision.Mat`.
  - **votes**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  detect(edges, dx, dy[, positions[, votes]]) -> positions, votes
  ```

  """
  @spec detect(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, edges, dx, dy) when (is_struct(edges, Evision.Mat) or is_struct(edges, Nx.Tensor)) and (is_struct(dx, Evision.Mat) or is_struct(dx, Nx.Tensor)) and (is_struct(dy, Evision.Mat) or is_struct(dy, Nx.Tensor))
  do
    positional = [
      edges: Evision.Internal.Structurise.from_struct(edges),
      dx: Evision.Internal.Structurise.from_struct(dx),
      dy: Evision.Internal.Structurise.from_struct(dy)
    ]
    :evision_nif.generalizedHough_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`

  ##### Return
  - **positions**: `Evision.Mat`.
  - **votes**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  detect(image[, positions[, votes]]) -> positions, votes
  ```

  """
  @spec detect(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.generalizedHough_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **image**: `Evision.Mat`

  ##### Return
  - **positions**: `Evision.Mat`.
  - **votes**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  detect(image[, positions[, votes]]) -> positions, votes
  ```

  """
  @spec detect(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.generalizedHough_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getCannyHighThresh() -> retval
  ```

  """
  @spec getCannyHighThresh(Evision.GeneralizedHough.t()) :: integer() | {:error, String.t()}
  def getCannyHighThresh(self) do
    positional = [
    ]
    :evision_nif.generalizedHough_getCannyHighThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getCannyLowThresh() -> retval
  ```

  """
  @spec getCannyLowThresh(Evision.GeneralizedHough.t()) :: integer() | {:error, String.t()}
  def getCannyLowThresh(self) do
    positional = [
    ]
    :evision_nif.generalizedHough_getCannyLowThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getDp() -> retval
  ```

  """
  @spec getDp(Evision.GeneralizedHough.t()) :: number() | {:error, String.t()}
  def getDp(self) do
    positional = [
    ]
    :evision_nif.generalizedHough_getDp(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getMaxBufferSize() -> retval
  ```

  """
  @spec getMaxBufferSize(Evision.GeneralizedHough.t()) :: integer() | {:error, String.t()}
  def getMaxBufferSize(self) do
    positional = [
    ]
    :evision_nif.generalizedHough_getMaxBufferSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  getMinDist() -> retval
  ```

  """
  @spec getMinDist(Evision.GeneralizedHough.t()) :: number() | {:error, String.t()}
  def getMinDist(self) do
    positional = [
    ]
    :evision_nif.generalizedHough_getMinDist(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cannyHighThresh**: `int`



  Python prototype (for reference): 
  ```python3
  setCannyHighThresh(cannyHighThresh) -> None
  ```

  """
  @spec setCannyHighThresh(Evision.GeneralizedHough.t(), integer()) :: :ok | {:error, String.t()}
  def setCannyHighThresh(self, cannyHighThresh) when is_integer(cannyHighThresh)
  do
    positional = [
      cannyHighThresh: Evision.Internal.Structurise.from_struct(cannyHighThresh)
    ]
    :evision_nif.generalizedHough_setCannyHighThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **cannyLowThresh**: `int`



  Python prototype (for reference): 
  ```python3
  setCannyLowThresh(cannyLowThresh) -> None
  ```

  """
  @spec setCannyLowThresh(Evision.GeneralizedHough.t(), integer()) :: :ok | {:error, String.t()}
  def setCannyLowThresh(self, cannyLowThresh) when is_integer(cannyLowThresh)
  do
    positional = [
      cannyLowThresh: Evision.Internal.Structurise.from_struct(cannyLowThresh)
    ]
    :evision_nif.generalizedHough_setCannyLowThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **dp**: `double`



  Python prototype (for reference): 
  ```python3
  setDp(dp) -> None
  ```

  """
  @spec setDp(Evision.GeneralizedHough.t(), number()) :: :ok | {:error, String.t()}
  def setDp(self, dp) when is_number(dp)
  do
    positional = [
      dp: Evision.Internal.Structurise.from_struct(dp)
    ]
    :evision_nif.generalizedHough_setDp(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **maxBufferSize**: `int`



  Python prototype (for reference): 
  ```python3
  setMaxBufferSize(maxBufferSize) -> None
  ```

  """
  @spec setMaxBufferSize(Evision.GeneralizedHough.t(), integer()) :: :ok | {:error, String.t()}
  def setMaxBufferSize(self, maxBufferSize) when is_integer(maxBufferSize)
  do
    positional = [
      maxBufferSize: Evision.Internal.Structurise.from_struct(maxBufferSize)
    ]
    :evision_nif.generalizedHough_setMaxBufferSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **minDist**: `double`



  Python prototype (for reference): 
  ```python3
  setMinDist(minDist) -> None
  ```

  """
  @spec setMinDist(Evision.GeneralizedHough.t(), number()) :: :ok | {:error, String.t()}
  def setMinDist(self, minDist) when is_number(minDist)
  do
    positional = [
      minDist: Evision.Internal.Structurise.from_struct(minDist)
    ]
    :evision_nif.generalizedHough_setMinDist(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **edges**: `Evision.Mat`
  - **dx**: `Evision.Mat`
  - **dy**: `Evision.Mat`

  ##### Keyword Arguments
  - **templCenter**: `Point`.




  Python prototype (for reference): 
  ```python3
  setTemplate(edges, dx, dy[, templCenter]) -> None
  ```

  """
  @spec setTemplate(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def setTemplate(self, edges, dx, dy, opts) when (is_struct(edges, Evision.Mat) or is_struct(edges, Nx.Tensor)) and (is_struct(dx, Evision.Mat) or is_struct(dx, Nx.Tensor)) and (is_struct(dy, Evision.Mat) or is_struct(dy, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      edges: Evision.Internal.Structurise.from_struct(edges),
      dx: Evision.Internal.Structurise.from_struct(dx),
      dy: Evision.Internal.Structurise.from_struct(dy)
    ]
    :evision_nif.generalizedHough_setTemplate(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **edges**: `Evision.Mat`
  - **dx**: `Evision.Mat`
  - **dy**: `Evision.Mat`

  ##### Keyword Arguments
  - **templCenter**: `Point`.




  Python prototype (for reference): 
  ```python3
  setTemplate(edges, dx, dy[, templCenter]) -> None
  ```

  """
  @spec setTemplate(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setTemplate(self, edges, dx, dy) when (is_struct(edges, Evision.Mat) or is_struct(edges, Nx.Tensor)) and (is_struct(dx, Evision.Mat) or is_struct(dx, Nx.Tensor)) and (is_struct(dy, Evision.Mat) or is_struct(dy, Nx.Tensor))
  do
    positional = [
      edges: Evision.Internal.Structurise.from_struct(edges),
      dx: Evision.Internal.Structurise.from_struct(dx),
      dy: Evision.Internal.Structurise.from_struct(dy)
    ]
    :evision_nif.generalizedHough_setTemplate(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **templ**: `Evision.Mat`

  ##### Keyword Arguments
  - **templCenter**: `Point`.




  Python prototype (for reference): 
  ```python3
  setTemplate(templ[, templCenter]) -> None
  ```

  """
  @spec setTemplate(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def setTemplate(self, templ, opts) when (is_struct(templ, Evision.Mat) or is_struct(templ, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      templ: Evision.Internal.Structurise.from_struct(templ)
    ]
    :evision_nif.generalizedHough_setTemplate(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **templ**: `Evision.Mat`

  ##### Keyword Arguments
  - **templCenter**: `Point`.




  Python prototype (for reference): 
  ```python3
  setTemplate(templ[, templCenter]) -> None
  ```

  """
  @spec setTemplate(Evision.GeneralizedHough.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setTemplate(self, templ) when (is_struct(templ, Evision.Mat) or is_struct(templ, Nx.Tensor))
  do
    positional = [
      templ: Evision.Internal.Structurise.from_struct(templ)
    ]
    :evision_nif.generalizedHough_setTemplate(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
