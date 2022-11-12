defmodule Evision.QRCodeEncoder do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.QRCodeEncoder` struct.

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
  def __to_struct__({:ok, %{class: :QRCodeEncoder, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :QRCodeEncoder, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Constructor
  ##### Keyword Arguments
  - **parameters**: `Evision.QRCodeEncoder.Params`.

    QR code encoder parameters QRCodeEncoder::Params


  ##### Return
  - **retval**: `Evision.QRCodeEncoder`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.QRCodeEncoder.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.qrCodeEncoder_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Constructor
  ##### Keyword Arguments
  - **parameters**: `Evision.QRCodeEncoder.Params`.

    QR code encoder parameters QRCodeEncoder::Params


  ##### Return
  - **retval**: `Evision.QRCodeEncoder`



  Python prototype (for reference): 
  ```python3
  create([, parameters]) -> retval
  ```

  """
  @spec create() :: Evision.QRCodeEncoder.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.qrCodeEncoder_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Generates QR code from input string.

  ##### Positional Arguments
  - **encoded_info**: `String`.

    Input string to encode.


  ##### Return
  - **qrcode**: `Evision.Mat`.

    Generated QR code.




  Python prototype (for reference): 
  ```python3
  encode(encoded_info[, qrcode]) -> qrcode
  ```

  """
  @spec encode(Evision.QRCodeEncoder.t(), binary(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def encode(self, encoded_info, opts) when is_binary(encoded_info) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      encoded_info: Evision.Internal.Structurise.from_struct(encoded_info)
    ]
    :evision_nif.qrCodeEncoder_encode(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Generates QR code from input string.

  ##### Positional Arguments
  - **encoded_info**: `String`.

    Input string to encode.


  ##### Return
  - **qrcode**: `Evision.Mat`.

    Generated QR code.




  Python prototype (for reference): 
  ```python3
  encode(encoded_info[, qrcode]) -> qrcode
  ```

  """
  @spec encode(Evision.QRCodeEncoder.t(), binary()) :: Evision.Mat.t() | {:error, String.t()}
  def encode(self, encoded_info) when is_binary(encoded_info)
  do
    positional = [
      encoded_info: Evision.Internal.Structurise.from_struct(encoded_info)
    ]
    :evision_nif.qrCodeEncoder_encode(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Generates QR code from input string in Structured Append mode. The encoded message is splitting over a number of QR codes.

  ##### Positional Arguments
  - **encoded_info**: `String`.

    Input string to encode.


  ##### Return
  - **qrcodes**: `[Evision.Mat]`.

    Vector of generated QR codes.




  Python prototype (for reference): 
  ```python3
  encodeStructuredAppend(encoded_info[, qrcodes]) -> qrcodes
  ```

  """
  @spec encodeStructuredAppend(Evision.QRCodeEncoder.t(), binary(), [{atom(), term()},...] | nil) :: list(Evision.Mat.t()) | {:error, String.t()}
  def encodeStructuredAppend(self, encoded_info, opts) when is_binary(encoded_info) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      encoded_info: Evision.Internal.Structurise.from_struct(encoded_info)
    ]
    :evision_nif.qrCodeEncoder_encodeStructuredAppend(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Generates QR code from input string in Structured Append mode. The encoded message is splitting over a number of QR codes.

  ##### Positional Arguments
  - **encoded_info**: `String`.

    Input string to encode.


  ##### Return
  - **qrcodes**: `[Evision.Mat]`.

    Vector of generated QR codes.




  Python prototype (for reference): 
  ```python3
  encodeStructuredAppend(encoded_info[, qrcodes]) -> qrcodes
  ```

  """
  @spec encodeStructuredAppend(Evision.QRCodeEncoder.t(), binary()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def encodeStructuredAppend(self, encoded_info) when is_binary(encoded_info)
  do
    positional = [
      encoded_info: Evision.Internal.Structurise.from_struct(encoded_info)
    ]
    :evision_nif.qrCodeEncoder_encodeStructuredAppend(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
