defmodule Evision.Stitcher do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Stitcher` struct.

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
  def __to_struct__({:ok, %{class: :Stitcher, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Stitcher, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  These functions try to compose the given images (or images stored internally from the other function
  calls) into the final pano under the assumption that the image transformations were estimated
  before.


  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.


  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

    Final pano.


  **Note**: Use the functions only if you're aware of the stitching pipeline, otherwise use
  Stitcher::stitch.
  @return Status code.


  Python prototype (for reference): 
  ```python3
  composePanorama(images[, pano]) -> retval, pano
  ```

  """
  @spec composePanorama(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def composePanorama(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_composePanorama(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  These functions try to compose the given images (or images stored internally from the other function
  calls) into the final pano under the assumption that the image transformations were estimated
  before.


  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.


  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

    Final pano.


  **Note**: Use the functions only if you're aware of the stitching pipeline, otherwise use
  Stitcher::stitch.
  @return Status code.


  Python prototype (for reference): 
  ```python3
  composePanorama(images[, pano]) -> retval, pano
  ```

  """
  @spec composePanorama(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in())) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def composePanorama(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_composePanorama(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  composePanorama([, pano]) -> retval, pano
  ```

  """
  @spec composePanorama(Evision.Stitcher.t()) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def composePanorama(self) do
    positional = [
    ]
    :evision_nif.stitcher_composePanorama(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  compositingResol() -> retval
  ```

  """
  @spec compositingResol(Evision.Stitcher.t()) :: number() | {:error, String.t()}
  def compositingResol(self) do
    positional = [
    ]
    :evision_nif.stitcher_compositingResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Creates a Stitcher configured in one of the stitching modes.
  ##### Keyword Arguments
  - **mode**: `Mode`.

    Scenario for stitcher operation. This is usually determined by source of images
    to stitch and their transformation. Default parameters will be chosen for operation in given
    scenario.


  ##### Return
  - **retval**: `Evision.Stitcher`

  @return Stitcher class instance.


  Python prototype (for reference): 
  ```python3
  create([, mode]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.Stitcher.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.stitcher_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates a Stitcher configured in one of the stitching modes.
  ##### Keyword Arguments
  - **mode**: `Mode`.

    Scenario for stitcher operation. This is usually determined by source of images
    to stitch and their transformation. Default parameters will be chosen for operation in given
    scenario.


  ##### Return
  - **retval**: `Evision.Stitcher`

  @return Stitcher class instance.


  Python prototype (for reference): 
  ```python3
  create([, mode]) -> retval
  ```

  """
  @spec create() :: Evision.Stitcher.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.stitcher_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  These functions try to match the given images and to estimate rotations of each camera.

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).


  ##### Return
  - **retval**: `Status`

  **Note**: Use the functions only if you're aware of the stitching pipeline, otherwise use
  Stitcher::stitch.
  @return Status code.


  Python prototype (for reference): 
  ```python3
  estimateTransform(images[, masks]) -> retval
  ```

  """
  @spec estimateTransform(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: integer() | {:error, String.t()}
  def estimateTransform(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_estimateTransform(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  These functions try to match the given images and to estimate rotations of each camera.

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).


  ##### Return
  - **retval**: `Status`

  **Note**: Use the functions only if you're aware of the stitching pipeline, otherwise use
  Stitcher::stitch.
  @return Status code.


  Python prototype (for reference): 
  ```python3
  estimateTransform(images[, masks]) -> retval
  ```

  """
  @spec estimateTransform(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in())) :: integer() | {:error, String.t()}
  def estimateTransform(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_estimateTransform(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `InterpolationFlags`


  Python prototype (for reference): 
  ```python3
  interpolationFlags() -> retval
  ```

  """
  @spec interpolationFlags(Evision.Stitcher.t()) :: integer() | {:error, String.t()}
  def interpolationFlags(self) do
    positional = [
    ]
    :evision_nif.stitcher_interpolationFlags(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  panoConfidenceThresh() -> retval
  ```

  """
  @spec panoConfidenceThresh(Evision.Stitcher.t()) :: number() | {:error, String.t()}
  def panoConfidenceThresh(self) do
    positional = [
    ]
    :evision_nif.stitcher_panoConfidenceThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  registrationResol() -> retval
  ```

  """
  @spec registrationResol(Evision.Stitcher.t()) :: number() | {:error, String.t()}
  def registrationResol(self) do
    positional = [
    ]
    :evision_nif.stitcher_registrationResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  seamEstimationResol() -> retval
  ```

  """
  @spec seamEstimationResol(Evision.Stitcher.t()) :: number() | {:error, String.t()}
  def seamEstimationResol(self) do
    positional = [
    ]
    :evision_nif.stitcher_seamEstimationResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **resol_mpx**: `double`



  Python prototype (for reference): 
  ```python3
  setCompositingResol(resol_mpx) -> None
  ```

  """
  @spec setCompositingResol(Evision.Stitcher.t(), number()) :: :ok | {:error, String.t()}
  def setCompositingResol(self, resol_mpx) when is_number(resol_mpx)
  do
    positional = [
      resol_mpx: Evision.Internal.Structurise.from_struct(resol_mpx)
    ]
    :evision_nif.stitcher_setCompositingResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **interp_flags**: `InterpolationFlags`



  Python prototype (for reference): 
  ```python3
  setInterpolationFlags(interp_flags) -> None
  ```

  """
  @spec setInterpolationFlags(Evision.Stitcher.t(), integer()) :: :ok | {:error, String.t()}
  def setInterpolationFlags(self, interp_flags) when is_integer(interp_flags)
  do
    positional = [
      interp_flags: Evision.Internal.Structurise.from_struct(interp_flags)
    ]
    :evision_nif.stitcher_setInterpolationFlags(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **conf_thresh**: `double`



  Python prototype (for reference): 
  ```python3
  setPanoConfidenceThresh(conf_thresh) -> None
  ```

  """
  @spec setPanoConfidenceThresh(Evision.Stitcher.t(), number()) :: :ok | {:error, String.t()}
  def setPanoConfidenceThresh(self, conf_thresh) when is_number(conf_thresh)
  do
    positional = [
      conf_thresh: Evision.Internal.Structurise.from_struct(conf_thresh)
    ]
    :evision_nif.stitcher_setPanoConfidenceThresh(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **resol_mpx**: `double`



  Python prototype (for reference): 
  ```python3
  setRegistrationResol(resol_mpx) -> None
  ```

  """
  @spec setRegistrationResol(Evision.Stitcher.t(), number()) :: :ok | {:error, String.t()}
  def setRegistrationResol(self, resol_mpx) when is_number(resol_mpx)
  do
    positional = [
      resol_mpx: Evision.Internal.Structurise.from_struct(resol_mpx)
    ]
    :evision_nif.stitcher_setRegistrationResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **resol_mpx**: `double`



  Python prototype (for reference): 
  ```python3
  setSeamEstimationResol(resol_mpx) -> None
  ```

  """
  @spec setSeamEstimationResol(Evision.Stitcher.t(), number()) :: :ok | {:error, String.t()}
  def setSeamEstimationResol(self, resol_mpx) when is_number(resol_mpx)
  do
    positional = [
      resol_mpx: Evision.Internal.Structurise.from_struct(resol_mpx)
    ]
    :evision_nif.stitcher_setSeamEstimationResol(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **flag**: `bool`



  Python prototype (for reference): 
  ```python3
  setWaveCorrection(flag) -> None
  ```

  """
  @spec setWaveCorrection(Evision.Stitcher.t(), boolean()) :: :ok | {:error, String.t()}
  def setWaveCorrection(self, flag) when is_boolean(flag)
  do
    positional = [
      flag: Evision.Internal.Structurise.from_struct(flag)
    ]
    :evision_nif.stitcher_setWaveCorrection(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  These functions try to stitch the given images.

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.

  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).


  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

    Final pano.


  @return Status code.


  Python prototype (for reference): 
  ```python3
  stitch(images, masks[, pano]) -> retval, pano
  ```

  """
  @spec stitch(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def stitch(self, images, masks, opts) when is_list(images) and is_list(masks) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      masks: Evision.Internal.Structurise.from_struct(masks)
    ]
    :evision_nif.stitcher_stitch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  These functions try to stitch the given images.

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`.

    Input images.

  - **masks**: `[Evision.Mat]`.

    Masks for each input image specifying where to look for keypoints (optional).


  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

    Final pano.


  @return Status code.


  Python prototype (for reference): 
  ```python3
  stitch(images, masks[, pano]) -> retval, pano
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`

  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  stitch(images[, pano]) -> retval, pano
  ```


  """
  @spec stitch(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in()), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def stitch(self, images, opts) when is_list(images) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_stitch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec stitch(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in())) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def stitch(self, images, masks) when is_list(images) and is_list(masks)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images),
      masks: Evision.Internal.Structurise.from_struct(masks)
    ]
    :evision_nif.stitcher_stitch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **images**: `[Evision.Mat]`

  ##### Return
  - **retval**: `Status`
  - **pano**: `Evision.Mat`.

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  stitch(images[, pano]) -> retval, pano
  ```

  """
  @spec stitch(Evision.Stitcher.t(), list(Evision.Mat.maybe_mat_in())) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def stitch(self, images) when is_list(images)
  do
    positional = [
      images: Evision.Internal.Structurise.from_struct(images)
    ]
    :evision_nif.stitcher_stitch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  waveCorrection() -> retval
  ```

  """
  @spec waveCorrection(Evision.Stitcher.t()) :: boolean() | {:error, String.t()}
  def waveCorrection(self) do
    positional = [
    ]
    :evision_nif.stitcher_waveCorrection(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`


  Python prototype (for reference): 
  ```python3
  workScale() -> retval
  ```

  """
  @spec workScale(Evision.Stitcher.t()) :: number() | {:error, String.t()}
  def workScale(self) do
    positional = [
    ]
    :evision_nif.stitcher_workScale(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
