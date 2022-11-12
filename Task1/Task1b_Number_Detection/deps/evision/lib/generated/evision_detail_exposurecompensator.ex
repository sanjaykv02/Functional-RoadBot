defmodule Evision.Detail.ExposureCompensator do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Detail.ExposureCompensator` struct.

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
  def __to_struct__({:ok, %{class: :"Detail.ExposureCompensator", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"Detail.ExposureCompensator", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Compensate exposure in the specified image.

  ##### Positional Arguments
  - **index**: `int`.

    Image index

  - **corner**: `Point`.

    Image top-left corner

  - **mask**: `Evision.Mat`.

    Image mask


  ##### Return
  - **image**: `Evision.Mat`.

    Image to process




  Python prototype (for reference): 
  ```python3
  apply(index, corner, image, mask) -> image
  ```

  """
  @spec apply(Evision.Detail.ExposureCompensator.t(), integer(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, index, corner, image, mask) when is_integer(index) and is_tuple(corner) and (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(mask, Evision.Mat) or is_struct(mask, Nx.Tensor))
  do
    positional = [
      index: Evision.Internal.Structurise.from_struct(index),
      corner: Evision.Internal.Structurise.from_struct(corner),
      image: Evision.Internal.Structurise.from_struct(image),
      mask: Evision.Internal.Structurise.from_struct(mask)
    ]
    :evision_nif.detail_detail_ExposureCompensator_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **type**: `int`

  ##### Return
  - **retval**: `Evision.Detail.ExposureCompensator`


  Python prototype (for reference): 
  ```python3
  createDefault(type) -> retval
  ```

  """
  @spec createDefault(integer()) :: Evision.Detail.ExposureCompensator.t() | {:error, String.t()}
  def createDefault(type) when is_integer(type)
  do
    positional = [
      type: Evision.Internal.Structurise.from_struct(type)
    ]
    :evision_nif.detail_detail_ExposureCompensator_createDefault_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **corners**: `[Point]`.

    Source image top-left corners

  - **images**: `[Evision.Mat]`.

    Source images

  - **masks**: `[Evision.Mat]`.

    Image masks to update (second value in pair specifies the value which should be used
    to detect where image is)





  Python prototype (for reference): 
  ```python3
  feed(corners, images, masks) -> None
  ```

  """
  @spec feed(Evision.Detail.ExposureCompensator.t(), list({number(), number()}), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def feed(self, corners, images, masks) when is_list(corners) and is_list(images) and is_list(masks)
  do
    positional = [
      corners: Evision.Internal.Structurise.from_struct(corners),
      images: Evision.Internal.Structurise.from_struct(images),
      masks: Evision.Internal.Structurise.from_struct(masks)
    ]
    :evision_nif.detail_detail_ExposureCompensator_feed(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **arg1**: `[Evision.Mat]`.



  Python prototype (for reference): 
  ```python3
  getMatGains([, arg1]) -> arg1
  ```

  """
  @spec getMatGains(Evision.Detail.ExposureCompensator.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getMatGains(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ExposureCompensator_getMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  getUpdateGain() -> retval
  ```

  """
  @spec getUpdateGain(Evision.Detail.ExposureCompensator.t()) :: boolean() | {:error, String.t()}
  def getUpdateGain(self) do
    positional = [
    ]
    :evision_nif.detail_detail_ExposureCompensator_getUpdateGain(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **arg1**: `[Evision.Mat]`



  Python prototype (for reference): 
  ```python3
  setMatGains(arg1) -> None
  ```

  """
  @spec setMatGains(Evision.Detail.ExposureCompensator.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def setMatGains(self, arg1) when is_list(arg1)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.detail_detail_ExposureCompensator_setMatGains(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **b**: `bool`



  Python prototype (for reference): 
  ```python3
  setUpdateGain(b) -> None
  ```

  """
  @spec setUpdateGain(Evision.Detail.ExposureCompensator.t(), boolean()) :: :ok | {:error, String.t()}
  def setUpdateGain(self, b) when is_boolean(b)
  do
    positional = [
      b: Evision.Internal.Structurise.from_struct(b)
    ]
    :evision_nif.detail_detail_ExposureCompensator_setUpdateGain(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
