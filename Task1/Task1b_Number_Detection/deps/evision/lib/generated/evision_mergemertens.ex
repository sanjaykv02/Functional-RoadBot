defmodule Evision.MergeMertens do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.MergeMertens` struct.

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
  def __to_struct__({:ok, %{class: :MergeMertens, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :MergeMertens, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getContrastWeight() -> retval
  ```

  """
  @spec getContrastWeight(Evision.MergeMertens.t()) :: number() | {:error, String.t()}
  def getContrastWeight(self) do
    positional = [
    ]
    :evision_nif.mergeMertens_getContrastWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getExposureWeight() -> retval
  ```

  """
  @spec getExposureWeight(Evision.MergeMertens.t()) :: number() | {:error, String.t()}
  def getExposureWeight(self) do
    positional = [
    ]
    :evision_nif.mergeMertens_getExposureWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`


  Python prototype (for reference): 
  ```python3
  getSaturationWeight() -> retval
  ```

  """
  @spec getSaturationWeight(Evision.MergeMertens.t()) :: number() | {:error, String.t()}
  def getSaturationWeight(self) do
    positional = [
    ]
    :evision_nif.mergeMertens_getSaturationWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`
  - **response**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times, response[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeMertens.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, response, opts) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.mergeMertens_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`
  - **times**: `Evision.Mat`
  - **response**: `Evision.Mat`

  ##### Return
  - **dst**: `Evision.Mat`.



  Python prototype (for reference): 
  ```python3
  process(src, times, response[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeMertens.t(), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, times, response) when is_list(src) and (is_struct(times, Evision.Mat) or is_struct(times, Nx.Tensor)) and (is_struct(response, Evision.Mat) or is_struct(response, Nx.Tensor))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src),
      times: Evision.Internal.Structurise.from_struct(times),
      response: Evision.Internal.Structurise.from_struct(response)
    ]
    :evision_nif.mergeMertens_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Short version of process, that doesn't take extra arguments.

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images


  ##### Return
  - **dst**: `Evision.Mat`.

    result image




  Python prototype (for reference): 
  ```python3
  process(src[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeMertens.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src, opts) when is_list(src) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.mergeMertens_process(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Short version of process, that doesn't take extra arguments.

  ##### Positional Arguments
  - **src**: `[Evision.Mat]`.

    vector of input images


  ##### Return
  - **dst**: `Evision.Mat`.

    result image




  Python prototype (for reference): 
  ```python3
  process(src[, dst]) -> dst
  ```

  """
  @spec process(Evision.MergeMertens.t(), list(Evision.Mat.maybe_mat_in())) :: Evision.Mat.t() | {:error, String.t()}
  def process(self, src) when is_list(src)
  do
    positional = [
      src: Evision.Internal.Structurise.from_struct(src)
    ]
    :evision_nif.mergeMertens_process(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **contrast_weiht**: `float`



  Python prototype (for reference): 
  ```python3
  setContrastWeight(contrast_weiht) -> None
  ```

  """
  @spec setContrastWeight(Evision.MergeMertens.t(), number()) :: :ok | {:error, String.t()}
  def setContrastWeight(self, contrast_weiht) when is_float(contrast_weiht)
  do
    positional = [
      contrast_weiht: Evision.Internal.Structurise.from_struct(contrast_weiht)
    ]
    :evision_nif.mergeMertens_setContrastWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **exposure_weight**: `float`



  Python prototype (for reference): 
  ```python3
  setExposureWeight(exposure_weight) -> None
  ```

  """
  @spec setExposureWeight(Evision.MergeMertens.t(), number()) :: :ok | {:error, String.t()}
  def setExposureWeight(self, exposure_weight) when is_float(exposure_weight)
  do
    positional = [
      exposure_weight: Evision.Internal.Structurise.from_struct(exposure_weight)
    ]
    :evision_nif.mergeMertens_setExposureWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **saturation_weight**: `float`



  Python prototype (for reference): 
  ```python3
  setSaturationWeight(saturation_weight) -> None
  ```

  """
  @spec setSaturationWeight(Evision.MergeMertens.t(), number()) :: :ok | {:error, String.t()}
  def setSaturationWeight(self, saturation_weight) when is_float(saturation_weight)
  do
    positional = [
      saturation_weight: Evision.Internal.Structurise.from_struct(saturation_weight)
    ]
    :evision_nif.mergeMertens_setSaturationWeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
