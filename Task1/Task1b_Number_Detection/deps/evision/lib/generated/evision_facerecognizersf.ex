defmodule Evision.FaceRecognizerSF do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.FaceRecognizerSF` struct.

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
  def __to_struct__({:ok, %{class: :FaceRecognizerSF, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :FaceRecognizerSF, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Aligning image to put face on the standard position

  ##### Positional Arguments
  - **src_img**: `Evision.Mat`.

    input image

  - **face_box**: `Evision.Mat`.

    the detection result used for indicate face in input image


  ##### Return
  - **aligned_img**: `Evision.Mat`.

    output aligned image




  Python prototype (for reference): 
  ```python3
  alignCrop(src_img, face_box[, aligned_img]) -> aligned_img
  ```

  """
  @spec alignCrop(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def alignCrop(self, src_img, face_box, opts) when (is_struct(src_img, Evision.Mat) or is_struct(src_img, Nx.Tensor)) and (is_struct(face_box, Evision.Mat) or is_struct(face_box, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      src_img: Evision.Internal.Structurise.from_struct(src_img),
      face_box: Evision.Internal.Structurise.from_struct(face_box)
    ]
    :evision_nif.faceRecognizerSF_alignCrop(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Aligning image to put face on the standard position

  ##### Positional Arguments
  - **src_img**: `Evision.Mat`.

    input image

  - **face_box**: `Evision.Mat`.

    the detection result used for indicate face in input image


  ##### Return
  - **aligned_img**: `Evision.Mat`.

    output aligned image




  Python prototype (for reference): 
  ```python3
  alignCrop(src_img, face_box[, aligned_img]) -> aligned_img
  ```

  """
  @spec alignCrop(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def alignCrop(self, src_img, face_box) when (is_struct(src_img, Evision.Mat) or is_struct(src_img, Nx.Tensor)) and (is_struct(face_box, Evision.Mat) or is_struct(face_box, Nx.Tensor))
  do
    positional = [
      src_img: Evision.Internal.Structurise.from_struct(src_img),
      face_box: Evision.Internal.Structurise.from_struct(face_box)
    ]
    :evision_nif.faceRecognizerSF_alignCrop(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Creates an instance of this class with given parameters

  ##### Positional Arguments
  - **model**: `String`.

    the path of the onnx model used for face recognition

  - **config**: `String`.

    the path to the config file for compability, which is not requested for ONNX models


  ##### Keyword Arguments
  - **backend_id**: `int`.

    the id of backend

  - **target_id**: `int`.

    the id of target device


  ##### Return
  - **retval**: `Evision.FaceRecognizerSF`



  Python prototype (for reference): 
  ```python3
  create(model, config[, backend_id[, target_id]]) -> retval
  ```

  """
  @spec create(binary(), binary(), [{atom(), term()},...] | nil) :: Evision.FaceRecognizerSF.t() | {:error, String.t()}
  def create(model, config, opts) when is_binary(model) and is_binary(config) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model),
      config: Evision.Internal.Structurise.from_struct(config)
    ]
    :evision_nif.faceRecognizerSF_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates an instance of this class with given parameters

  ##### Positional Arguments
  - **model**: `String`.

    the path of the onnx model used for face recognition

  - **config**: `String`.

    the path to the config file for compability, which is not requested for ONNX models


  ##### Keyword Arguments
  - **backend_id**: `int`.

    the id of backend

  - **target_id**: `int`.

    the id of target device


  ##### Return
  - **retval**: `Evision.FaceRecognizerSF`



  Python prototype (for reference): 
  ```python3
  create(model, config[, backend_id[, target_id]]) -> retval
  ```

  """
  @spec create(binary(), binary()) :: Evision.FaceRecognizerSF.t() | {:error, String.t()}
  def create(model, config) when is_binary(model) and is_binary(config)
  do
    positional = [
      model: Evision.Internal.Structurise.from_struct(model),
      config: Evision.Internal.Structurise.from_struct(config)
    ]
    :evision_nif.faceRecognizerSF_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Extracting face feature from aligned image

  ##### Positional Arguments
  - **aligned_img**: `Evision.Mat`.

    input aligned image


  ##### Return
  - **face_feature**: `Evision.Mat`.

    output face feature




  Python prototype (for reference): 
  ```python3
  feature(aligned_img[, face_feature]) -> face_feature
  ```

  """
  @spec feature(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def feature(self, aligned_img, opts) when (is_struct(aligned_img, Evision.Mat) or is_struct(aligned_img, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      aligned_img: Evision.Internal.Structurise.from_struct(aligned_img)
    ]
    :evision_nif.faceRecognizerSF_feature(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Extracting face feature from aligned image

  ##### Positional Arguments
  - **aligned_img**: `Evision.Mat`.

    input aligned image


  ##### Return
  - **face_feature**: `Evision.Mat`.

    output face feature




  Python prototype (for reference): 
  ```python3
  feature(aligned_img[, face_feature]) -> face_feature
  ```

  """
  @spec feature(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def feature(self, aligned_img) when (is_struct(aligned_img, Evision.Mat) or is_struct(aligned_img, Nx.Tensor))
  do
    positional = [
      aligned_img: Evision.Internal.Structurise.from_struct(aligned_img)
    ]
    :evision_nif.faceRecognizerSF_feature(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Calculating the distance between two face features

  ##### Positional Arguments
  - **face_feature1**: `Evision.Mat`.

    the first input feature

  - **face_feature2**: `Evision.Mat`.

    the second input feature of the same size and the same type as face_feature1


  ##### Keyword Arguments
  - **dis_type**: `int`.

    defining the similarity with optional values "FR_OSINE" or "FR_NORM_L2"


  ##### Return
  - **retval**: `double`



  Python prototype (for reference): 
  ```python3
  match(face_feature1, face_feature2[, dis_type]) -> retval
  ```

  """
  @spec match(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: number() | {:error, String.t()}
  def match(self, face_feature1, face_feature2, opts) when (is_struct(face_feature1, Evision.Mat) or is_struct(face_feature1, Nx.Tensor)) and (is_struct(face_feature2, Evision.Mat) or is_struct(face_feature2, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      face_feature1: Evision.Internal.Structurise.from_struct(face_feature1),
      face_feature2: Evision.Internal.Structurise.from_struct(face_feature2)
    ]
    :evision_nif.faceRecognizerSF_match(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Calculating the distance between two face features

  ##### Positional Arguments
  - **face_feature1**: `Evision.Mat`.

    the first input feature

  - **face_feature2**: `Evision.Mat`.

    the second input feature of the same size and the same type as face_feature1


  ##### Keyword Arguments
  - **dis_type**: `int`.

    defining the similarity with optional values "FR_OSINE" or "FR_NORM_L2"


  ##### Return
  - **retval**: `double`



  Python prototype (for reference): 
  ```python3
  match(face_feature1, face_feature2[, dis_type]) -> retval
  ```

  """
  @spec match(Evision.FaceRecognizerSF.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: number() | {:error, String.t()}
  def match(self, face_feature1, face_feature2) when (is_struct(face_feature1, Evision.Mat) or is_struct(face_feature1, Nx.Tensor)) and (is_struct(face_feature2, Evision.Mat) or is_struct(face_feature2, Nx.Tensor))
  do
    positional = [
      face_feature1: Evision.Internal.Structurise.from_struct(face_feature1),
      face_feature2: Evision.Internal.Structurise.from_struct(face_feature2)
    ]
    :evision_nif.faceRecognizerSF_match(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
