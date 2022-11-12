defmodule Evision.QRCodeDetector do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.QRCodeDetector` struct.

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
  def __to_struct__({:ok, %{class: :QRCodeDetector, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :QRCodeDetector, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.QRCodeDetector`


  Python prototype (for reference): 
  ```python3
  QRCodeDetector() -> <QRCodeDetector object>
  ```

  """
  @spec qrCodeDetector() :: Evision.QRCodeDetector.t() | {:error, String.t()}
  def qrCodeDetector() do
    positional = [
    ]
    :evision_nif.qrCodeDetector_QRCodeDetector(positional)
    |> __to_struct__()
  end

  @doc """
  Decodes QR code in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.

  - **points**: `Evision.Mat`.

    Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `String`
  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code


  Returns UTF8-encoded output string or empty string if the code cannot be decoded.


  Python prototype (for reference): 
  ```python3
  decode(img, points[, straight_qrcode]) -> retval, straight_qrcode
  ```

  """
  @spec decode(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {binary(), Evision.Mat.t()} | {:error, String.t()}
  def decode(self, img, points, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decode(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Decodes QR code in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.

  - **points**: `Evision.Mat`.

    Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `String`
  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code


  Returns UTF8-encoded output string or empty string if the code cannot be decoded.


  Python prototype (for reference): 
  ```python3
  decode(img, points[, straight_qrcode]) -> retval, straight_qrcode
  ```

  """
  @spec decode(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {binary(), Evision.Mat.t()} | {:error, String.t()}
  def decode(self, img, points) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Decodes QR code on a curved surface in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.

  - **points**: `Evision.Mat`.

    Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `String`
  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code


  Returns UTF8-encoded output string or empty string if the code cannot be decoded.


  Python prototype (for reference): 
  ```python3
  decodeCurved(img, points[, straight_qrcode]) -> retval, straight_qrcode
  ```

  """
  @spec decodeCurved(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {binary(), Evision.Mat.t()} | {:error, String.t()}
  def decodeCurved(self, img, points, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decodeCurved(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Decodes QR code on a curved surface in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.

  - **points**: `Evision.Mat`.

    Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `String`
  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code


  Returns UTF8-encoded output string or empty string if the code cannot be decoded.


  Python prototype (for reference): 
  ```python3
  decodeCurved(img, points[, straight_qrcode]) -> retval, straight_qrcode
  ```

  """
  @spec decodeCurved(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {binary(), Evision.Mat.t()} | {:error, String.t()}
  def decodeCurved(self, img, points) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decodeCurved(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Decodes QR codes in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR codes.

  - **points**: `Evision.Mat`.

    vector of Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `bool`
  - **decoded_info**: `[string]`.

    UTF8-encoded output vector of string or empty vector of string if the codes cannot be decoded.

  - **straight_qrcode**: `[Evision.Mat]`.

    The optional output vector of images containing rectified and binarized QR codes




  Python prototype (for reference): 
  ```python3
  decodeMulti(img, points[, straight_qrcode]) -> retval, decoded_info, straight_qrcode
  ```

  """
  @spec decodeMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(binary()), list(Evision.Mat.t())} | false | {:error, String.t()}
  def decodeMulti(self, img, points, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decodeMulti(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Decodes QR codes in image once it's found by the detect() method.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR codes.

  - **points**: `Evision.Mat`.

    vector of Quadrangle vertices found by detect() method (or some other algorithm).


  ##### Return
  - **retval**: `bool`
  - **decoded_info**: `[string]`.

    UTF8-encoded output vector of string or empty vector of string if the codes cannot be decoded.

  - **straight_qrcode**: `[Evision.Mat]`.

    The optional output vector of images containing rectified and binarized QR codes




  Python prototype (for reference): 
  ```python3
  decodeMulti(img, points[, straight_qrcode]) -> retval, decoded_info, straight_qrcode
  ```

  """
  @spec decodeMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {list(binary()), list(Evision.Mat.t())} | false | {:error, String.t()}
  def decodeMulti(self, img, points) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (is_struct(points, Evision.Mat) or is_struct(points, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img),
      points: Evision.Internal.Structurise.from_struct(points)
    ]
    :evision_nif.qrCodeDetector_decodeMulti(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Detects QR code in image and returns the quadrangle containing the code.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing (or not) QR code.


  ##### Return
  - **retval**: `bool`
  - **points**: `Evision.Mat`.

    Output vector of vertices of the minimum-area quadrangle containing the code.




  Python prototype (for reference): 
  ```python3
  detect(img[, points]) -> retval, points
  ```

  """
  @spec detect(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | false | {:error, String.t()}
  def detect(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detect(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Detects QR code in image and returns the quadrangle containing the code.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing (or not) QR code.


  ##### Return
  - **retval**: `bool`
  - **points**: `Evision.Mat`.

    Output vector of vertices of the minimum-area quadrangle containing the code.




  Python prototype (for reference): 
  ```python3
  detect(img[, points]) -> retval, points
  ```

  """
  @spec detect(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | false | {:error, String.t()}
  def detect(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detect(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR code

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.


  ##### Return
  - **retval**: `String`
  - **points**: `Evision.Mat`.

    optional output array of vertices of the found QR code quadrangle. Will be empty if not found.

  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code




  Python prototype (for reference): 
  ```python3
  detectAndDecode(img[, points[, straight_qrcode]]) -> retval, points, straight_qrcode
  ```

  """
  @spec detectAndDecode(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {binary(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detectAndDecode(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecode(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR code

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.


  ##### Return
  - **retval**: `String`
  - **points**: `Evision.Mat`.

    optional output array of vertices of the found QR code quadrangle. Will be empty if not found.

  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code




  Python prototype (for reference): 
  ```python3
  detectAndDecode(img[, points[, straight_qrcode]]) -> retval, points, straight_qrcode
  ```

  """
  @spec detectAndDecode(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in()) :: {binary(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detectAndDecode(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR code on a curved surface

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.


  ##### Return
  - **retval**: `String`
  - **points**: `Evision.Mat`.

    optional output array of vertices of the found QR code quadrangle. Will be empty if not found.

  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code




  Python prototype (for reference): 
  ```python3
  detectAndDecodeCurved(img[, points[, straight_qrcode]]) -> retval, points, straight_qrcode
  ```

  """
  @spec detectAndDecodeCurved(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {binary(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detectAndDecodeCurved(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecodeCurved(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR code on a curved surface

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR code.


  ##### Return
  - **retval**: `String`
  - **points**: `Evision.Mat`.

    optional output array of vertices of the found QR code quadrangle. Will be empty if not found.

  - **straight_qrcode**: `Evision.Mat`.

    The optional output image containing rectified and binarized QR code




  Python prototype (for reference): 
  ```python3
  detectAndDecodeCurved(img[, points[, straight_qrcode]]) -> retval, points, straight_qrcode
  ```

  """
  @spec detectAndDecodeCurved(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in()) :: {binary(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def detectAndDecodeCurved(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecodeCurved(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR codes

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR codes.


  ##### Return
  - **retval**: `bool`
  - **decoded_info**: `[string]`.

    UTF8-encoded output vector of string or empty vector of string if the codes cannot be decoded.

  - **points**: `Evision.Mat`.

    optional output vector of vertices of the found QR code quadrangles. Will be empty if not found.

  - **straight_qrcode**: `[Evision.Mat]`.

    The optional output vector of images containing rectified and binarized QR codes




  Python prototype (for reference): 
  ```python3
  detectAndDecodeMulti(img[, points[, straight_qrcode]]) -> retval, decoded_info, points, straight_qrcode
  ```

  """
  @spec detectAndDecodeMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {list(binary()), Evision.Mat.t(), list(Evision.Mat.t())} | false | {:error, String.t()}
  def detectAndDecodeMulti(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecodeMulti(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Both detects and decodes QR codes

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing QR codes.


  ##### Return
  - **retval**: `bool`
  - **decoded_info**: `[string]`.

    UTF8-encoded output vector of string or empty vector of string if the codes cannot be decoded.

  - **points**: `Evision.Mat`.

    optional output vector of vertices of the found QR code quadrangles. Will be empty if not found.

  - **straight_qrcode**: `[Evision.Mat]`.

    The optional output vector of images containing rectified and binarized QR codes




  Python prototype (for reference): 
  ```python3
  detectAndDecodeMulti(img[, points[, straight_qrcode]]) -> retval, decoded_info, points, straight_qrcode
  ```

  """
  @spec detectAndDecodeMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in()) :: {list(binary()), Evision.Mat.t(), list(Evision.Mat.t())} | false | {:error, String.t()}
  def detectAndDecodeMulti(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectAndDecodeMulti(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Detects QR codes in image and returns the vector of the quadrangles containing the codes.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing (or not) QR codes.


  ##### Return
  - **retval**: `bool`
  - **points**: `Evision.Mat`.

    Output vector of vector of vertices of the minimum-area quadrangle containing the codes.




  Python prototype (for reference): 
  ```python3
  detectMulti(img[, points]) -> retval, points
  ```

  """
  @spec detectMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | false | {:error, String.t()}
  def detectMulti(self, img, opts) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectMulti(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Detects QR codes in image and returns the vector of the quadrangles containing the codes.

  ##### Positional Arguments
  - **img**: `Evision.Mat`.

    grayscale or color (BGR) image containing (or not) QR codes.


  ##### Return
  - **retval**: `bool`
  - **points**: `Evision.Mat`.

    Output vector of vector of vertices of the minimum-area quadrangle containing the codes.




  Python prototype (for reference): 
  ```python3
  detectMulti(img[, points]) -> retval, points
  ```

  """
  @spec detectMulti(Evision.QRCodeDetector.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | false | {:error, String.t()}
  def detectMulti(self, img) when (is_struct(img, Evision.Mat) or is_struct(img, Nx.Tensor))
  do
    positional = [
      img: Evision.Internal.Structurise.from_struct(img)
    ]
    :evision_nif.qrCodeDetector_detectMulti(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  sets the epsilon used during the horizontal scan of QR code stop marker detection.

  ##### Positional Arguments
  - **epsX**: `double`.

    Epsilon neighborhood, which allows you to determine the horizontal pattern
    of the scheme 1:1:3:1:1 according to QR code standard.





  Python prototype (for reference): 
  ```python3
  setEpsX(epsX) -> None
  ```

  """
  @spec setEpsX(Evision.QRCodeDetector.t(), number()) :: :ok | {:error, String.t()}
  def setEpsX(self, epsX) when is_number(epsX)
  do
    positional = [
      epsX: Evision.Internal.Structurise.from_struct(epsX)
    ]
    :evision_nif.qrCodeDetector_setEpsX(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  sets the epsilon used during the vertical scan of QR code stop marker detection.

  ##### Positional Arguments
  - **epsY**: `double`.

    Epsilon neighborhood, which allows you to determine the vertical pattern
    of the scheme 1:1:3:1:1 according to QR code standard.





  Python prototype (for reference): 
  ```python3
  setEpsY(epsY) -> None
  ```

  """
  @spec setEpsY(Evision.QRCodeDetector.t(), number()) :: :ok | {:error, String.t()}
  def setEpsY(self, epsY) when is_number(epsY)
  do
    positional = [
      epsY: Evision.Internal.Structurise.from_struct(epsY)
    ]
    :evision_nif.qrCodeDetector_setEpsY(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
