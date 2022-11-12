defmodule Evision.ML.SVM do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.SVM` struct.

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
  def __to_struct__({:ok, %{class: :"ML.SVM", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.SVM", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Computes error on the training or test dataset

  ##### Positional Arguments
  - **data**: `Evision.ML.TrainData`.

    the training data

  - **test**: `bool`.

    if true, the error is computed over the test subset of the data, otherwise it's
    computed over the training subset of the data. Please note that if you loaded a completely
    different dataset to evaluate already trained classifier, you will probably want not to set
    the test subset at all with TrainData::setTrainTestSplitRatio and specify test=false, so
    that the error is computed for the whole new set. Yes, this sounds a bit confusing.


  ##### Return
  - **retval**: `float`
  - **resp**: `Evision.Mat`.

    the optional output responses.



  The method uses StatModel::predict to compute the error. For regression models the error is
  computed as RMS, for classifiers - as a percent of missclassified samples (0%-100%).


  Python prototype (for reference): 
  ```python3
  calcError(data, test[, resp]) -> retval, resp
  ```

  """
  @spec calcError(Evision.ML.SVM.t(), Evision.ML.TrainData.t(), boolean(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test, opts) when is_struct(data, Evision.ML.TrainData) and is_boolean(test) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_SVM_calcError(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Computes error on the training or test dataset

  ##### Positional Arguments
  - **data**: `Evision.ML.TrainData`.

    the training data

  - **test**: `bool`.

    if true, the error is computed over the test subset of the data, otherwise it's
    computed over the training subset of the data. Please note that if you loaded a completely
    different dataset to evaluate already trained classifier, you will probably want not to set
    the test subset at all with TrainData::setTrainTestSplitRatio and specify test=false, so
    that the error is computed for the whole new set. Yes, this sounds a bit confusing.


  ##### Return
  - **retval**: `float`
  - **resp**: `Evision.Mat`.

    the optional output responses.



  The method uses StatModel::predict to compute the error. For regression models the error is
  computed as RMS, for classifiers - as a percent of missclassified samples (0%-100%).


  Python prototype (for reference): 
  ```python3
  calcError(data, test[, resp]) -> retval, resp
  ```

  """
  @spec calcError(Evision.ML.SVM.t(), Evision.ML.TrainData.t(), boolean()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test) when is_struct(data, Evision.ML.TrainData) and is_boolean(test)
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_SVM_calcError(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clears the algorithm state


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.ML.SVM.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.ml_SVM_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.ML.SVM`

  Creates empty model.
  Use StatModel::train to train the model. Since %SVM has several parameters, you may want to
  find the best parameters for your problem, it can be done with SVM::trainAuto.

  Python prototype (for reference): 
  ```python3
  create() -> retval
  ```

  """
  @spec create() :: Evision.ML.SVM.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_create_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  empty() -> retval
  ```

  """
  @spec empty(Evision.ML.SVM.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setC/2`

  Python prototype (for reference): 
  ```python3
  getC() -> retval
  ```

  """
  @spec getC(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getC(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getC(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `cv::Mat`

  @see `setClassWeights/2`

  Python prototype (for reference): 
  ```python3
  getClassWeights() -> retval
  ```

  """
  @spec getClassWeights(Evision.ML.SVM.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getClassWeights(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getClassWeights(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setCoef0/2`

  Python prototype (for reference): 
  ```python3
  getCoef0() -> retval
  ```

  """
  @spec getCoef0(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getCoef0(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getCoef0(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Retrieves the decision function

  ##### Positional Arguments
  - **i**: `int`.

    the index of the decision function. If the problem solved is regression, 1-class or
    2-class classification, then there will be just one decision function and the index should
    always be 0. Otherwise, in the case of N-class classification, there will be \\f$N(N-1)/2\\f$
    decision functions.


  ##### Return
  - **retval**: `double`
  - **alpha**: `Evision.Mat`.

    the optional output vector for weights, corresponding to different support vectors.
    In the case of linear %SVM all the alpha's will be 1's.

  - **svidx**: `Evision.Mat`.

    the optional output vector of indices of support vectors within the matrix of
    support vectors (which can be retrieved by SVM::getSupportVectors). In the case of linear
    %SVM each decision function consists of a single "compressed" support vector.



  The method returns rho parameter of the decision function, a scalar subtracted from the weighted
  sum of kernel responses.


  Python prototype (for reference): 
  ```python3
  getDecisionFunction(i[, alpha[, svidx]]) -> retval, alpha, svidx
  ```

  """
  @spec getDecisionFunction(Evision.ML.SVM.t(), integer(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def getDecisionFunction(self, i, opts) when is_integer(i) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      i: Evision.Internal.Structurise.from_struct(i)
    ]
    :evision_nif.ml_ml_SVM_getDecisionFunction(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Retrieves the decision function

  ##### Positional Arguments
  - **i**: `int`.

    the index of the decision function. If the problem solved is regression, 1-class or
    2-class classification, then there will be just one decision function and the index should
    always be 0. Otherwise, in the case of N-class classification, there will be \\f$N(N-1)/2\\f$
    decision functions.


  ##### Return
  - **retval**: `double`
  - **alpha**: `Evision.Mat`.

    the optional output vector for weights, corresponding to different support vectors.
    In the case of linear %SVM all the alpha's will be 1's.

  - **svidx**: `Evision.Mat`.

    the optional output vector of indices of support vectors within the matrix of
    support vectors (which can be retrieved by SVM::getSupportVectors). In the case of linear
    %SVM each decision function consists of a single "compressed" support vector.



  The method returns rho parameter of the decision function, a scalar subtracted from the weighted
  sum of kernel responses.


  Python prototype (for reference): 
  ```python3
  getDecisionFunction(i[, alpha[, svidx]]) -> retval, alpha, svidx
  ```

  """
  @spec getDecisionFunction(Evision.ML.SVM.t(), integer()) :: {number(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def getDecisionFunction(self, i) when is_integer(i)
  do
    positional = [
      i: Evision.Internal.Structurise.from_struct(i)
    ]
    :evision_nif.ml_ml_SVM_getDecisionFunction(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Generates a grid for %SVM parameters.

  ##### Positional Arguments
  - **param_id**: `int`.

    %SVM parameters IDs that must be one of the SVM::ParamTypes. The grid is
    generated for the parameter with this ID.


  ##### Return
  - **retval**: `Evision.ML.ParamGrid`


  The function generates a grid pointer for the specified parameter of the %SVM algorithm.
  The grid may be passed to the function SVM::trainAuto.

  Python prototype (for reference): 
  ```python3
  getDefaultGridPtr(param_id) -> retval
  ```

  """
  @spec getDefaultGridPtr(integer()) :: Evision.ML.ParamGrid.t() | {:error, String.t()}
  def getDefaultGridPtr(param_id) when is_integer(param_id)
  do
    positional = [
      param_id: Evision.Internal.Structurise.from_struct(param_id)
    ]
    :evision_nif.ml_ml_SVM_getDefaultGridPtr_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`

  Returns the algorithm string identifier.
  This string is used as top level xml/yml node tag when the object is saved to a file or string.

  Python prototype (for reference): 
  ```python3
  getDefaultName() -> retval
  ```

  """
  @spec getDefaultName(Evision.ML.SVM.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.ml_SVM_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setDegree/2`

  Python prototype (for reference): 
  ```python3
  getDegree() -> retval
  ```

  """
  @spec getDegree(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getDegree(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getDegree(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setGamma/2`

  Python prototype (for reference): 
  ```python3
  getGamma() -> retval
  ```

  """
  @spec getGamma(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getGamma(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  Type of a %SVM kernel.
  See SVM::KernelTypes. Default value is SVM::RBF.

  Python prototype (for reference): 
  ```python3
  getKernelType() -> retval
  ```

  """
  @spec getKernelType(Evision.ML.SVM.t()) :: integer() | {:error, String.t()}
  def getKernelType(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getKernelType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setNu/2`

  Python prototype (for reference): 
  ```python3
  getNu() -> retval
  ```

  """
  @spec getNu(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getNu(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getNu(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  @see `setP/2`

  Python prototype (for reference): 
  ```python3
  getP() -> retval
  ```

  """
  @spec getP(Evision.ML.SVM.t()) :: number() | {:error, String.t()}
  def getP(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getP(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Retrieves all the support vectors
  ##### Return
  - **retval**: `Evision.Mat`

  The method returns all the support vectors as a floating-point matrix, where support vectors are
  stored as matrix rows.

  Python prototype (for reference): 
  ```python3
  getSupportVectors() -> retval
  ```

  """
  @spec getSupportVectors(Evision.ML.SVM.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getSupportVectors(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getSupportVectors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `cv::TermCriteria`

  @see `setTermCriteria/2`

  Python prototype (for reference): 
  ```python3
  getTermCriteria() -> retval
  ```

  """
  @spec getTermCriteria(Evision.ML.SVM.t()) :: {integer(), integer(), number()} | {:error, String.t()}
  def getTermCriteria(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getTermCriteria(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setType/2`

  Python prototype (for reference): 
  ```python3
  getType() -> retval
  ```

  """
  @spec getType(Evision.ML.SVM.t()) :: integer() | {:error, String.t()}
  def getType(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Retrieves all the uncompressed support vectors of a linear %SVM
  ##### Return
  - **retval**: `Evision.Mat`

  The method returns all the uncompressed support vectors of a linear %SVM that the compressed
  support vector, used for prediction, was derived from. They are returned in a floating-point
  matrix, where the support vectors are stored as matrix rows.

  Python prototype (for reference): 
  ```python3
  getUncompressedSupportVectors() -> retval
  ```

  """
  @spec getUncompressedSupportVectors(Evision.ML.SVM.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getUncompressedSupportVectors(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getUncompressedSupportVectors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns the number of variables in training samples
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  getVarCount() -> retval
  ```

  """
  @spec getVarCount(Evision.ML.SVM.t()) :: integer() | {:error, String.t()}
  def getVarCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_getVarCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if the model is classifier
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isClassifier() -> retval
  ```

  """
  @spec isClassifier(Evision.ML.SVM.t()) :: boolean() | {:error, String.t()}
  def isClassifier(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_isClassifier(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Returns true if the model is trained
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isTrained() -> retval
  ```

  """
  @spec isTrained(Evision.ML.SVM.t()) :: boolean() | {:error, String.t()}
  def isTrained(self) do
    positional = [
    ]
    :evision_nif.ml_ml_SVM_isTrained(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized svm from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized svm


  ##### Return
  - **retval**: `Evision.ML.SVM`

   Use SVM::save to serialize and store an SVM to disk.
   Load the SVM from this file again, by calling this function with the path to the file.


  Python prototype (for reference): 
  ```python3
  load(filepath) -> retval
  ```

  """
  @spec load(binary()) :: Evision.ML.SVM.t() | {:error, String.t()}
  def load(filepath) when is_binary(filepath)
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_SVM_load_static(positional)
    |> __to_struct__()
  end

  @doc """
  Predicts response(s) for the provided sample(s)

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    The input samples, floating-point matrix


  ##### Keyword Arguments
  - **flags**: `int`.

    The optional flags, model-dependent. See cv::ml::StatModel::Flags.


  ##### Return
  - **retval**: `float`
  - **results**: `Evision.Mat`.

    The optional output matrix of results.




  Python prototype (for reference): 
  ```python3
  predict(samples[, results[, flags]]) -> retval, results
  ```

  """
  @spec predict(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_SVM_predict(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Predicts response(s) for the provided sample(s)

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    The input samples, floating-point matrix


  ##### Keyword Arguments
  - **flags**: `int`.

    The optional flags, model-dependent. See cv::ml::StatModel::Flags.


  ##### Return
  - **retval**: `float`
  - **results**: `Evision.Mat`.

    The optional output matrix of results.




  Python prototype (for reference): 
  ```python3
  predict(samples[, results[, flags]]) -> retval, results
  ```

  """
  @spec predict(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_SVM_predict(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Reads algorithm parameters from a file storage

  ##### Positional Arguments
  - **fn_**: `Evision.FileNode`



  Python prototype (for reference): 
  ```python3
  read(fn_) -> None
  ```

  """
  @spec read(Evision.ML.SVM.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, fn_) when is_struct(fn_, Evision.FileNode)
  do
    positional = [
      fn_: Evision.Internal.Structurise.from_struct(fn_)
    ]
    :evision_nif.ml_SVM_read(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **filename**: `String`


  Saves the algorithm to a file.
  In order to make this method work, the derived class must implement Algorithm::write(FileStorage& fs).

  Python prototype (for reference): 
  ```python3
  save(filename) -> None
  ```

  """
  @spec save(Evision.ML.SVM.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.ml_SVM_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getC/1`

  Python prototype (for reference): 
  ```python3
  setC(val) -> None
  ```

  """
  @spec setC(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setC(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setC(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `Evision.Mat`


  @see `getClassWeights/1`

  Python prototype (for reference): 
  ```python3
  setClassWeights(val) -> None
  ```

  """
  @spec setClassWeights(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setClassWeights(self, val) when (is_struct(val, Evision.Mat) or is_struct(val, Nx.Tensor))
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setClassWeights(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getCoef0/1`

  Python prototype (for reference): 
  ```python3
  setCoef0(val) -> None
  ```

  """
  @spec setCoef0(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setCoef0(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setCoef0(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getDegree/1`

  Python prototype (for reference): 
  ```python3
  setDegree(val) -> None
  ```

  """
  @spec setDegree(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setDegree(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setDegree(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getGamma/1`

  Python prototype (for reference): 
  ```python3
  setGamma(val) -> None
  ```

  """
  @spec setGamma(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setGamma(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setGamma(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **kernelType**: `int`


  Initialize with one of predefined kernels.
  See SVM::KernelTypes.

  Python prototype (for reference): 
  ```python3
  setKernel(kernelType) -> None
  ```

  """
  @spec setKernel(Evision.ML.SVM.t(), integer()) :: :ok | {:error, String.t()}
  def setKernel(self, kernelType) when is_integer(kernelType)
  do
    positional = [
      kernelType: Evision.Internal.Structurise.from_struct(kernelType)
    ]
    :evision_nif.ml_ml_SVM_setKernel(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getNu/1`

  Python prototype (for reference): 
  ```python3
  setNu(val) -> None
  ```

  """
  @spec setNu(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setNu(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setNu(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `double`


  @see `getP/1`

  Python prototype (for reference): 
  ```python3
  setP(val) -> None
  ```

  """
  @spec setP(Evision.ML.SVM.t(), number()) :: :ok | {:error, String.t()}
  def setP(self, val) when is_number(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setP(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `TermCriteria`


  @see `getTermCriteria/1`

  Python prototype (for reference): 
  ```python3
  setTermCriteria(val) -> None
  ```

  """
  @spec setTermCriteria(Evision.ML.SVM.t(), {integer(), integer(), number()}) :: :ok | {:error, String.t()}
  def setTermCriteria(self, val) when is_tuple(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setTermCriteria(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getType/1`

  Python prototype (for reference): 
  ```python3
  setType(val) -> None
  ```

  """
  @spec setType(Evision.ML.SVM.t(), integer()) :: :ok | {:error, String.t()}
  def setType(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_SVM_setType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Trains the statistical model

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    training samples

  - **layout**: `int`.

    See ml::SampleTypes.

  - **responses**: `Evision.Mat`.

    vector of responses associated with the training samples.


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  train(samples, layout, responses) -> retval
  ```

  """
  @spec train(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: boolean() | {:error, String.t()}
  def train(self, samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_SVM_train(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Trains the statistical model

  ##### Positional Arguments
  - **trainData**: `Evision.ML.TrainData`.

    training data that can be loaded from file using TrainData::loadFromCSV or
    created with TrainData::create.


  ##### Keyword Arguments
  - **flags**: `int`.

    optional flags, depending on the model. Some of the models can be updated with the
    new training samples, not completely overwritten (such as NormalBayesClassifier or ANN_MLP).


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  train(trainData[, flags]) -> retval
  ```

  """
  @spec train(Evision.ML.SVM.t(), Evision.ML.TrainData.t(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def train(self, trainData, opts) when is_struct(trainData, Evision.ML.TrainData) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_SVM_train(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Trains the statistical model

  ##### Positional Arguments
  - **trainData**: `Evision.ML.TrainData`.

    training data that can be loaded from file using TrainData::loadFromCSV or
    created with TrainData::create.


  ##### Keyword Arguments
  - **flags**: `int`.

    optional flags, depending on the model. Some of the models can be updated with the
    new training samples, not completely overwritten (such as NormalBayesClassifier or ANN_MLP).


  ##### Return
  - **retval**: `bool`



  Python prototype (for reference): 
  ```python3
  train(trainData[, flags]) -> retval
  ```

  """
  @spec train(Evision.ML.SVM.t(), Evision.ML.TrainData.t()) :: boolean() | {:error, String.t()}
  def train(self, trainData) when is_struct(trainData, Evision.ML.TrainData)
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_SVM_train(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Trains an %SVM with optimal parameters

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    training samples

  - **layout**: `int`.

    See ml::SampleTypes.

  - **responses**: `Evision.Mat`.

    vector of responses associated with the training samples.


  ##### Keyword Arguments
  - **kFold**: `int`.

    Cross-validation parameter. The training set is divided into kFold subsets. One
    subset is used to test the model, the others form the train set. So, the %SVM algorithm is

  - **cgrid**: `Evision.ML.ParamGrid`.
  - **gammaGrid**: `Evision.ML.ParamGrid`.

    grid for gamma

  - **pGrid**: `Evision.ML.ParamGrid`.
  - **nuGrid**: `Evision.ML.ParamGrid`.
  - **coeffGrid**: `Evision.ML.ParamGrid`.

    grid for coeff

  - **degreeGrid**: `Evision.ML.ParamGrid`.

    grid for degree

  - **balanced**: `bool`.

    If true and the problem is 2-class classification then the method creates more
    balanced cross-validation subsets that is proportions between classes in subsets are close
    to such proportion in the whole train dataset.


  ##### Return
  - **retval**: `bool`


  The method trains the %SVM model automatically by choosing the optimal parameters C, gamma, p,
  nu, coef0, degree. Parameters are considered optimal when the cross-validation
  estimate of the test set error is minimal.
  This function only makes use of SVM::getDefaultGrid for parameter optimization and thus only
  offers rudimentary parameter options.
  This function works for the classification (SVM::C_SVC or SVM::NU_SVC) as well as for the
  regression (SVM::EPS_SVR or SVM::NU_SVR). If it is SVM::ONE_CLASS, no optimization is made and
  the usual %SVM with parameters specified in params is executed.


  Python prototype (for reference): 
  ```python3
  trainAuto(samples, layout, responses[, kFold[, Cgrid[, gammaGrid[, pGrid[, nuGrid[, coeffGrid[, degreeGrid[, balanced]]]]]]]]) -> retval
  ```

  """
  @spec trainAuto(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def trainAuto(self, samples, layout, responses, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_SVM_trainAuto(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Trains an %SVM with optimal parameters

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    training samples

  - **layout**: `int`.

    See ml::SampleTypes.

  - **responses**: `Evision.Mat`.

    vector of responses associated with the training samples.


  ##### Keyword Arguments
  - **kFold**: `int`.

    Cross-validation parameter. The training set is divided into kFold subsets. One
    subset is used to test the model, the others form the train set. So, the %SVM algorithm is

  - **cgrid**: `Evision.ML.ParamGrid`.
  - **gammaGrid**: `Evision.ML.ParamGrid`.

    grid for gamma

  - **pGrid**: `Evision.ML.ParamGrid`.
  - **nuGrid**: `Evision.ML.ParamGrid`.
  - **coeffGrid**: `Evision.ML.ParamGrid`.

    grid for coeff

  - **degreeGrid**: `Evision.ML.ParamGrid`.

    grid for degree

  - **balanced**: `bool`.

    If true and the problem is 2-class classification then the method creates more
    balanced cross-validation subsets that is proportions between classes in subsets are close
    to such proportion in the whole train dataset.


  ##### Return
  - **retval**: `bool`


  The method trains the %SVM model automatically by choosing the optimal parameters C, gamma, p,
  nu, coef0, degree. Parameters are considered optimal when the cross-validation
  estimate of the test set error is minimal.
  This function only makes use of SVM::getDefaultGrid for parameter optimization and thus only
  offers rudimentary parameter options.
  This function works for the classification (SVM::C_SVC or SVM::NU_SVC) as well as for the
  regression (SVM::EPS_SVR or SVM::NU_SVR). If it is SVM::ONE_CLASS, no optimization is made and
  the usual %SVM with parameters specified in params is executed.


  Python prototype (for reference): 
  ```python3
  trainAuto(samples, layout, responses[, kFold[, Cgrid[, gammaGrid[, pGrid[, nuGrid[, coeffGrid[, degreeGrid[, balanced]]]]]]]]) -> retval
  ```

  """
  @spec trainAuto(Evision.ML.SVM.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: boolean() | {:error, String.t()}
  def trainAuto(self, samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_SVM_trainAuto(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  simplified API for language bindings

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.ML.SVM.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_SVM_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  simplified API for language bindings

  ##### Positional Arguments
  - **fs**: `Evision.FileStorage`

  ##### Keyword Arguments
  - **name**: `String`.


  Has overloading in C++



  Python prototype (for reference): 
  ```python3
  write(fs[, name]) -> None
  ```

  """
  @spec write(Evision.ML.SVM.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_SVM_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
