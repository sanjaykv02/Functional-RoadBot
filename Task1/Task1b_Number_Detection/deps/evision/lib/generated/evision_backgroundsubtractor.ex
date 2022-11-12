defmodule Evision.BackgroundSubtractor do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BackgroundSubtractor` struct.

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
  def __to_struct__({:ok, %{class: :BackgroundSubtractor, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BackgroundSubtractor, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Computes a foreground mask.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Next video frame.


  ##### Keyword Arguments
  - **learningRate**: `double`.

    The value between 0 and 1 that indicates how fast the background model is
    learnt. Negative parameter value makes the algorithm to use some automatically chosen learning
    rate. 0 means that the background model is not updated at all, 1 means that the background model
    is completely reinitialized from the last frame.


  ##### Return
  - **fgmask**: `Evision.Mat`.

    The output foreground mask as an 8-bit binary image.




  Python prototype (for reference): 
  ```python3
  apply(image[, fgmask[, learningRate]]) -> fgmask
  ```

  """
  @spec apply(Evision.BackgroundSubtractor.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.backgroundSubtractor_apply(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes a foreground mask.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    Next video frame.


  ##### Keyword Arguments
  - **learningRate**: `double`.

    The value between 0 and 1 that indicates how fast the background model is
    learnt. Negative parameter value makes the algorithm to use some automatically chosen learning
    rate. 0 means that the background model is not updated at all, 1 means that the background model
    is completely reinitialized from the last frame.


  ##### Return
  - **fgmask**: `Evision.Mat`.

    The output foreground mask as an 8-bit binary image.




  Python prototype (for reference): 
  ```python3
  apply(image[, fgmask[, learningRate]]) -> fgmask
  ```

  """
  @spec apply(Evision.BackgroundSubtractor.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def apply(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.backgroundSubtractor_apply(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Computes a background image.
  ##### Return
  - **backgroundImage**: `Evision.Mat`.

    The output background image.



  **Note**: Sometimes the background image can be very blurry, as it contain the average background
  statistics.


  Python prototype (for reference): 
  ```python3
  getBackgroundImage([, backgroundImage]) -> backgroundImage
  ```

  """
  @spec getBackgroundImage(Evision.BackgroundSubtractor.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getBackgroundImage(self) do
    positional = [
    ]
    :evision_nif.backgroundSubtractor_getBackgroundImage(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
