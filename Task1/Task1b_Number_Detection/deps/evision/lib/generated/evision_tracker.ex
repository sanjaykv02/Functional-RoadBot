defmodule Evision.Tracker do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.Tracker` struct.

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
  def __to_struct__({:ok, %{class: :Tracker, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :Tracker, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Initialize the tracker with a known bounding box that surrounded the target

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    The initial frame

  - **boundingBox**: `Rect`.

    The initial bounding box





  Python prototype (for reference): 
  ```python3
  init(image, boundingBox) -> None
  ```

  """
  @spec init(Evision.Tracker.t(), Evision.Mat.maybe_mat_in(), {number(), number(), number(), number()}) :: :ok | {:error, String.t()}
  def init(self, image, boundingBox) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and is_tuple(boundingBox)
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      boundingBox: Evision.Internal.Structurise.from_struct(boundingBox)
    ]
    :evision_nif.tracker_init(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Update the tracker, find the new most likely bounding box for the target

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    The current frame


  ##### Return
  - **retval**: `bool`
  - **boundingBox**: `Rect`.

    The bounding box that represent the new target location, if true was returned, not
    modified otherwise



  @return True means that target was located and false means that tracker cannot locate target in
  current frame. Note, that latter *does not* imply that tracker has failed, maybe target is indeed
  missing from the frame (say, out of sight)

  Python prototype (for reference): 
  ```python3
  update(image) -> retval, boundingBox
  ```

  """
  @spec update(Evision.Tracker.t(), Evision.Mat.maybe_mat_in()) :: {number(), number(), number(), number()} | false | {:error, String.t()}
  def update(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.tracker_update(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
