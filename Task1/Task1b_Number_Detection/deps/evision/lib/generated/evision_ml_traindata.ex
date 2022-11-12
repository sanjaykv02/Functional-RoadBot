defmodule Evision.ML.TrainData do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.TrainData` struct.

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
  def __to_struct__({:ok, %{class: :"ML.TrainData", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.TrainData", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Creates training data from in-memory arrays.

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    matrix of samples. It should have CV_32F type.

  - **layout**: `int`.

    see ml::SampleTypes.

  - **responses**: `Evision.Mat`.

    matrix of responses. If the responses are scalar, they should be stored as a
    single row or as a single column. The matrix should have type CV_32F or CV_32S (in the
    former case the responses are considered as ordered by default; in the latter case - as
    categorical)


  ##### Keyword Arguments
  - **varIdx**: `Evision.Mat`.

    vector specifying which variables to use for training. It can be an integer vector
    (CV_32S) containing 0-based variable indices or byte vector (CV_8U) containing a mask of
    active variables.

  - **sampleIdx**: `Evision.Mat`.

    vector specifying which samples to use for training. It can be an integer
    vector (CV_32S) containing 0-based sample indices or byte vector (CV_8U) containing a mask
    of training samples.

  - **sampleWeights**: `Evision.Mat`.

    optional vector with weights for each sample. It should have CV_32F type.

  - **varType**: `Evision.Mat`.

    optional vector of type CV_8U and size `<number_of_variables_in_samples> +
    <number_of_variables_in_responses>`, containing types of each input and output variable. See
    ml::VariableTypes.


  ##### Return
  - **retval**: `Evision.ML.TrainData`



  Python prototype (for reference): 
  ```python3
  create(samples, layout, responses[, varIdx[, sampleIdx[, sampleWeights[, varType]]]]) -> retval
  ```

  """
  @spec create(Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: Evision.ML.TrainData.t() | {:error, String.t()}
  def create(samples, layout, responses, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_TrainData_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates training data from in-memory arrays.

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    matrix of samples. It should have CV_32F type.

  - **layout**: `int`.

    see ml::SampleTypes.

  - **responses**: `Evision.Mat`.

    matrix of responses. If the responses are scalar, they should be stored as a
    single row or as a single column. The matrix should have type CV_32F or CV_32S (in the
    former case the responses are considered as ordered by default; in the latter case - as
    categorical)


  ##### Keyword Arguments
  - **varIdx**: `Evision.Mat`.

    vector specifying which variables to use for training. It can be an integer vector
    (CV_32S) containing 0-based variable indices or byte vector (CV_8U) containing a mask of
    active variables.

  - **sampleIdx**: `Evision.Mat`.

    vector specifying which samples to use for training. It can be an integer
    vector (CV_32S) containing 0-based sample indices or byte vector (CV_8U) containing a mask
    of training samples.

  - **sampleWeights**: `Evision.Mat`.

    optional vector with weights for each sample. It should have CV_32F type.

  - **varType**: `Evision.Mat`.

    optional vector of type CV_8U and size `<number_of_variables_in_samples> +
    <number_of_variables_in_responses>`, containing types of each input and output variable. See
    ml::VariableTypes.


  ##### Return
  - **retval**: `Evision.ML.TrainData`



  Python prototype (for reference): 
  ```python3
  create(samples, layout, responses[, varIdx[, sampleIdx[, sampleWeights[, varType]]]]) -> retval
  ```

  """
  @spec create(Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: Evision.ML.TrainData.t() | {:error, String.t()}
  def create(samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_TrainData_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **vi**: `int`

  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getCatCount(vi) -> retval
  ```

  """
  @spec getCatCount(Evision.ML.TrainData.t(), integer()) :: integer() | {:error, String.t()}
  def getCatCount(self, vi) when is_integer(vi)
  do
    positional = [
      vi: Evision.Internal.Structurise.from_struct(vi)
    ]
    :evision_nif.ml_ml_TrainData_getCatCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getCatMap() -> retval
  ```

  """
  @spec getCatMap(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getCatMap(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getCatMap(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getCatOfs() -> retval
  ```

  """
  @spec getCatOfs(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getCatOfs(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getCatOfs(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the vector of class labels
  ##### Return
  - **retval**: `Evision.Mat`

  The function returns vector of unique labels occurred in the responses.

  Python prototype (for reference): 
  ```python3
  getClassLabels() -> retval
  ```

  """
  @spec getClassLabels(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getClassLabels(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getClassLabels(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getDefaultSubstValues() -> retval
  ```

  """
  @spec getDefaultSubstValues(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getDefaultSubstValues(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getDefaultSubstValues(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getLayout() -> retval
  ```

  """
  @spec getLayout(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getLayout(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getLayout(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getMissing() -> retval
  ```

  """
  @spec getMissing(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getMissing(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getMissing(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNAllVars() -> retval
  ```

  """
  @spec getNAllVars(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getNAllVars(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNAllVars(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNSamples() -> retval
  ```

  """
  @spec getNSamples(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getNSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNTestSamples() -> retval
  ```

  """
  @spec getNTestSamples(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getNTestSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNTestSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNTrainSamples() -> retval
  ```

  """
  @spec getNTrainSamples(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getNTrainSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNTrainSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getNVars() -> retval
  ```

  """
  @spec getNVars(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getNVars(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNVars(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns vector of symbolic names captured in loadFromCSV()

  ##### Positional Arguments
  - **names**: `[String]`



  Python prototype (for reference): 
  ```python3
  getNames(names) -> None
  ```

  """
  @spec getNames(Evision.ML.TrainData.t(), list(binary())) :: :ok | {:error, String.t()}
  def getNames(self, names) when is_list(names)
  do
    positional = [
      names: Evision.Internal.Structurise.from_struct(names)
    ]
    :evision_nif.ml_ml_TrainData_getNames(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getNormCatResponses() -> retval
  ```

  """
  @spec getNormCatResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getNormCatResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getNormCatResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getResponseType() -> retval
  ```

  """
  @spec getResponseType(Evision.ML.TrainData.t()) :: integer() | {:error, String.t()}
  def getResponseType(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getResponseType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getResponses() -> retval
  ```

  """
  @spec getResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **varIdx**: `Evision.Mat`
  - **sidx**: `int`
  - **buf**: `float*`



  Python prototype (for reference): 
  ```python3
  getSample(varIdx, sidx, buf) -> None
  ```

  """
  @spec getSample(Evision.ML.TrainData.t(), Evision.Mat.maybe_mat_in(), integer(), number()) :: :ok | {:error, String.t()}
  def getSample(self, varIdx, sidx, buf) when (is_struct(varIdx, Evision.Mat) or is_struct(varIdx, Nx.Tensor)) and is_integer(sidx)
  do
    positional = [
      varIdx: Evision.Internal.Structurise.from_struct(varIdx),
      sidx: Evision.Internal.Structurise.from_struct(sidx),
      buf: Evision.Internal.Structurise.from_struct(buf)
    ]
    :evision_nif.ml_ml_TrainData_getSample(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getSampleWeights() -> retval
  ```

  """
  @spec getSampleWeights(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getSampleWeights(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getSampleWeights(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getSamples() -> retval
  ```

  """
  @spec getSamples(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Extract from matrix rows/cols specified by passed indexes.

  ##### Positional Arguments
  - **matrix**: `Evision.Mat`.

    input matrix (supported types: CV_32S, CV_32F, CV_64F)

  - **idx**: `Evision.Mat`.

    1D index vector

  - **layout**: `int`.

    specifies to extract rows (cv::ml::ROW_SAMPLES) or to extract columns (cv::ml::COL_SAMPLES)


  ##### Return
  - **retval**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  getSubMatrix(matrix, idx, layout) -> retval
  ```

  """
  @spec getSubMatrix(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def getSubMatrix(matrix, idx, layout) when (is_struct(matrix, Evision.Mat) or is_struct(matrix, Nx.Tensor)) and (is_struct(idx, Evision.Mat) or is_struct(idx, Nx.Tensor)) and is_integer(layout)
  do
    positional = [
      matrix: Evision.Internal.Structurise.from_struct(matrix),
      idx: Evision.Internal.Structurise.from_struct(idx),
      layout: Evision.Internal.Structurise.from_struct(layout)
    ]
    :evision_nif.ml_ml_TrainData_getSubMatrix_static(positional)
    |> __to_struct__()
  end

  @doc """
  Extract from 1D vector elements specified by passed indexes.

  ##### Positional Arguments
  - **vec**: `Evision.Mat`.

    input vector (supported types: CV_32S, CV_32F, CV_64F)

  - **idx**: `Evision.Mat`.

    1D index vector


  ##### Return
  - **retval**: `Evision.Mat`



  Python prototype (for reference): 
  ```python3
  getSubVector(vec, idx) -> retval
  ```

  """
  @spec getSubVector(Evision.Mat.maybe_mat_in(), Evision.Mat.maybe_mat_in()) :: Evision.Mat.t() | {:error, String.t()}
  def getSubVector(vec, idx) when (is_struct(vec, Evision.Mat) or is_struct(vec, Nx.Tensor)) and (is_struct(idx, Evision.Mat) or is_struct(idx, Nx.Tensor))
  do
    positional = [
      vec: Evision.Internal.Structurise.from_struct(vec),
      idx: Evision.Internal.Structurise.from_struct(idx)
    ]
    :evision_nif.ml_ml_TrainData_getSubVector_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTestNormCatResponses() -> retval
  ```

  """
  @spec getTestNormCatResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTestNormCatResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTestNormCatResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTestResponses() -> retval
  ```

  """
  @spec getTestResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTestResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTestResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTestSampleIdx() -> retval
  ```

  """
  @spec getTestSampleIdx(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTestSampleIdx(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTestSampleIdx(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTestSampleWeights() -> retval
  ```

  """
  @spec getTestSampleWeights(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTestSampleWeights(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTestSampleWeights(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns matrix of test samples
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTestSamples() -> retval
  ```

  """
  @spec getTestSamples(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTestSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTestSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the vector of normalized categorical responses
  ##### Return
  - **retval**: `Evision.Mat`

  The function returns vector of responses. Each response is integer from `0` to `<number of
  classes>-1`. The actual label value can be retrieved then from the class label vector, see
  TrainData::getClassLabels.

  Python prototype (for reference): 
  ```python3
  getTrainNormCatResponses() -> retval
  ```

  """
  @spec getTrainNormCatResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTrainNormCatResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTrainNormCatResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the vector of responses
  ##### Return
  - **retval**: `Evision.Mat`

  The function returns ordered or the original categorical responses. Usually it's used in
  regression algorithms.

  Python prototype (for reference): 
  ```python3
  getTrainResponses() -> retval
  ```

  """
  @spec getTrainResponses(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTrainResponses(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTrainResponses(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTrainSampleIdx() -> retval
  ```

  """
  @spec getTrainSampleIdx(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTrainSampleIdx(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTrainSampleIdx(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getTrainSampleWeights() -> retval
  ```

  """
  @spec getTrainSampleWeights(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTrainSampleWeights(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTrainSampleWeights(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns matrix of train samples
  ##### Keyword Arguments
  - **layout**: `int`.

    The requested layout. If it's different from the initial one, the matrix is
    transposed. See ml::SampleTypes.

  - **compressSamples**: `bool`.

    if true, the function returns only the training samples (specified by
    sampleIdx)

  - **compressVars**: `bool`.

    if true, the function returns the shorter training samples, containing only
    the active variables.


  ##### Return
  - **retval**: `Evision.Mat`


  In current implementation the function tries to avoid physical data copying and returns the
  matrix stored inside TrainData (unless the transposition or compression is needed).


  Python prototype (for reference): 
  ```python3
  getTrainSamples([, layout[, compressSamples[, compressVars]]]) -> retval
  ```

  """
  @spec getTrainSamples(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getTrainSamples(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getTrainSamples(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **vi**: `int`
  - **sidx**: `Evision.Mat`
  - **values**: `float*`



  Python prototype (for reference): 
  ```python3
  getValues(vi, sidx, values) -> None
  ```

  """
  @spec getValues(Evision.ML.TrainData.t(), integer(), Evision.Mat.maybe_mat_in(), number()) :: :ok | {:error, String.t()}
  def getValues(self, vi, sidx, values) when is_integer(vi) and (is_struct(sidx, Evision.Mat) or is_struct(sidx, Nx.Tensor))
  do
    positional = [
      vi: Evision.Internal.Structurise.from_struct(vi),
      sidx: Evision.Internal.Structurise.from_struct(sidx),
      values: Evision.Internal.Structurise.from_struct(values)
    ]
    :evision_nif.ml_ml_TrainData_getValues(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getVarIdx() -> retval
  ```

  """
  @spec getVarIdx(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getVarIdx(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getVarIdx(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getVarSymbolFlags() -> retval
  ```

  """
  @spec getVarSymbolFlags(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getVarSymbolFlags(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getVarSymbolFlags(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`


  Python prototype (for reference): 
  ```python3
  getVarType() -> retval
  ```

  """
  @spec getVarType(Evision.ML.TrainData.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getVarType(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_getVarType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Splits the training data into the training and test parts

  ##### Positional Arguments
  - **count**: `int`

  ##### Keyword Arguments
  - **shuffle**: `bool`.


  @sa TrainData::setTrainTestSplitRatio


  Python prototype (for reference): 
  ```python3
  setTrainTestSplit(count[, shuffle]) -> None
  ```

  """
  @spec setTrainTestSplit(Evision.ML.TrainData.t(), integer(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def setTrainTestSplit(self, count, opts) when is_integer(count) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      count: Evision.Internal.Structurise.from_struct(count)
    ]
    :evision_nif.ml_ml_TrainData_setTrainTestSplit(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Splits the training data into the training and test parts

  ##### Positional Arguments
  - **count**: `int`

  ##### Keyword Arguments
  - **shuffle**: `bool`.


  @sa TrainData::setTrainTestSplitRatio


  Python prototype (for reference): 
  ```python3
  setTrainTestSplit(count[, shuffle]) -> None
  ```

  """
  @spec setTrainTestSplit(Evision.ML.TrainData.t(), integer()) :: :ok | {:error, String.t()}
  def setTrainTestSplit(self, count) when is_integer(count)
  do
    positional = [
      count: Evision.Internal.Structurise.from_struct(count)
    ]
    :evision_nif.ml_ml_TrainData_setTrainTestSplit(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Splits the training data into the training and test parts

  ##### Positional Arguments
  - **ratio**: `double`

  ##### Keyword Arguments
  - **shuffle**: `bool`.


  The function selects a subset of specified relative size and then returns it as the training
  set. If the function is not called, all the data is used for training. Please, note that for
  each of TrainData::getTrain\\* there is corresponding TrainData::getTest\\*, so that the test
  subset can be retrieved and processed as well.
  @sa TrainData::setTrainTestSplit


  Python prototype (for reference): 
  ```python3
  setTrainTestSplitRatio(ratio[, shuffle]) -> None
  ```

  """
  @spec setTrainTestSplitRatio(Evision.ML.TrainData.t(), number(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def setTrainTestSplitRatio(self, ratio, opts) when is_number(ratio) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      ratio: Evision.Internal.Structurise.from_struct(ratio)
    ]
    :evision_nif.ml_ml_TrainData_setTrainTestSplitRatio(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Splits the training data into the training and test parts

  ##### Positional Arguments
  - **ratio**: `double`

  ##### Keyword Arguments
  - **shuffle**: `bool`.


  The function selects a subset of specified relative size and then returns it as the training
  set. If the function is not called, all the data is used for training. Please, note that for
  each of TrainData::getTrain\\* there is corresponding TrainData::getTest\\*, so that the test
  subset can be retrieved and processed as well.
  @sa TrainData::setTrainTestSplit


  Python prototype (for reference): 
  ```python3
  setTrainTestSplitRatio(ratio[, shuffle]) -> None
  ```

  """
  @spec setTrainTestSplitRatio(Evision.ML.TrainData.t(), number()) :: :ok | {:error, String.t()}
  def setTrainTestSplitRatio(self, ratio) when is_number(ratio)
  do
    positional = [
      ratio: Evision.Internal.Structurise.from_struct(ratio)
    ]
    :evision_nif.ml_ml_TrainData_setTrainTestSplitRatio(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  


  Python prototype (for reference): 
  ```python3
  shuffleTrainTest() -> None
  ```

  """
  @spec shuffleTrainTest(Evision.ML.TrainData.t()) :: :ok | {:error, String.t()}
  def shuffleTrainTest(self) do
    positional = [
    ]
    :evision_nif.ml_ml_TrainData_shuffleTrainTest(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
