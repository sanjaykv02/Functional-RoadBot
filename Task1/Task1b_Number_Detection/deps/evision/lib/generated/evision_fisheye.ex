defmodule Evision.FishEye do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.FishEye` struct.

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
  def __to_struct__({:ok, %{class: :FishEye, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :FishEye, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Performs camera calibration

  ##### Positional Arguments
  - **objectPoints**: `[Evision.Mat]`.

    vector of vectors of calibration pattern points in the calibration pattern
    coordinate space.

  - **imagePoints**: `[Evision.Mat]`.

    vector of vectors of the projections of calibration pattern points.
    imagePoints.size() and objectPoints.size() and imagePoints[i].size() must be equal to
    objectPoints[i].size() for each i.

  - **image_size**: `Size`.

    Size of the image used only to initialize the camera intrinsic matrix.


  ##### Keyword Arguments
  - **flags**: `int`.

    Different flags that may be zero or a combination of the following values:
    - @ref fisheye::CALIB_USE_INTRINSIC_GUESS  cameraMatrix contains valid initial values of
      fx, fy, cx, cy that are optimized further. Otherwise, (cx, cy) is initially set to the image
      center ( imageSize is used), and focal distances are computed in a least-squares fashion.
    - @ref fisheye::CALIB_RECOMPUTE_EXTRINSIC  Extrinsic will be recomputed after each iteration
      of intrinsic optimization.
    - @ref fisheye::CALIB_CHECK_COND  The functions will check validity of condition number.
    - @ref fisheye::CALIB_FIX_SKEW  Skew coefficient (alpha) is set to zero and stay zero.
    - @ref fisheye::CALIB_FIX_K1,..., @ref fisheye::CALIB_FIX_K4 Selected distortion coefficients
      are set to zeros and stay zero.
    - @ref fisheye::CALIB_FIX_PRINCIPAL_POINT  The principal point is not changed during the global
      optimization. It stays at the center or at a different location specified when @ref fisheye::CALIB_USE_INTRINSIC_GUESS is set too.
    - @ref fisheye::CALIB_FIX_FOCAL_LENGTH The focal length is not changed during the global
      optimization. It is the \\f$max(width,height)/\\pi\\f$ or the provided \\f$f_x\\f$, \\f$f_y\\f$ when @ref fisheye::CALIB_USE_INTRINSIC_GUESS is set too.

  - **criteria**: `TermCriteria`.

    Termination criteria for the iterative optimization algorithm.


  ##### Return
  - **retval**: `double`
  - **k**: `Evision.Mat`.

    Output 3x3 floating-point camera intrinsic matrix
    \\f$\\cameramatrix{A}\\f$ . If

  - **d**: `Evision.Mat`.

    Output vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **rvecs**: `[Evision.Mat]`.

    Output vector of rotation vectors (see Rodrigues ) estimated for each pattern view.
    That is, each k-th rotation vector together with the corresponding k-th translation vector (see
    the next output parameter description) brings the calibration pattern from the model coordinate
    space (in which object points are specified) to the world coordinate space, that is, a real
    position of the calibration pattern in the k-th pattern view (k=0.. *M* -1).

  - **tvecs**: `[Evision.Mat]`.

    Output vector of translation vectors estimated for each pattern view.


  @ref fisheye::CALIB_USE_INTRINSIC_GUESS is specified, some or all of fx, fy, cx, cy must be
  initialized before calling the function.


  Python prototype (for reference): 
  ```python3
  calibrate(objectPoints, imagePoints, image_size, K, D[, rvecs[, tvecs[, flags[, criteria]]]]) -> retval, K, D, rvecs, tvecs
  ```

  """
  @spec calibrate(list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t(), Evision.Mat.t(), list(Evision.Mat.t()), list(Evision.Mat.t())} | {:error, String.t()}
  def calibrate(objectPoints, imagePoints, image_size, k, d, opts) when is_list(objectPoints) and is_list(imagePoints) and is_tuple(image_size) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      imagePoints: Evision.Internal.Structurise.from_struct(imagePoints),
      image_size: Evision.Internal.Structurise.from_struct(image_size),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_calibrate(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs camera calibration

  ##### Positional Arguments
  - **objectPoints**: `[Evision.Mat]`.

    vector of vectors of calibration pattern points in the calibration pattern
    coordinate space.

  - **imagePoints**: `[Evision.Mat]`.

    vector of vectors of the projections of calibration pattern points.
    imagePoints.size() and objectPoints.size() and imagePoints[i].size() must be equal to
    objectPoints[i].size() for each i.

  - **image_size**: `Size`.

    Size of the image used only to initialize the camera intrinsic matrix.


  ##### Keyword Arguments
  - **flags**: `int`.

    Different flags that may be zero or a combination of the following values:
    - @ref fisheye::CALIB_USE_INTRINSIC_GUESS  cameraMatrix contains valid initial values of
      fx, fy, cx, cy that are optimized further. Otherwise, (cx, cy) is initially set to the image
      center ( imageSize is used), and focal distances are computed in a least-squares fashion.
    - @ref fisheye::CALIB_RECOMPUTE_EXTRINSIC  Extrinsic will be recomputed after each iteration
      of intrinsic optimization.
    - @ref fisheye::CALIB_CHECK_COND  The functions will check validity of condition number.
    - @ref fisheye::CALIB_FIX_SKEW  Skew coefficient (alpha) is set to zero and stay zero.
    - @ref fisheye::CALIB_FIX_K1,..., @ref fisheye::CALIB_FIX_K4 Selected distortion coefficients
      are set to zeros and stay zero.
    - @ref fisheye::CALIB_FIX_PRINCIPAL_POINT  The principal point is not changed during the global
      optimization. It stays at the center or at a different location specified when @ref fisheye::CALIB_USE_INTRINSIC_GUESS is set too.
    - @ref fisheye::CALIB_FIX_FOCAL_LENGTH The focal length is not changed during the global
      optimization. It is the \\f$max(width,height)/\\pi\\f$ or the provided \\f$f_x\\f$, \\f$f_y\\f$ when @ref fisheye::CALIB_USE_INTRINSIC_GUESS is set too.

  - **criteria**: `TermCriteria`.

    Termination criteria for the iterative optimization algorithm.


  ##### Return
  - **retval**: `double`
  - **k**: `Evision.Mat`.

    Output 3x3 floating-point camera intrinsic matrix
    \\f$\\cameramatrix{A}\\f$ . If

  - **d**: `Evision.Mat`.

    Output vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **rvecs**: `[Evision.Mat]`.

    Output vector of rotation vectors (see Rodrigues ) estimated for each pattern view.
    That is, each k-th rotation vector together with the corresponding k-th translation vector (see
    the next output parameter description) brings the calibration pattern from the model coordinate
    space (in which object points are specified) to the world coordinate space, that is, a real
    position of the calibration pattern in the k-th pattern view (k=0.. *M* -1).

  - **tvecs**: `[Evision.Mat]`.

    Output vector of translation vectors estimated for each pattern view.


  @ref fisheye::CALIB_USE_INTRINSIC_GUESS is specified, some or all of fx, fy, cx, cy must be
  initialized before calling the function.


  Python prototype (for reference): 
  ```python3
  calibrate(objectPoints, imagePoints, image_size, K, D[, rvecs[, tvecs[, flags[, criteria]]]]) -> retval, K, D, rvecs, tvecs
  ```

  """
  @spec calibrate(list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t(), Evision.Mat.t(), list(Evision.Mat.t()), list(Evision.Mat.t())} | {:error, String.t()}
  def calibrate(objectPoints, imagePoints, image_size, k, d) when is_list(objectPoints) and is_list(imagePoints) and is_tuple(image_size) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor))
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      imagePoints: Evision.Internal.Structurise.from_struct(imagePoints),
      image_size: Evision.Internal.Structurise.from_struct(image_size),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_calibrate(positional)
    |> __to_struct__()
  end

  @doc """
  Distorts 2D points using fisheye model.

  ##### Positional Arguments
  - **undistorted**: `Evision.Mat`.

    Array of object points, 1xN/Nx1 2-channel (or vector\\<Point2f\\> ), where N is
    the number of points in the view.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **alpha**: `double`.

    The skew coefficient.


  ##### Return
  - **distorted**: `Evision.Mat`.

    Output array of image points, 1xN/Nx1 2-channel, or vector\\<Point2f\\> .



  Note that the function assumes the camera intrinsic matrix of the undistorted points to be identity.
  This means if you want to distort image points you have to multiply them with \\f$K^{-1}\\f$.


  Python prototype (for reference): 
  ```python3
  distortPoints(undistorted, K, D[, distorted[, alpha]]) -> distorted
  ```

  """
  @spec distortPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def distortPoints(undistorted, k, d, opts) when (is_struct(undistorted, Evision.Mat) or is_struct(undistorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      undistorted: Evision.Internal.Structurise.from_struct(undistorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_distortPoints(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Distorts 2D points using fisheye model.

  ##### Positional Arguments
  - **undistorted**: `Evision.Mat`.

    Array of object points, 1xN/Nx1 2-channel (or vector\\<Point2f\\> ), where N is
    the number of points in the view.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **alpha**: `double`.

    The skew coefficient.


  ##### Return
  - **distorted**: `Evision.Mat`.

    Output array of image points, 1xN/Nx1 2-channel, or vector\\<Point2f\\> .



  Note that the function assumes the camera intrinsic matrix of the undistorted points to be identity.
  This means if you want to distort image points you have to multiply them with \\f$K^{-1}\\f$.


  Python prototype (for reference): 
  ```python3
  distortPoints(undistorted, K, D[, distorted[, alpha]]) -> distorted
  ```

  """
  @spec distortPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def distortPoints(undistorted, k, d) when (is_struct(undistorted, Evision.Mat) or is_struct(undistorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor))
  do
    positional = [
      undistorted: Evision.Internal.Structurise.from_struct(undistorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_distortPoints(positional)
    |> __to_struct__()
  end

  @doc """
  Estimates new camera intrinsic matrix for undistortion or rectification.

  ##### Positional Arguments
  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **image_size**: `Size`.

    Size of the image

  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel


  ##### Keyword Arguments
  - **balance**: `double`.

    Sets the new focal length in range between the min focal length and the max focal
    length. Balance is in range of [0, 1].

  - **new_size**: `Size`.

    the new size

  - **fov_scale**: `double`.

    Divisor for new focal length.


  ##### Return
  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)




  Python prototype (for reference): 
  ```python3
  estimateNewCameraMatrixForUndistortRectify(K, D, image_size, R[, P[, balance[, new_size[, fov_scale]]]]) -> P
  ```

  """
  @spec estimateNewCameraMatrixForUndistortRectify(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def estimateNewCameraMatrixForUndistortRectify(k, d, image_size, r, opts) when (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and is_tuple(image_size) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d),
      image_size: Evision.Internal.Structurise.from_struct(image_size),
      r: Evision.Internal.Structurise.from_struct(r)
    ]
    :evision_nif.fisheye_estimateNewCameraMatrixForUndistortRectify(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Estimates new camera intrinsic matrix for undistortion or rectification.

  ##### Positional Arguments
  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **image_size**: `Size`.

    Size of the image

  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel


  ##### Keyword Arguments
  - **balance**: `double`.

    Sets the new focal length in range between the min focal length and the max focal
    length. Balance is in range of [0, 1].

  - **new_size**: `Size`.

    the new size

  - **fov_scale**: `double`.

    Divisor for new focal length.


  ##### Return
  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)




  Python prototype (for reference): 
  ```python3
  estimateNewCameraMatrixForUndistortRectify(K, D, image_size, R[, P[, balance[, new_size[, fov_scale]]]]) -> P
  ```

  """
  @spec estimateNewCameraMatrixForUndistortRectify(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def estimateNewCameraMatrixForUndistortRectify(k, d, image_size, r) when (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and is_tuple(image_size) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor))
  do
    positional = [
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d),
      image_size: Evision.Internal.Structurise.from_struct(image_size),
      r: Evision.Internal.Structurise.from_struct(r)
    ]
    :evision_nif.fisheye_estimateNewCameraMatrixForUndistortRectify(positional)
    |> __to_struct__()
  end

  @doc """
  Computes undistortion and rectification maps for image transform by #remap. If D is empty zero
  distortion is used, if R or P is empty identity matrixes are used.


  ##### Positional Arguments
  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel

  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)

  - **size**: `Size`.

    Undistorted image size.

  - **m1type**: `int`.

    Type of the first output map that can be CV_32FC1 or CV_16SC2 . See #convertMaps
    for details.


  ##### Return
  - **map1**: `Evision.Mat`.

    The first output map.

  - **map2**: `Evision.Mat`.

    The second output map.




  Python prototype (for reference): 
  ```python3
  initUndistortRectifyMap(K, D, R, P, size, m1type[, map1[, map2]]) -> map1, map2
  ```

  """
  @spec initUndistortRectifyMap(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, integer(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def initUndistortRectifyMap(k, d, r, p, size, m1type, opts) when (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor)) and (is_struct(p, Evision.Mat) or is_struct(p, Nx.Tensor)) and is_tuple(size) and is_integer(m1type) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d),
      r: Evision.Internal.Structurise.from_struct(r),
      p: Evision.Internal.Structurise.from_struct(p),
      size: Evision.Internal.Structurise.from_struct(size),
      m1type: Evision.Internal.Structurise.from_struct(m1type)
    ]
    :evision_nif.fisheye_initUndistortRectifyMap(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes undistortion and rectification maps for image transform by #remap. If D is empty zero
  distortion is used, if R or P is empty identity matrixes are used.


  ##### Positional Arguments
  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.

  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel

  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)

  - **size**: `Size`.

    Undistorted image size.

  - **m1type**: `int`.

    Type of the first output map that can be CV_32FC1 or CV_16SC2 . See #convertMaps
    for details.


  ##### Return
  - **map1**: `Evision.Mat`.

    The first output map.

  - **map2**: `Evision.Mat`.

    The second output map.




  Python prototype (for reference): 
  ```python3
  initUndistortRectifyMap(K, D, R, P, size, m1type[, map1[, map2]]) -> map1, map2
  ```

  """
  @spec initUndistortRectifyMap(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, integer()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def initUndistortRectifyMap(k, d, r, p, size, m1type) when (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor)) and (is_struct(p, Evision.Mat) or is_struct(p, Nx.Tensor)) and is_tuple(size) and is_integer(m1type)
  do
    positional = [
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d),
      r: Evision.Internal.Structurise.from_struct(r),
      p: Evision.Internal.Structurise.from_struct(p),
      size: Evision.Internal.Structurise.from_struct(size),
      m1type: Evision.Internal.Structurise.from_struct(m1type)
    ]
    :evision_nif.fisheye_initUndistortRectifyMap(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **objectPoints**: `Evision.Mat`
  - **rvec**: `Evision.Mat`
  - **tvec**: `Evision.Mat`
  - **k**: `Evision.Mat`
  - **d**: `Evision.Mat`

  ##### Keyword Arguments
  - **alpha**: `double`.

  ##### Return
  - **imagePoints**: `Evision.Mat`.
  - **jacobian**: `Evision.Mat`.

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  projectPoints(objectPoints, rvec, tvec, K, D[, imagePoints[, alpha[, jacobian]]]) -> imagePoints, jacobian
  ```

  """
  @spec projectPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def projectPoints(objectPoints, rvec, tvec, k, d, opts) when (is_struct(objectPoints, Evision.Mat) or is_struct(objectPoints, Nx.Tensor)) and (is_struct(rvec, Evision.Mat) or is_struct(rvec, Nx.Tensor)) and (is_struct(tvec, Evision.Mat) or is_struct(tvec, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      rvec: Evision.Internal.Structurise.from_struct(rvec),
      tvec: Evision.Internal.Structurise.from_struct(tvec),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_projectPoints(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **objectPoints**: `Evision.Mat`
  - **rvec**: `Evision.Mat`
  - **tvec**: `Evision.Mat`
  - **k**: `Evision.Mat`
  - **d**: `Evision.Mat`

  ##### Keyword Arguments
  - **alpha**: `double`.

  ##### Return
  - **imagePoints**: `Evision.Mat`.
  - **jacobian**: `Evision.Mat`.

  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  projectPoints(objectPoints, rvec, tvec, K, D[, imagePoints[, alpha[, jacobian]]]) -> imagePoints, jacobian
  ```

  """
  @spec projectPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: {Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def projectPoints(objectPoints, rvec, tvec, k, d) when (is_struct(objectPoints, Evision.Mat) or is_struct(objectPoints, Nx.Tensor)) and (is_struct(rvec, Evision.Mat) or is_struct(rvec, Nx.Tensor)) and (is_struct(tvec, Evision.Mat) or is_struct(tvec, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor))
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      rvec: Evision.Internal.Structurise.from_struct(rvec),
      tvec: Evision.Internal.Structurise.from_struct(tvec),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_projectPoints(positional)
    |> __to_struct__()
  end

  @doc """
  Performs stereo calibration

  ##### Positional Arguments
  - **objectPoints**: `[Evision.Mat]`.

    Vector of vectors of the calibration pattern points.

  - **imagePoints1**: `[Evision.Mat]`.

    Vector of vectors of the projections of the calibration pattern points,
    observed by the first camera.

  - **imagePoints2**: `[Evision.Mat]`.

    Vector of vectors of the projections of the calibration pattern points,
    observed by the second camera.

  - **imageSize**: `Size`.

    Size of the image used only to initialize camera intrinsic matrix.


  ##### Keyword Arguments
  - **flags**: `int`.

    Different flags that may be zero or a combination of the following values:
    - @ref fisheye::CALIB_FIX_INTRINSIC  Fix K1, K2? and D1, D2? so that only R, T matrices
      are estimated.
    - @ref fisheye::CALIB_USE_INTRINSIC_GUESS  K1, K2 contains valid initial values of
      fx, fy, cx, cy that are optimized further. Otherwise, (cx, cy) is initially set to the image
      center (imageSize is used), and focal distances are computed in a least-squares fashion.
    - @ref fisheye::CALIB_RECOMPUTE_EXTRINSIC  Extrinsic will be recomputed after each iteration
      of intrinsic optimization.
    - @ref fisheye::CALIB_CHECK_COND  The functions will check validity of condition number.
    - @ref fisheye::CALIB_FIX_SKEW  Skew coefficient (alpha) is set to zero and stay zero.
    - @ref fisheye::CALIB_FIX_K1,..., @ref fisheye::CALIB_FIX_K4 Selected distortion coefficients are set to zeros and stay
      zero.

  - **criteria**: `TermCriteria`.

    Termination criteria for the iterative optimization algorithm.


  ##### Return
  - **retval**: `double`
  - **k1**: `Evision.Mat`.

    Input/output first camera intrinsic matrix:
    \\f$\\vecthreethree{f_x^{(j)}}{0}{c_x^{(j)}}{0}{f_y^{(j)}}{c_y^{(j)}}{0}{0}{1}\\f$ , \\f$j = 0,\\, 1\\f$ . If
    any of @ref fisheye::CALIB_USE_INTRINSIC_GUESS , @ref fisheye::CALIB_FIX_INTRINSIC are specified,
    some or all of the matrix components must be initialized.

  - **d1**: `Evision.Mat`.

    Input/output vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$ of 4 elements.

  - **k2**: `Evision.Mat`.

    Input/output second camera intrinsic matrix. The parameter is similar to K1 .

  - **d2**: `Evision.Mat`.

    Input/output lens distortion coefficients for the second camera. The parameter is
    similar to D1 .

  - **r**: `Evision.Mat`.

    Output rotation matrix between the 1st and the 2nd camera coordinate systems.

  - **t**: `Evision.Mat`.

    Output translation vector between the coordinate systems of the cameras.




  Python prototype (for reference): 
  ```python3
  stereoCalibrate(objectPoints, imagePoints1, imagePoints2, K1, D1, K2, D2, imageSize[, R[, T[, flags[, criteria]]]]) -> retval, K1, D1, K2, D2, R, T
  ```

  """
  @spec stereoCalibrate(list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def stereoCalibrate(objectPoints, imagePoints1, imagePoints2, k1, d1, k2, d2, imageSize, opts) when is_list(objectPoints) and is_list(imagePoints1) and is_list(imagePoints2) and (is_struct(k1, Evision.Mat) or is_struct(k1, Nx.Tensor)) and (is_struct(d1, Evision.Mat) or is_struct(d1, Nx.Tensor)) and (is_struct(k2, Evision.Mat) or is_struct(k2, Nx.Tensor)) and (is_struct(d2, Evision.Mat) or is_struct(d2, Nx.Tensor)) and is_tuple(imageSize) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      imagePoints1: Evision.Internal.Structurise.from_struct(imagePoints1),
      imagePoints2: Evision.Internal.Structurise.from_struct(imagePoints2),
      k1: Evision.Internal.Structurise.from_struct(k1),
      d1: Evision.Internal.Structurise.from_struct(d1),
      k2: Evision.Internal.Structurise.from_struct(k2),
      d2: Evision.Internal.Structurise.from_struct(d2),
      imageSize: Evision.Internal.Structurise.from_struct(imageSize)
    ]
    :evision_nif.fisheye_stereoCalibrate(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Performs stereo calibration

  ##### Positional Arguments
  - **objectPoints**: `[Evision.Mat]`.

    Vector of vectors of the calibration pattern points.

  - **imagePoints1**: `[Evision.Mat]`.

    Vector of vectors of the projections of the calibration pattern points,
    observed by the first camera.

  - **imagePoints2**: `[Evision.Mat]`.

    Vector of vectors of the projections of the calibration pattern points,
    observed by the second camera.

  - **imageSize**: `Size`.

    Size of the image used only to initialize camera intrinsic matrix.


  ##### Keyword Arguments
  - **flags**: `int`.

    Different flags that may be zero or a combination of the following values:
    - @ref fisheye::CALIB_FIX_INTRINSIC  Fix K1, K2? and D1, D2? so that only R, T matrices
      are estimated.
    - @ref fisheye::CALIB_USE_INTRINSIC_GUESS  K1, K2 contains valid initial values of
      fx, fy, cx, cy that are optimized further. Otherwise, (cx, cy) is initially set to the image
      center (imageSize is used), and focal distances are computed in a least-squares fashion.
    - @ref fisheye::CALIB_RECOMPUTE_EXTRINSIC  Extrinsic will be recomputed after each iteration
      of intrinsic optimization.
    - @ref fisheye::CALIB_CHECK_COND  The functions will check validity of condition number.
    - @ref fisheye::CALIB_FIX_SKEW  Skew coefficient (alpha) is set to zero and stay zero.
    - @ref fisheye::CALIB_FIX_K1,..., @ref fisheye::CALIB_FIX_K4 Selected distortion coefficients are set to zeros and stay
      zero.

  - **criteria**: `TermCriteria`.

    Termination criteria for the iterative optimization algorithm.


  ##### Return
  - **retval**: `double`
  - **k1**: `Evision.Mat`.

    Input/output first camera intrinsic matrix:
    \\f$\\vecthreethree{f_x^{(j)}}{0}{c_x^{(j)}}{0}{f_y^{(j)}}{c_y^{(j)}}{0}{0}{1}\\f$ , \\f$j = 0,\\, 1\\f$ . If
    any of @ref fisheye::CALIB_USE_INTRINSIC_GUESS , @ref fisheye::CALIB_FIX_INTRINSIC are specified,
    some or all of the matrix components must be initialized.

  - **d1**: `Evision.Mat`.

    Input/output vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$ of 4 elements.

  - **k2**: `Evision.Mat`.

    Input/output second camera intrinsic matrix. The parameter is similar to K1 .

  - **d2**: `Evision.Mat`.

    Input/output lens distortion coefficients for the second camera. The parameter is
    similar to D1 .

  - **r**: `Evision.Mat`.

    Output rotation matrix between the 1st and the 2nd camera coordinate systems.

  - **t**: `Evision.Mat`.

    Output translation vector between the coordinate systems of the cameras.




  Python prototype (for reference): 
  ```python3
  stereoCalibrate(objectPoints, imagePoints1, imagePoints2, K1, D1, K2, D2, imageSize[, R[, T[, flags[, criteria]]]]) -> retval, K1, D1, K2, D2, R, T
  ```

  """
  @spec stereoCalibrate(list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), list(Evision.Mat.maybe_mat_in()), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}) :: {number(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def stereoCalibrate(objectPoints, imagePoints1, imagePoints2, k1, d1, k2, d2, imageSize) when is_list(objectPoints) and is_list(imagePoints1) and is_list(imagePoints2) and (is_struct(k1, Evision.Mat) or is_struct(k1, Nx.Tensor)) and (is_struct(d1, Evision.Mat) or is_struct(d1, Nx.Tensor)) and (is_struct(k2, Evision.Mat) or is_struct(k2, Nx.Tensor)) and (is_struct(d2, Evision.Mat) or is_struct(d2, Nx.Tensor)) and is_tuple(imageSize)
  do
    positional = [
      objectPoints: Evision.Internal.Structurise.from_struct(objectPoints),
      imagePoints1: Evision.Internal.Structurise.from_struct(imagePoints1),
      imagePoints2: Evision.Internal.Structurise.from_struct(imagePoints2),
      k1: Evision.Internal.Structurise.from_struct(k1),
      d1: Evision.Internal.Structurise.from_struct(d1),
      k2: Evision.Internal.Structurise.from_struct(k2),
      d2: Evision.Internal.Structurise.from_struct(d2),
      imageSize: Evision.Internal.Structurise.from_struct(imageSize)
    ]
    :evision_nif.fisheye_stereoCalibrate(positional)
    |> __to_struct__()
  end

  @doc """
  Stereo rectification for fisheye camera model

  ##### Positional Arguments
  - **k1**: `Evision.Mat`.

    First camera intrinsic matrix.

  - **d1**: `Evision.Mat`.

    First camera distortion parameters.

  - **k2**: `Evision.Mat`.

    Second camera intrinsic matrix.

  - **d2**: `Evision.Mat`.

    Second camera distortion parameters.

  - **imageSize**: `Size`.

    Size of the image used for stereo calibration.

  - **r**: `Evision.Mat`.

    Rotation matrix between the coordinate systems of the first and the second
    cameras.

  - **tvec**: `Evision.Mat`.

    Translation vector between coordinate systems of the cameras.

  - **flags**: `int`.

    Operation flags that may be zero or @ref fisheye::CALIB_ZERO_DISPARITY . If the flag is set,
    the function makes the principal points of each camera have the same pixel coordinates in the
    rectified views. And if the flag is not set, the function may still shift the images in the
    horizontal or vertical direction (depending on the orientation of epipolar lines) to maximize the
    useful image area.


  ##### Keyword Arguments
  - **newImageSize**: `Size`.

    New image resolution after rectification. The same size should be passed to
    #initUndistortRectifyMap (see the stereo_calib.cpp sample in OpenCV samples directory). When (0,0)
    is passed (default), it is set to the original imageSize . Setting it to larger value can help you
    preserve details in the original image, especially when there is a big radial distortion.

  - **balance**: `double`.

    Sets the new focal length in range between the min focal length and the max focal
    length. Balance is in range of [0, 1].

  - **fov_scale**: `double`.

    Divisor for new focal length.


  ##### Return
  - **r1**: `Evision.Mat`.

    Output 3x3 rectification transform (rotation matrix) for the first camera.

  - **r2**: `Evision.Mat`.

    Output 3x3 rectification transform (rotation matrix) for the second camera.

  - **p1**: `Evision.Mat`.

    Output 3x4 projection matrix in the new (rectified) coordinate systems for the first
    camera.

  - **p2**: `Evision.Mat`.

    Output 3x4 projection matrix in the new (rectified) coordinate systems for the second
    camera.

  - **q**: `Evision.Mat`.

    Output \\f$4 \\times 4\\f$ disparity-to-depth mapping matrix (see reprojectImageTo3D ).




  Python prototype (for reference): 
  ```python3
  stereoRectify(K1, D1, K2, D2, imageSize, R, tvec, flags[, R1[, R2[, P1[, P2[, Q[, newImageSize[, balance[, fov_scale]]]]]]]]) -> R1, R2, P1, P2, Q
  ```

  """
  @spec stereoRectify(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def stereoRectify(k1, d1, k2, d2, imageSize, r, tvec, flags, opts) when (is_struct(k1, Evision.Mat) or is_struct(k1, Nx.Tensor)) and (is_struct(d1, Evision.Mat) or is_struct(d1, Nx.Tensor)) and (is_struct(k2, Evision.Mat) or is_struct(k2, Nx.Tensor)) and (is_struct(d2, Evision.Mat) or is_struct(d2, Nx.Tensor)) and is_tuple(imageSize) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor)) and (is_struct(tvec, Evision.Mat) or is_struct(tvec, Nx.Tensor)) and is_integer(flags) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      k1: Evision.Internal.Structurise.from_struct(k1),
      d1: Evision.Internal.Structurise.from_struct(d1),
      k2: Evision.Internal.Structurise.from_struct(k2),
      d2: Evision.Internal.Structurise.from_struct(d2),
      imageSize: Evision.Internal.Structurise.from_struct(imageSize),
      r: Evision.Internal.Structurise.from_struct(r),
      tvec: Evision.Internal.Structurise.from_struct(tvec),
      flags: Evision.Internal.Structurise.from_struct(flags)
    ]
    :evision_nif.fisheye_stereoRectify(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Stereo rectification for fisheye camera model

  ##### Positional Arguments
  - **k1**: `Evision.Mat`.

    First camera intrinsic matrix.

  - **d1**: `Evision.Mat`.

    First camera distortion parameters.

  - **k2**: `Evision.Mat`.

    Second camera intrinsic matrix.

  - **d2**: `Evision.Mat`.

    Second camera distortion parameters.

  - **imageSize**: `Size`.

    Size of the image used for stereo calibration.

  - **r**: `Evision.Mat`.

    Rotation matrix between the coordinate systems of the first and the second
    cameras.

  - **tvec**: `Evision.Mat`.

    Translation vector between coordinate systems of the cameras.

  - **flags**: `int`.

    Operation flags that may be zero or @ref fisheye::CALIB_ZERO_DISPARITY . If the flag is set,
    the function makes the principal points of each camera have the same pixel coordinates in the
    rectified views. And if the flag is not set, the function may still shift the images in the
    horizontal or vertical direction (depending on the orientation of epipolar lines) to maximize the
    useful image area.


  ##### Keyword Arguments
  - **newImageSize**: `Size`.

    New image resolution after rectification. The same size should be passed to
    #initUndistortRectifyMap (see the stereo_calib.cpp sample in OpenCV samples directory). When (0,0)
    is passed (default), it is set to the original imageSize . Setting it to larger value can help you
    preserve details in the original image, especially when there is a big radial distortion.

  - **balance**: `double`.

    Sets the new focal length in range between the min focal length and the max focal
    length. Balance is in range of [0, 1].

  - **fov_scale**: `double`.

    Divisor for new focal length.


  ##### Return
  - **r1**: `Evision.Mat`.

    Output 3x3 rectification transform (rotation matrix) for the first camera.

  - **r2**: `Evision.Mat`.

    Output 3x3 rectification transform (rotation matrix) for the second camera.

  - **p1**: `Evision.Mat`.

    Output 3x4 projection matrix in the new (rectified) coordinate systems for the first
    camera.

  - **p2**: `Evision.Mat`.

    Output 3x4 projection matrix in the new (rectified) coordinate systems for the second
    camera.

  - **q**: `Evision.Mat`.

    Output \\f$4 \\times 4\\f$ disparity-to-depth mapping matrix (see reprojectImageTo3D ).




  Python prototype (for reference): 
  ```python3
  stereoRectify(K1, D1, K2, D2, imageSize, R, tvec, flags[, R1[, R2[, P1[, P2[, Q[, newImageSize[, balance[, fov_scale]]]]]]]]) -> R1, R2, P1, P2, Q
  ```

  """
  @spec stereoRectify(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), {number(), number()}, Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), integer()) :: {Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def stereoRectify(k1, d1, k2, d2, imageSize, r, tvec, flags) when (is_struct(k1, Evision.Mat) or is_struct(k1, Nx.Tensor)) and (is_struct(d1, Evision.Mat) or is_struct(d1, Nx.Tensor)) and (is_struct(k2, Evision.Mat) or is_struct(k2, Nx.Tensor)) and (is_struct(d2, Evision.Mat) or is_struct(d2, Nx.Tensor)) and is_tuple(imageSize) and (is_struct(r, Evision.Mat) or is_struct(r, Nx.Tensor)) and (is_struct(tvec, Evision.Mat) or is_struct(tvec, Nx.Tensor)) and is_integer(flags)
  do
    positional = [
      k1: Evision.Internal.Structurise.from_struct(k1),
      d1: Evision.Internal.Structurise.from_struct(d1),
      k2: Evision.Internal.Structurise.from_struct(k2),
      d2: Evision.Internal.Structurise.from_struct(d2),
      imageSize: Evision.Internal.Structurise.from_struct(imageSize),
      r: Evision.Internal.Structurise.from_struct(r),
      tvec: Evision.Internal.Structurise.from_struct(tvec),
      flags: Evision.Internal.Structurise.from_struct(flags)
    ]
    :evision_nif.fisheye_stereoRectify(positional)
    |> __to_struct__()
  end

  @doc """
  Transforms an image to compensate for fisheye lens distortion.

  ##### Positional Arguments
  - **distorted**: `Evision.Mat`.

    image with fisheye lens distortion.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **knew**: `Evision.Mat`.

    Camera intrinsic matrix of the distorted image. By default, it is the identity matrix but you
    may additionally scale and shift the result by using a different matrix.

  - **new_size**: `Size`.

    the new size


  ##### Return
  - **undistorted**: `Evision.Mat`.

    Output image with compensated fisheye lens distortion.



  The function transforms an image to compensate radial and tangential lens distortion.
  The function is simply a combination of #fisheye::initUndistortRectifyMap (with unity R ) and #remap
  (with bilinear interpolation). See the former function for details of the transformation being
  performed.
  See below the results of undistortImage.
  - a\\) result of undistort of perspective camera model (all possible coefficients (k_1, k_2, k_3,
    k_4, k_5, k_6) of distortion were optimized under calibration)

  - b\\) result of #fisheye::undistortImage of fisheye camera model (all possible coefficients (k_1, k_2,
    k_3, k_4) of fisheye distortion were optimized under calibration)

  - c\\) original image was captured with fisheye lens

  Pictures a) and b) almost the same. But if we consider points of image located far from the center
  of image, we can notice that on image a) these points are distorted.
  ![image](pics/fisheye_undistorted.jpg)


  Python prototype (for reference): 
  ```python3
  undistortImage(distorted, K, D[, undistorted[, Knew[, new_size]]]) -> undistorted
  ```

  """
  @spec undistortImage(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def undistortImage(distorted, k, d, opts) when (is_struct(distorted, Evision.Mat) or is_struct(distorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      distorted: Evision.Internal.Structurise.from_struct(distorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_undistortImage(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Transforms an image to compensate for fisheye lens distortion.

  ##### Positional Arguments
  - **distorted**: `Evision.Mat`.

    image with fisheye lens distortion.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **knew**: `Evision.Mat`.

    Camera intrinsic matrix of the distorted image. By default, it is the identity matrix but you
    may additionally scale and shift the result by using a different matrix.

  - **new_size**: `Size`.

    the new size


  ##### Return
  - **undistorted**: `Evision.Mat`.

    Output image with compensated fisheye lens distortion.



  The function transforms an image to compensate radial and tangential lens distortion.
  The function is simply a combination of #fisheye::initUndistortRectifyMap (with unity R ) and #remap
  (with bilinear interpolation). See the former function for details of the transformation being
  performed.
  See below the results of undistortImage.
  - a\\) result of undistort of perspective camera model (all possible coefficients (k_1, k_2, k_3,
    k_4, k_5, k_6) of distortion were optimized under calibration)

  - b\\) result of #fisheye::undistortImage of fisheye camera model (all possible coefficients (k_1, k_2,
    k_3, k_4) of fisheye distortion were optimized under calibration)

  - c\\) original image was captured with fisheye lens

  Pictures a) and b) almost the same. But if we consider points of image located far from the center
  of image, we can notice that on image a) these points are distorted.
  ![image](pics/fisheye_undistorted.jpg)


  Python prototype (for reference): 
  ```python3
  undistortImage(distorted, K, D[, undistorted[, Knew[, new_size]]]) -> undistorted
  ```

  """
  @spec undistortImage(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def undistortImage(distorted, k, d) when (is_struct(distorted, Evision.Mat) or is_struct(distorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor))
  do
    positional = [
      distorted: Evision.Internal.Structurise.from_struct(distorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_undistortImage(positional)
    |> __to_struct__()
  end

  @doc """
  Undistorts 2D points using fisheye model

  ##### Positional Arguments
  - **distorted**: `Evision.Mat`.

    Array of object points, 1xN/Nx1 2-channel (or vector\\<Point2f\\> ), where N is the
    number of points in the view.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel

  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)

  - **criteria**: `TermCriteria`.

    Termination criteria


  ##### Return
  - **undistorted**: `Evision.Mat`.

    Output array of image points, 1xN/Nx1 2-channel, or vector\\<Point2f\\> .




  Python prototype (for reference): 
  ```python3
  undistortPoints(distorted, K, D[, undistorted[, R[, P[, criteria]]]]) -> undistorted
  ```

  """
  @spec undistortPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def undistortPoints(distorted, k, d, opts) when (is_struct(distorted, Evision.Mat) or is_struct(distorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      distorted: Evision.Internal.Structurise.from_struct(distorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_undistortPoints(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Undistorts 2D points using fisheye model

  ##### Positional Arguments
  - **distorted**: `Evision.Mat`.

    Array of object points, 1xN/Nx1 2-channel (or vector\\<Point2f\\> ), where N is the
    number of points in the view.

  - **k**: `Evision.Mat`.

    Camera intrinsic matrix \\f$cameramatrix{K}\\f$.

  - **d**: `Evision.Mat`.

    Input vector of distortion coefficients \\f$\\distcoeffsfisheye\\f$.


  ##### Keyword Arguments
  - **r**: `Evision.Mat`.

    Rectification transformation in the object space: 3x3 1-channel, or vector: 3x1/1x3
    1-channel or 1x1 3-channel

  - **p**: `Evision.Mat`.

    New camera intrinsic matrix (3x3) or new projection matrix (3x4)

  - **criteria**: `TermCriteria`.

    Termination criteria


  ##### Return
  - **undistorted**: `Evision.Mat`.

    Output array of image points, 1xN/Nx1 2-channel, or vector\\<Point2f\\> .




  Python prototype (for reference): 
  ```python3
  undistortPoints(distorted, K, D[, undistorted[, R[, P[, criteria]]]]) -> undistorted
  ```

  """
  @spec undistortPoints(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def undistortPoints(distorted, k, d) when (is_struct(distorted, Evision.Mat) or is_struct(distorted, Nx.Tensor)) and (is_struct(k, Evision.Mat) or is_struct(k, Nx.Tensor)) and (is_struct(d, Evision.Mat) or is_struct(d, Nx.Tensor))
  do
    positional = [
      distorted: Evision.Internal.Structurise.from_struct(distorted),
      k: Evision.Internal.Structurise.from_struct(k),
      d: Evision.Internal.Structurise.from_struct(d)
    ]
    :evision_nif.fisheye_undistortPoints(positional)
    |> __to_struct__()
  end
end
