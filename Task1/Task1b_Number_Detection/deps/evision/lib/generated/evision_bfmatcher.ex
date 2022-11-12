defmodule Evision.BFMatcher do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.BFMatcher` struct.

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
  def __to_struct__({:ok, %{class: :BFMatcher, ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :BFMatcher, ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Brute-force matcher constructor (obsolete). Please use BFMatcher.create()
  ##### Keyword Arguments
  - **normType**: `int`.
  - **crossCheck**: `bool`.

  ##### Return
  - **self**: `Evision.BFMatcher`



  Python prototype (for reference): 
  ```python3
  BFMatcher([, normType[, crossCheck]]) -> <BFMatcher object>
  ```

  """
  @spec bfMatcher([{atom(), term()},...] | nil) :: Evision.BFMatcher.t() | {:error, String.t()}
  def bfMatcher(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.bfMatcher_BFMatcher(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Brute-force matcher constructor (obsolete). Please use BFMatcher.create()
  ##### Keyword Arguments
  - **normType**: `int`.
  - **crossCheck**: `bool`.

  ##### Return
  - **self**: `Evision.BFMatcher`



  Python prototype (for reference): 
  ```python3
  BFMatcher([, normType[, crossCheck]]) -> <BFMatcher object>
  ```

  """
  @spec bfMatcher() :: Evision.BFMatcher.t() | {:error, String.t()}
  def bfMatcher() do
    positional = [
    ]
    :evision_nif.bfMatcher_BFMatcher(positional)
    |> __to_struct__()
  end

  @doc """
  Adds descriptors to train a CPU(trainDescCollectionis) or GPU(utrainDescCollectionis) descriptor
  collection.


  ##### Positional Arguments
  - **descriptors**: `[Evision.Mat]`.

    Descriptors to add. Each descriptors[i] is a set of descriptors from the same
    train image.



  If the collection is not empty, the new descriptors are added to existing train descriptors.


  Python prototype (for reference): 
  ```python3
  add(descriptors) -> None
  ```

  """
  @spec add(Evision.BFMatcher.t(), list(Evision.Mat.maybe_mat_in())) :: :ok | {:error, String.t()}
  def add(self, descriptors) when is_list(descriptors)
  do
    positional = [
      descriptors: Evision.Internal.Structurise.from_struct(descriptors)
    ]
    :evision_nif.bfMatcher_add(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clears the train descriptor collections.


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.BFMatcher.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clones the matcher.
  ##### Keyword Arguments
  - **emptyTrainData**: `bool`.

    If emptyTrainData is false, the method creates a deep copy of the object,
    that is, copies both parameters and train data. If emptyTrainData is true, the method creates an
    object copy with the current parameters but with empty train data.


  ##### Return
  - **retval**: `Evision.DescriptorMatcher`



  Python prototype (for reference): 
  ```python3
  clone([, emptyTrainData]) -> retval
  ```

  """
  @spec clone(Evision.BFMatcher.t()) :: Evision.DescriptorMatcher.t() | {:error, String.t()}
  def clone(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_clone(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Brute-force matcher create method.
  ##### Keyword Arguments
  - **normType**: `int`.

    One of NORM_L1, NORM_L2, NORM_HAMMING, NORM_HAMMING2. L1 and L2 norms are
    preferable choices for SIFT and SURF descriptors, NORM_HAMMING should be used with ORB, BRISK and
    BRIEF, NORM_HAMMING2 should be used with ORB when WTA_K==3 or 4 (see ORB::ORB constructor
    description).

  - **crossCheck**: `bool`.

    If it is false, this is will be default BFMatcher behaviour when it finds the k
    nearest neighbors for each query descriptor. If crossCheck==true, then the knnMatch() method with
    k=1 will only return pairs (i,j) such that for i-th query descriptor the j-th descriptor in the
    matcher's collection is the nearest and vice versa, i.e. the BFMatcher will only return consistent
    pairs. Such technique usually produces best results with minimal number of outliers when there are
    enough matches. This is alternative to the ratio test, used by D. Lowe in SIFT paper.


  ##### Return
  - **retval**: `Evision.BFMatcher`



  Python prototype (for reference): 
  ```python3
  create([, normType[, crossCheck]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.BFMatcher.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.bfMatcher_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Brute-force matcher create method.
  ##### Keyword Arguments
  - **normType**: `int`.

    One of NORM_L1, NORM_L2, NORM_HAMMING, NORM_HAMMING2. L1 and L2 norms are
    preferable choices for SIFT and SURF descriptors, NORM_HAMMING should be used with ORB, BRISK and
    BRIEF, NORM_HAMMING2 should be used with ORB when WTA_K==3 or 4 (see ORB::ORB constructor
    description).

  - **crossCheck**: `bool`.

    If it is false, this is will be default BFMatcher behaviour when it finds the k
    nearest neighbors for each query descriptor. If crossCheck==true, then the knnMatch() method with
    k=1 will only return pairs (i,j) such that for i-th query descriptor the j-th descriptor in the
    matcher's collection is the nearest and vice versa, i.e. the BFMatcher will only return consistent
    pairs. Such technique usually produces best results with minimal number of outliers when there are
    enough matches. This is alternative to the ratio test, used by D. Lowe in SIFT paper.


  ##### Return
  - **retval**: `Evision.BFMatcher`



  Python prototype (for reference): 
  ```python3
  create([, normType[, crossCheck]]) -> retval
  ```

  """
  @spec create() :: Evision.BFMatcher.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.bfMatcher_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if there are no train descriptors in the both collections.
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.BFMatcher.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns a constant link to the train descriptor collection trainDescCollection .
  ##### Return
  - **retval**: `std::vector<Mat>`


  Python prototype (for reference): 
  ```python3
  getTrainDescriptors() -> retval
  ```

  """
  @spec getTrainDescriptors(Evision.BFMatcher.t()) :: list(Evision.Mat.t()) | {:error, String.t()}
  def getTrainDescriptors(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_getTrainDescriptors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if the descriptor matcher supports masking permissible matches.
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isMaskSupported() -> retval
  ```

  """
  @spec isMaskSupported(Evision.BFMatcher.t()) :: boolean() | {:error, String.t()}
  def isMaskSupported(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_isMaskSupported(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Finds the k best matches for each descriptor from a query set.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.

  - **k**: `int`.

    Count of best matches found per each query descriptor or less if a query descriptor has
    less than k possible matches in total.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Matches. Each matches[i] is k or less matches for the same query descriptor.



  These extended variants of DescriptorMatcher::match methods find several best matches for each query
  descriptor. The matches are returned in the distance increasing order. See DescriptorMatcher::match
  for the details about query and train descriptors.


  Python prototype (for reference): 
  ```python3
  knnMatch(queryDescriptors, trainDescriptors, k[, mask[, compactResult]]) -> matches
  ```

  """
  @spec knnMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def knnMatch(self, queryDescriptors, trainDescriptors, k, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor)) and is_integer(k) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.bfMatcher_knnMatch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Finds the k best matches for each descriptor from a query set.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.

  - **k**: `int`.

    Count of best matches found per each query descriptor or less if a query descriptor has
    less than k possible matches in total.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Matches. Each matches[i] is k or less matches for the same query descriptor.



  These extended variants of DescriptorMatcher::match methods find several best matches for each query
  descriptor. The matches are returned in the distance increasing order. See DescriptorMatcher::match
  for the details about query and train descriptors.


  Python prototype (for reference): 
  ```python3
  knnMatch(queryDescriptors, trainDescriptors, k[, mask[, compactResult]]) -> matches
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **k**: `int`.

    Count of best matches found per each query descriptor or less if a query descriptor has
    less than k possible matches in total.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Matches. Each matches[i] is k or less matches for the same query descriptor.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  knnMatch(queryDescriptors, k[, masks[, compactResult]]) -> matches
  ```


  """
  @spec knnMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def knnMatch(self, queryDescriptors, k, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and is_integer(k) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.bfMatcher_knnMatch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec knnMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), integer()) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def knnMatch(self, queryDescriptors, trainDescriptors, k) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor)) and is_integer(k)
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.bfMatcher_knnMatch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **k**: `int`.

    Count of best matches found per each query descriptor or less if a query descriptor has
    less than k possible matches in total.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Matches. Each matches[i] is k or less matches for the same query descriptor.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  knnMatch(queryDescriptors, k[, masks[, compactResult]]) -> matches
  ```

  """
  @spec knnMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), integer()) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def knnMatch(self, queryDescriptors, k) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and is_integer(k)
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.bfMatcher_knnMatch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Finds the best match for each descriptor from a query set.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.


  ##### Return
  - **matches**: `[Evision.DMatch]`.

    Matches. If a query descriptor is masked out in mask , no match is added for this
    descriptor. So, matches size may be smaller than the query descriptors count.



  In the first variant of this method, the train descriptors are passed as an input argument. In the
  second variant of the method, train descriptors collection that was set by DescriptorMatcher::add is
  used. Optional mask (or masks) can be passed to specify which query and training descriptors can be
  matched. Namely, queryDescriptors[i] can be matched with trainDescriptors[j] only if
  mask.at\\<uchar\\>(i,j) is non-zero.


  Python prototype (for reference): 
  ```python3
  match(queryDescriptors, trainDescriptors[, mask]) -> matches
  ```

  """
  @spec match(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.DMatch.t()) | {:error, String.t()}
  def match(self, queryDescriptors, trainDescriptors, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors)
    ]
    :evision_nif.bfMatcher_match(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  Finds the best match for each descriptor from a query set.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.


  ##### Return
  - **matches**: `[Evision.DMatch]`.

    Matches. If a query descriptor is masked out in mask , no match is added for this
    descriptor. So, matches size may be smaller than the query descriptors count.



  In the first variant of this method, the train descriptors are passed as an input argument. In the
  second variant of the method, train descriptors collection that was set by DescriptorMatcher::add is
  used. Optional mask (or masks) can be passed to specify which query and training descriptors can be
  matched. Namely, queryDescriptors[i] can be matched with trainDescriptors[j] only if
  mask.at\\<uchar\\>(i,j) is non-zero.


  Python prototype (for reference): 
  ```python3
  match(queryDescriptors, trainDescriptors[, mask]) -> matches
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].


  ##### Return
  - **matches**: `[Evision.DMatch]`.

    Matches. If a query descriptor is masked out in mask , no match is added for this
    descriptor. So, matches size may be smaller than the query descriptors count.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  match(queryDescriptors[, masks]) -> matches
  ```


  """
  @spec match(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: list(Evision.DMatch.t()) | {:error, String.t()}
  def match(self, queryDescriptors, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors)
    ]
    :evision_nif.bfMatcher_match(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec match(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: list(Evision.DMatch.t()) | {:error, String.t()}
  def match(self, queryDescriptors, trainDescriptors) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors)
    ]
    :evision_nif.bfMatcher_match(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].


  ##### Return
  - **matches**: `[Evision.DMatch]`.

    Matches. If a query descriptor is masked out in mask , no match is added for this
    descriptor. So, matches size may be smaller than the query descriptors count.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  match(queryDescriptors[, masks]) -> matches
  ```

  """
  @spec match(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in()) :: list(Evision.DMatch.t()) | {:error, String.t()}
  def match(self, queryDescriptors) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors)
    ]
    :evision_nif.bfMatcher_match(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  For each query descriptor, finds the training descriptors not farther than the specified distance.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.

  - **maxDistance**: `float`.

    Threshold for the distance between matched descriptors. Distance means here
    metric distance (e.g. Hamming distance), not the distance between coordinates (which is measured
    in Pixels)!


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Found matches.



  For each query descriptor, the methods find such training descriptors that the distance between the
  query descriptor and the training descriptor is equal or smaller than maxDistance. Found matches are
  returned in the distance increasing order.


  Python prototype (for reference): 
  ```python3
  radiusMatch(queryDescriptors, trainDescriptors, maxDistance[, mask[, compactResult]]) -> matches
  ```

  """
  @spec radiusMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), number(), [{atom(), term()},...] | nil) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def radiusMatch(self, queryDescriptors, trainDescriptors, maxDistance, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor)) and is_float(maxDistance) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors),
      maxDistance: Evision.Internal.Structurise.from_struct(maxDistance)
    ]
    :evision_nif.bfMatcher_radiusMatch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  For each query descriptor, finds the training descriptors not farther than the specified distance.

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **trainDescriptors**: `Evision.Mat`.

    Train set of descriptors. This set is not added to the train descriptors
    collection stored in the class object.

  - **maxDistance**: `float`.

    Threshold for the distance between matched descriptors. Distance means here
    metric distance (e.g. Hamming distance), not the distance between coordinates (which is measured
    in Pixels)!


  ##### Keyword Arguments
  - **mask**: `Evision.Mat`.

    Mask specifying permissible matches between an input query and train matrices of
    descriptors.

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Found matches.



  For each query descriptor, the methods find such training descriptors that the distance between the
  query descriptor and the training descriptor is equal or smaller than maxDistance. Found matches are
  returned in the distance increasing order.


  Python prototype (for reference): 
  ```python3
  radiusMatch(queryDescriptors, trainDescriptors, maxDistance[, mask[, compactResult]]) -> matches
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **maxDistance**: `float`.

    Threshold for the distance between matched descriptors. Distance means here
    metric distance (e.g. Hamming distance), not the distance between coordinates (which is measured
    in Pixels)!


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Found matches.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  radiusMatch(queryDescriptors, maxDistance[, masks[, compactResult]]) -> matches
  ```


  """
  @spec radiusMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), number(), [{atom(), term()},...] | nil) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def radiusMatch(self, queryDescriptors, maxDistance, opts) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and is_float(maxDistance) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      maxDistance: Evision.Internal.Structurise.from_struct(maxDistance)
    ]
    :evision_nif.bfMatcher_radiusMatch(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end
  @spec radiusMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), number()) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def radiusMatch(self, queryDescriptors, trainDescriptors, maxDistance) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and (is_struct(trainDescriptors, Evision.Mat) or is_struct(trainDescriptors, Nx.Tensor)) and is_float(maxDistance)
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      trainDescriptors: Evision.Internal.Structurise.from_struct(trainDescriptors),
      maxDistance: Evision.Internal.Structurise.from_struct(maxDistance)
    ]
    :evision_nif.bfMatcher_radiusMatch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **queryDescriptors**: `Evision.Mat`.

    Query set of descriptors.

  - **maxDistance**: `float`.

    Threshold for the distance between matched descriptors. Distance means here
    metric distance (e.g. Hamming distance), not the distance between coordinates (which is measured
    in Pixels)!


  ##### Keyword Arguments
  - **masks**: `[Evision.Mat]`.

    Set of masks. Each masks[i] specifies permissible matches between the input query
    descriptors and stored train descriptors from the i-th image trainDescCollection[i].

  - **compactResult**: `bool`.

    Parameter used when the mask (or masks) is not empty. If compactResult is
    false, the matches vector has the same size as queryDescriptors rows. If compactResult is true,
    the matches vector does not contain matches for fully masked-out query descriptors.


  ##### Return
  - **matches**: `[[Evision.DMatch]]`.

    Found matches.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  radiusMatch(queryDescriptors, maxDistance[, masks[, compactResult]]) -> matches
  ```

  """
  @spec radiusMatch(Evision.BFMatcher.t(), Evision.Mat.maybe_mat_in(), number()) :: list(list(Evision.DMatch.t())) | {:error, String.t()}
  def radiusMatch(self, queryDescriptors, maxDistance) when (is_struct(queryDescriptors, Evision.Mat) or is_struct(queryDescriptors, Nx.Tensor)) and is_float(maxDistance)
  do
    positional = [
      queryDescriptors: Evision.Internal.Structurise.from_struct(queryDescriptors),
      maxDistance: Evision.Internal.Structurise.from_struct(maxDistance)
    ]
    :evision_nif.bfMatcher_radiusMatch(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **arg1**: `Evision.FileNode`



  Python prototype (for reference): 
  ```python3
  read(arg1) -> None
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **fileName**: `String`



  Python prototype (for reference): 
  ```python3
  read(fileName) -> None
  ```


  """
  @spec read(Evision.BFMatcher.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, arg1) when is_struct(arg1, Evision.FileNode)
  do
    positional = [
      arg1: Evision.Internal.Structurise.from_struct(arg1)
    ]
    :evision_nif.bfMatcher_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec read(Evision.BFMatcher.t(), binary()) :: :ok | {:error, String.t()}
  def read(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.bfMatcher_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Trains a descriptor matcher

  Trains a descriptor matcher (for example, the flann index). In all methods to match, the method
  train() is run every time before matching. Some descriptor matchers (for example, BruteForceMatcher)
  have an empty implementation of this method. Other matchers really train their inner structures (for
  example, FlannBasedMatcher trains flann::Index ).

  Python prototype (for reference): 
  ```python3
  train() -> None
  ```

  """
  @spec train(Evision.BFMatcher.t()) :: :ok | {:error, String.t()}
  def train(self) do
    positional = [
    ]
    :evision_nif.bfMatcher_train(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.




  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.BFMatcher.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.bfMatcher_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  #### Variant 1:
  

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.




  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  #### Variant 2:
  

  ##### Positional Arguments
  - **fileName**: `String`



  Python prototype (for reference): 
  ```python3
  write(fileName) -> None
  ```


  """
  @spec write(Evision.BFMatcher.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.bfMatcher_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
  @spec write(Evision.BFMatcher.t(), binary()) :: :ok | {:error, String.t()}
  def write(self, fileName) when is_binary(fileName)
  do
    positional = [
      fileName: Evision.Internal.Structurise.from_struct(fileName)
    ]
    :evision_nif.bfMatcher_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
