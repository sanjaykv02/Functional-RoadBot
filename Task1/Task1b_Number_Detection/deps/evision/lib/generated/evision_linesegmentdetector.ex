defmodule Evision.LineSegmentDetector do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.LineSegmentDetector` struct.

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
  def __to_struct__({:ok, %{class: :LineSegmentDetector, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :LineSegmentDetector, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Draws two groups of lines in blue and red, counting the non overlapping (mismatching) pixels.

  ##### Positional Arguments
  - **size**: `Size`.

    The size of the image, where lines1 and lines2 were found.

  - **lines1**: `Evision.Mat`.

    The first group of lines that needs to be drawn. It is visualized in blue color.

  - **lines2**: `Evision.Mat`.

    The second group of lines. They visualized in red color.


  ##### Return
  - **retval**: `int`
  - **image**: `Evision.Mat`.

    Optional image, where the lines will be drawn. The image should be color(3-channel)
    in order for lines1 and lines2 to be drawn in the above mentioned colors.




  Python prototype (for reference): 
  ```python3
  compareSegments(size, lines1, lines2[, image]) -> retval, image
  ```

  """
  @spec compareSegments(Evision.LineSegmentDetector.t(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def compareSegments(self, size, lines1, lines2, opts) when is_tuple(size) and (is_struct(lines1, Evision.Mat) or is_struct(lines1, Nx.Tensor)) and (is_struct(lines2, Evision.Mat) or is_struct(lines2, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      lines1: Evision.Internal.Structurise.from_struct(lines1),
      lines2: Evision.Internal.Structurise.from_struct(lines2)
    ]
    :evision_nif.lineSegmentDetector_compareSegments(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Draws two groups of lines in blue and red, counting the non overlapping (mismatching) pixels.

  ##### Positional Arguments
  - **size**: `Size`.

    The size of the image, where lines1 and lines2 were found.

  - **lines1**: `Evision.Mat`.

    The first group of lines that needs to be drawn. It is visualized in blue color.

  - **lines2**: `Evision.Mat`.

    The second group of lines. They visualized in red color.


  ##### Return
  - **retval**: `int`
  - **image**: `Evision.Mat`.

    Optional image, where the lines will be drawn. The image should be color(3-channel)
    in order for lines1 and lines2 to be drawn in the above mentioned colors.




  Python prototype (for reference): 
  ```python3
  compareSegments(size, lines1, lines2[, image]) -> retval, image
  ```

  """
  @spec compareSegments(Evision.LineSegmentDetector.t(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {integer(), Evision.Mat.t()} | {:error, String.t()}
  def compareSegments(self, size, lines1, lines2) when is_tuple(size) and (is_struct(lines1, Evision.Mat) or is_struct(lines1, Nx.Tensor)) and (is_struct(lines2, Evision.Mat) or is_struct(lines2, Nx.Tensor))
  do
    positional = [
      size: Evision.Internal.Structurise.from_struct(size),
      lines1: Evision.Internal.Structurise.from_struct(lines1),
      lines2: Evision.Internal.Structurise.from_struct(lines2)
    ]
    :evision_nif.lineSegmentDetector_compareSegments(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Finds lines in the input image.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    A grayscale (CV_8UC1) input image. If only a roi needs to be selected, use:
    `lsd_ptr-\\>detect(image(roi), lines, ...); lines += Scalar(roi.x, roi.y, roi.x, roi.y);`


  ##### Return
  - **lines**: `Evision.Mat`.

    A vector of Vec4f elements specifying the beginning and ending point of a line. Where
    Vec4f is (x1, y1, x2, y2), point 1 is the start, point 2 - end. Returned lines are strictly
    oriented depending on the gradient.

  - **width**: `Evision.Mat`.

    Vector of widths of the regions, where the lines are found. E.g. Width of line.

  - **prec**: `Evision.Mat`.

    Vector of precisions with which the lines are found.

  - **nfa**: `Evision.Mat`.

    Vector containing number of false alarms in the line region, with precision of 10%. The
    bigger the value, logarithmically better the detection.
    - -1 corresponds to 10 mean false alarms
    - 0 corresponds to 1 mean false alarm
    - 1 corresponds to 0.1 mean false alarms
      This vector will be calculated only when the objects type is #LSD_REFINE_ADV.


  This is the output of the default parameters of the algorithm on the above shown image.
  ![image](pics/building_lsd.png)


  Python prototype (for reference): 
  ```python3
  detect(image[, lines[, width[, prec[, nfa]]]]) -> lines, width, prec, nfa
  ```

  """
  @spec detect(Evision.LineSegmentDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image, opts) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.lineSegmentDetector_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Finds lines in the input image.

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    A grayscale (CV_8UC1) input image. If only a roi needs to be selected, use:
    `lsd_ptr-\\>detect(image(roi), lines, ...); lines += Scalar(roi.x, roi.y, roi.x, roi.y);`


  ##### Return
  - **lines**: `Evision.Mat`.

    A vector of Vec4f elements specifying the beginning and ending point of a line. Where
    Vec4f is (x1, y1, x2, y2), point 1 is the start, point 2 - end. Returned lines are strictly
    oriented depending on the gradient.

  - **width**: `Evision.Mat`.

    Vector of widths of the regions, where the lines are found. E.g. Width of line.

  - **prec**: `Evision.Mat`.

    Vector of precisions with which the lines are found.

  - **nfa**: `Evision.Mat`.

    Vector containing number of false alarms in the line region, with precision of 10%. The
    bigger the value, logarithmically better the detection.
    - -1 corresponds to 10 mean false alarms
    - 0 corresponds to 1 mean false alarm
    - 1 corresponds to 0.1 mean false alarms
      This vector will be calculated only when the objects type is #LSD_REFINE_ADV.


  This is the output of the default parameters of the algorithm on the above shown image.
  ![image](pics/building_lsd.png)


  Python prototype (for reference): 
  ```python3
  detect(image[, lines[, width[, prec[, nfa]]]]) -> lines, width, prec, nfa
  ```

  """
  @spec detect(Evision.LineSegmentDetector.t(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detect(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.lineSegmentDetector_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Draws the line segments on a given image.

  ##### Positional Arguments
  - **lines**: `Evision.Mat`.

    A vector of the lines that needed to be drawn.


  ##### Return
  - **image**: `Evision.Mat`.

    The image, where the lines will be drawn. Should be bigger or equal to the image,
    where the lines were found.




  Python prototype (for reference): 
  ```python3
  drawSegments(image, lines) -> image
  ```

  """
  @spec drawSegments(Evision.LineSegmentDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def drawSegments(self, image, lines) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor)) and (is_struct(lines, Evision.Mat) or is_struct(lines, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image),
      lines: Evision.Internal.Structurise.from_struct(lines)
    ]
    :evision_nif.lineSegmentDetector_drawSegments(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
