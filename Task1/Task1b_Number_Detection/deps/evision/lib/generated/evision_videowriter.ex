defmodule Evision.VideoWriter do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.VideoWriter` struct.

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
  def __to_struct__({:ok, %{class: :VideoWriter, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :VideoWriter, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`
  - **params**: `[int]`

  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, apiPreference, fourcc, fps, frameSize, params) -> <VideoWriter object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++

  The `apiPreference` parameter allows to specify API backends to use. Can be used to enforce a specific reader implementation
  if multiple are available: e.g. cv::CAP_FFMPEG or cv::CAP_GSTREAMER.


  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, apiPreference, fourcc, fps, frameSize[, isColor]) -> <VideoWriter object>
  ```


  """
  @spec videoWriter(binary(), integer(), integer(), number(), {number(), number()}, [{atom(), term()},...] | nil) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, apiPreference, fourcc, fps, frameSize, opts) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_VideoWriter(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec videoWriter(binary(), integer(), integer(), number(), {number(), number()}, list(integer())) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, apiPreference, fourcc, fps, frameSize, params) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and is_list(params)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.videoWriter_VideoWriter(positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`
  - **params**: `[int]`

  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++

   The `params` parameter allows to specify extra encoder parameters encoded as pairs (paramId_1, paramValue_1, paramId_2, paramValue_2, ... .)
   see cv::VideoWriterProperties

  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, fourcc, fps, frameSize, params) -> <VideoWriter object>
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++

  The `apiPreference` parameter allows to specify API backends to use. Can be used to enforce a specific reader implementation
  if multiple are available: e.g. cv::CAP_FFMPEG or cv::CAP_GSTREAMER.


  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, apiPreference, fourcc, fps, frameSize[, isColor]) -> <VideoWriter object>
  ```

  #### Variant 3:
  

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the output video file.

  - **fourcc**: `int`.

    4-character code of codec used to compress the frames. For example,
    VideoWriter::fourcc('P','I','M','1') is a MPEG-1 codec, VideoWriter::fourcc('M','J','P','G') is a
    motion-jpeg codec etc. List of codes can be obtained at [Video Codecs by
    FOURCC](http://www.fourcc.org/codecs.php) page. FFMPEG backend with MP4 container natively uses
    other values as fourcc code: see [ObjectType](http://mp4ra.org/#/codecs),
    so you may receive a warning message from OpenCV about fourcc code conversion.

  - **fps**: `double`.

    Framerate of the created video stream.

  - **frameSize**: `Size`.

    Size of the video frames.


  ##### Keyword Arguments
  - **isColor**: `bool`.

    If it is not zero, the encoder will expect and encode color frames, otherwise it
    will work with grayscale frames.


  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++


  @b Tips:
  - With some backends `fourcc=-1` pops up the codec selection dialog from the system.
  - To save image sequence use a proper filename (eg. `img_%02d.jpg`) and `fourcc=0`
    OR `fps=0`. Use uncompressed image format (eg. `img_%02d.BMP`) to save raw frames.

  - Most codecs are lossy. If you want lossless video file you need to use a lossless codecs
    (eg. FFMPEG FFV1, Huffman HFYU, Lagarith LAGS, etc...)

  - If FFMPEG is enabled, using `codec=0; fps=0;` you can create an uncompressed (raw) video file.


  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, fourcc, fps, frameSize[, isColor]) -> <VideoWriter object>
  ```


  """
  @spec videoWriter(binary(), integer(), number(), {number(), number()}, [{atom(), term()},...] | nil) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, fourcc, fps, frameSize, opts) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_VideoWriter(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec videoWriter(binary(), integer(), number(), {number(), number()}, list(integer())) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, fourcc, fps, frameSize, params) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and is_list(params)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.videoWriter_VideoWriter(positional)
    |> __to_struct__()
  end
  @spec videoWriter(binary(), integer(), integer(), number(), {number(), number()}) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, apiPreference, fourcc, fps, frameSize) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_VideoWriter(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **filename**: `String`.

    Name of the output video file.

  - **fourcc**: `int`.

    4-character code of codec used to compress the frames. For example,
    VideoWriter::fourcc('P','I','M','1') is a MPEG-1 codec, VideoWriter::fourcc('M','J','P','G') is a
    motion-jpeg codec etc. List of codes can be obtained at [Video Codecs by
    FOURCC](http://www.fourcc.org/codecs.php) page. FFMPEG backend with MP4 container natively uses
    other values as fourcc code: see [ObjectType](http://mp4ra.org/#/codecs),
    so you may receive a warning message from OpenCV about fourcc code conversion.

  - **fps**: `double`.

    Framerate of the created video stream.

  - **frameSize**: `Size`.

    Size of the video frames.


  ##### Keyword Arguments
  - **isColor**: `bool`.

    If it is not zero, the encoder will expect and encode color frames, otherwise it
    will work with grayscale frames.


  ##### Return
  - **self**: `Evision.VideoWriter`

  Has overloading in C++


  @b Tips:
  - With some backends `fourcc=-1` pops up the codec selection dialog from the system.
  - To save image sequence use a proper filename (eg. `img_%02d.jpg`) and `fourcc=0`
    OR `fps=0`. Use uncompressed image format (eg. `img_%02d.BMP`) to save raw frames.

  - Most codecs are lossy. If you want lossless video file you need to use a lossless codecs
    (eg. FFMPEG FFV1, Huffman HFYU, Lagarith LAGS, etc...)

  - If FFMPEG is enabled, using `codec=0; fps=0;` you can create an uncompressed (raw) video file.


  Python prototype (for reference): 
  ```python3
  VideoWriter(filename, fourcc, fps, frameSize[, isColor]) -> <VideoWriter object>
  ```

  """
  @spec videoWriter(binary(), integer(), number(), {number(), number()}) :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter(filename, fourcc, fps, frameSize) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_VideoWriter(positional)
    |> __to_struct__()
  end

  @doc """
  Default constructors
  ##### Return
  - **self**: `Evision.VideoWriter`

  The constructors/functions initialize video writers.
  - On Linux FFMPEG is used to write videos;
  - On Windows FFMPEG or MSWF or DSHOW is used;
  - On MacOSX AVFoundation is used.


  Python prototype (for reference): 
  ```python3
  VideoWriter() -> <VideoWriter object>
  ```

  """
  @spec videoWriter() :: Evision.VideoWriter.t() | {:error, String.t()}
  def videoWriter() do
    positional = [
    ]
    :evision_nif.videoWriter_VideoWriter(positional)
    |> __to_struct__()
  end

  @doc """
  Concatenates 4 chars to a fourcc code

  ##### Positional Arguments
  - **c1**: `char`
  - **c2**: `char`
  - **c3**: `char`
  - **c4**: `char`

  ##### Return
  - **retval**: `int`

  @return a fourcc code
  This static method constructs the fourcc code of the codec to be used in the constructor
  VideoWriter::VideoWriter or VideoWriter::open.

  Python prototype (for reference): 
  ```python3
  fourcc(c1, c2, c3, c4) -> retval
  ```

  """
  @spec fourcc(char(), char(), char(), char()) :: integer() | {:error, String.t()}
  def fourcc(c1, c2, c3, c4) when (-128 <= c1 and c1 <= 127) and (-128 <= c2 and c2 <= 127) and (-128 <= c3 and c3 <= 127) and (-128 <= c4 and c4 <= 127)
  do
    positional = [
      c1: Evision.Internal.Structurise.from_struct(c1),
      c2: Evision.Internal.Structurise.from_struct(c2),
      c3: Evision.Internal.Structurise.from_struct(c3),
      c4: Evision.Internal.Structurise.from_struct(c4)
    ]
    :evision_nif.videoWriter_fourcc_static(positional)
    |> __to_struct__()
  end

  @doc """
  Returns the specified VideoWriter property

  ##### Positional Arguments
  - **propId**: `int`.

    Property identifier from cv::VideoWriterProperties (eg. cv::VIDEOWRITER_PROP_QUALITY)
    or one of @ref videoio_flags_others


  ##### Return
  - **retval**: `double`


  @return Value for the specified property. Value 0 is returned when querying a property that is
  not supported by the backend used by the VideoWriter instance.

  Python prototype (for reference): 
  ```python3
  get(propId) -> retval
  ```

  """
  @spec get(Evision.VideoWriter.t(), integer()) :: number() | {:error, String.t()}
  def get(self, propId) when is_integer(propId)
  do
    positional = [
      propId: Evision.Internal.Structurise.from_struct(propId)
    ]
    :evision_nif.videoWriter_get(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns used backend API name
  ##### Return
  - **retval**: `String`

  **Note**: Stream should be opened.

  Python prototype (for reference): 
  ```python3
  getBackendName() -> retval
  ```

  """
  @spec getBackendName(Evision.VideoWriter.t()) :: binary() | {:error, String.t()}
  def getBackendName(self) do
    positional = [
    ]
    :evision_nif.videoWriter_getBackendName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if video writer has been successfully initialized.
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isOpened() -> retval
  ```

  """
  @spec isOpened(Evision.VideoWriter.t()) :: boolean() | {:error, String.t()}
  def isOpened(self) do
    positional = [
    ]
    :evision_nif.videoWriter_isOpened(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`
  - **params**: `[int]`

  ##### Return
  - **retval**: `bool`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  open(filename, apiPreference, fourcc, fps, frameSize, params) -> retval
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **retval**: `bool`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  open(filename, apiPreference, fourcc, fps, frameSize[, isColor]) -> retval
  ```


  """
  @spec open(Evision.VideoWriter.t(), binary(), integer(), integer(), number(), {number(), number()}, [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def open(self, filename, apiPreference, fourcc, fps, frameSize, opts) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec open(Evision.VideoWriter.t(), binary(), integer(), integer(), number(), {number(), number()}, list(integer())) :: boolean() | {:error, String.t()}
  def open(self, filename, apiPreference, fourcc, fps, frameSize, params) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and is_list(params)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`
  - **params**: `[int]`

  ##### Return
  - **retval**: `bool`

  Has overloading in C++


  Python prototype (for reference): 
  ```python3
  open(filename, fourcc, fps, frameSize, params) -> retval
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **filename**: `String`
  - **apiPreference**: `int`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **retval**: `bool`

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  open(filename, apiPreference, fourcc, fps, frameSize[, isColor]) -> retval
  ```

  #### Variant 3:
  Initializes or reinitializes video writer.

  ##### Positional Arguments
  - **filename**: `String`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **retval**: `bool`

  The method opens video writer. Parameters are the same as in the constructor
  VideoWriter::VideoWriter.
  @return `true` if video writer has been successfully initialized
  The method first calls VideoWriter::release to close the already opened file.


  Python prototype (for reference): 
  ```python3
  open(filename, fourcc, fps, frameSize[, isColor]) -> retval
  ```


  """
  @spec open(Evision.VideoWriter.t(), binary(), integer(), number(), {number(), number()}, [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def open(self, filename, fourcc, fps, frameSize, opts) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec open(Evision.VideoWriter.t(), binary(), integer(), number(), {number(), number()}, list(integer())) :: boolean() | {:error, String.t()}
  def open(self, filename, fourcc, fps, frameSize, params) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize) and is_list(params)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize),
      params: Evision.Internal.Structurise.from_struct(params)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec open(Evision.VideoWriter.t(), binary(), integer(), integer(), number(), {number(), number()}) :: boolean() | {:error, String.t()}
  def open(self, filename, apiPreference, fourcc, fps, frameSize) when is_binary(filename) and is_integer(apiPreference) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      apiPreference: Evision.Internal.Structurise.from_struct(apiPreference),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Initializes or reinitializes video writer.

  ##### Positional Arguments
  - **filename**: `String`
  - **fourcc**: `int`
  - **fps**: `double`
  - **frameSize**: `Size`

  ##### Keyword Arguments
  - **isColor**: `bool`.

  ##### Return
  - **retval**: `bool`

  The method opens video writer. Parameters are the same as in the constructor
  VideoWriter::VideoWriter.
  @return `true` if video writer has been successfully initialized
  The method first calls VideoWriter::release to close the already opened file.


  Python prototype (for reference): 
  ```python3
  open(filename, fourcc, fps, frameSize[, isColor]) -> retval
  ```

  """
  @spec open(Evision.VideoWriter.t(), binary(), integer(), number(), {number(), number()}) :: boolean() | {:error, String.t()}
  def open(self, filename, fourcc, fps, frameSize) when is_binary(filename) and is_integer(fourcc) and is_number(fps) and is_tuple(frameSize)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename),
      fourcc: Evision.Internal.Structurise.from_struct(fourcc),
      fps: Evision.Internal.Structurise.from_struct(fps),
      frameSize: Evision.Internal.Structurise.from_struct(frameSize)
    ]
    :evision_nif.videoWriter_open(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Closes the video writer.

  The method is automatically called by subsequent VideoWriter::open and by the VideoWriter
  destructor.

  Python prototype (for reference): 
  ```python3
  release() -> None
  ```

  """
  @spec release(Evision.VideoWriter.t()) :: :ok | {:error, String.t()}
  def release(self) do
    positional = [
    ]
    :evision_nif.videoWriter_release(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Sets a property in the VideoWriter.

  ##### Positional Arguments
  - **propId**: `int`.

    Property identifier from cv::VideoWriterProperties (eg. cv::VIDEOWRITER_PROP_QUALITY)
    or one of @ref videoio_flags_others

  - **value**: `double`.

    Value of the property.


  ##### Return
  - **retval**: `bool`


  @return  `true` if the property is supported by the backend used by the VideoWriter instance.

  Python prototype (for reference): 
  ```python3
  set(propId, value) -> retval
  ```

  """
  @spec set(Evision.VideoWriter.t(), integer(), number()) :: boolean() | {:error, String.t()}
  def set(self, propId, value) when is_integer(propId) and is_number(value)
  do
    positional = [
      propId: Evision.Internal.Structurise.from_struct(propId),
      value: Evision.Internal.Structurise.from_struct(value)
    ]
    :evision_nif.videoWriter_set(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Writes the next video frame

  ##### Positional Arguments
  - **image**: `Evision.Mat`.

    The written frame. In general, color images are expected in BGR format.




  The function/method writes the specified image to video file. It must have the same size as has
  been specified when opening the video writer.

  Python prototype (for reference): 
  ```python3
  write(image) -> None
  ```

  """
  @spec write(Evision.VideoWriter.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def write(self, image) when (is_struct(image, Evision.Mat) or is_struct(image, Nx.Tensor))
  do
    positional = [
      image: Evision.Internal.Structurise.from_struct(image)
    ]
    :evision_nif.videoWriter_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
