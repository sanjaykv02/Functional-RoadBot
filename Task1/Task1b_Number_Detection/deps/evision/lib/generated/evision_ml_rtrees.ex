defmodule Evision.ML.RTrees do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.RTrees` struct.

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
  def __to_struct__({:ok, %{class: :"ML.RTrees", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.RTrees", ref: ref}) do
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
  @spec calcError(Evision.ML.RTrees.t(), Evision.ML.TrainData.t(), boolean(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test, opts) when is_struct(data, Evision.ML.TrainData) and is_boolean(test) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_RTrees_calcError(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec calcError(Evision.ML.RTrees.t(), Evision.ML.TrainData.t(), boolean()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test) when is_struct(data, Evision.ML.TrainData) and is_boolean(test)
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_RTrees_calcError(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clears the algorithm state


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.ML.RTrees.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.ml_RTrees_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.ML.RTrees`

  Creates the empty model.
  Use StatModel::train to train the model, StatModel::train to create and train the model,
  Algorithm::load to load the pre-trained model.

  Python prototype (for reference): 
  ```python3
  create() -> retval
  ```

  """
  @spec create() :: Evision.ML.RTrees.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_create_static(positional)
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
  @spec empty(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setActiveVarCount/2`

  Python prototype (for reference): 
  ```python3
  getActiveVarCount() -> retval
  ```

  """
  @spec getActiveVarCount(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getActiveVarCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getActiveVarCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setCVFolds/2`

  Python prototype (for reference): 
  ```python3
  getCVFolds() -> retval
  ```

  """
  @spec getCVFolds(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getCVFolds(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getCVFolds(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @see `setCalculateVarImportance/2`

  Python prototype (for reference): 
  ```python3
  getCalculateVarImportance() -> retval
  ```

  """
  @spec getCalculateVarImportance(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def getCalculateVarImportance(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getCalculateVarImportance(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.ML.RTrees.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.ml_RTrees_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setMaxCategories/2`

  Python prototype (for reference): 
  ```python3
  getMaxCategories() -> retval
  ```

  """
  @spec getMaxCategories(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getMaxCategories(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getMaxCategories(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setMaxDepth/2`

  Python prototype (for reference): 
  ```python3
  getMaxDepth() -> retval
  ```

  """
  @spec getMaxDepth(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getMaxDepth(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getMaxDepth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setMinSampleCount/2`

  Python prototype (for reference): 
  ```python3
  getMinSampleCount() -> retval
  ```

  """
  @spec getMinSampleCount(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getMinSampleCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getMinSampleCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `double`

  Returns the OOB error value, computed at the training stage when calcOOBError is set to true.
   If this flag was set to false, 0 is returned. The OOB error is also scaled by sample weighting.

  Python prototype (for reference): 
  ```python3
  getOOBError() -> retval
  ```

  """
  @spec getOOBError(Evision.ML.RTrees.t()) :: number() | {:error, String.t()}
  def getOOBError(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getOOBError(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `cv::Mat`

  @see `setPriors/2`

  Python prototype (for reference): 
  ```python3
  getPriors() -> retval
  ```

  """
  @spec getPriors(Evision.ML.RTrees.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getPriors(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getPriors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `float`

  @see `setRegressionAccuracy/2`

  Python prototype (for reference): 
  ```python3
  getRegressionAccuracy() -> retval
  ```

  """
  @spec getRegressionAccuracy(Evision.ML.RTrees.t()) :: number() | {:error, String.t()}
  def getRegressionAccuracy(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getRegressionAccuracy(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `TermCriteria`

  @see `setTermCriteria/2`

  Python prototype (for reference): 
  ```python3
  getTermCriteria() -> retval
  ```

  """
  @spec getTermCriteria(Evision.ML.RTrees.t()) :: {integer(), integer(), number()} | {:error, String.t()}
  def getTermCriteria(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getTermCriteria(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @see `setTruncatePrunedTree/2`

  Python prototype (for reference): 
  ```python3
  getTruncatePrunedTree() -> retval
  ```

  """
  @spec getTruncatePrunedTree(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def getTruncatePrunedTree(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getTruncatePrunedTree(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @see `setUse1SERule/2`

  Python prototype (for reference): 
  ```python3
  getUse1SERule() -> retval
  ```

  """
  @spec getUse1SERule(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def getUse1SERule(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getUse1SERule(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @see `setUseSurrogates/2`

  Python prototype (for reference): 
  ```python3
  getUseSurrogates() -> retval
  ```

  """
  @spec getUseSurrogates(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def getUseSurrogates(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getUseSurrogates(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getVarCount(Evision.ML.RTrees.t()) :: integer() | {:error, String.t()}
  def getVarCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getVarCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.Mat`

  Returns the variable importance array.
  The method returns the variable importance vector, computed at the training stage when
  CalculateVarImportance is set to true. If this flag was set to false, the empty matrix is
  returned.

  Python prototype (for reference): 
  ```python3
  getVarImportance() -> retval
  ```

  """
  @spec getVarImportance(Evision.ML.RTrees.t()) :: Evision.Mat.t() | {:error, String.t()}
  def getVarImportance(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_getVarImportance(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    Array containing the samples for which votes will be calculated.

  - **flags**: `int`.

    Flags for defining the type of RTrees.


  ##### Return
  - **results**: `Evision.Mat`.

    Array where the result of the calculation will be written.


  Returns the result of each individual tree in the forest.
  In case the model is a regression problem, the method will return each of the trees'
  results for each of the sample cases. If the model is a classifier, it will return
  a Mat with samples + 1 rows, where the first row gives the class number and the
  following rows return the votes each class had for each sample.


  Python prototype (for reference): 
  ```python3
  getVotes(samples, flags[, results]) -> results
  ```

  """
  @spec getVotes(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: Evision.Mat.t() | {:error, String.t()}
  def getVotes(self, samples, flags, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(flags) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      flags: Evision.Internal.Structurise.from_struct(flags)
    ]
    :evision_nif.ml_ml_RTrees_getVotes(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    Array containing the samples for which votes will be calculated.

  - **flags**: `int`.

    Flags for defining the type of RTrees.


  ##### Return
  - **results**: `Evision.Mat`.

    Array where the result of the calculation will be written.


  Returns the result of each individual tree in the forest.
  In case the model is a regression problem, the method will return each of the trees'
  results for each of the sample cases. If the model is a classifier, it will return
  a Mat with samples + 1 rows, where the first row gives the class number and the
  following rows return the votes each class had for each sample.


  Python prototype (for reference): 
  ```python3
  getVotes(samples, flags[, results]) -> results
  ```

  """
  @spec getVotes(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in(), integer()) :: Evision.Mat.t() | {:error, String.t()}
  def getVotes(self, samples, flags) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(flags)
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      flags: Evision.Internal.Structurise.from_struct(flags)
    ]
    :evision_nif.ml_ml_RTrees_getVotes(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isClassifier(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def isClassifier(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_isClassifier(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isTrained(Evision.ML.RTrees.t()) :: boolean() | {:error, String.t()}
  def isTrained(self) do
    positional = [
    ]
    :evision_nif.ml_ml_RTrees_isTrained(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized RTree from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized RTree


  ##### Keyword Arguments
  - **nodeName**: `String`.

    name of node containing the classifier


  ##### Return
  - **retval**: `Evision.ML.RTrees`

   Use RTree::save to serialize and store an RTree to disk.
   Load the RTree from this file again, by calling this function with the path to the file.
   Optionally specify the node for the file containing the classifier


  Python prototype (for reference): 
  ```python3
  load(filepath[, nodeName]) -> retval
  ```

  """
  @spec load(binary(), [{atom(), term()},...] | nil) :: Evision.ML.RTrees.t() | {:error, String.t()}
  def load(filepath, opts) when is_binary(filepath) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_RTrees_load_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized RTree from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized RTree


  ##### Keyword Arguments
  - **nodeName**: `String`.

    name of node containing the classifier


  ##### Return
  - **retval**: `Evision.ML.RTrees`

   Use RTree::save to serialize and store an RTree to disk.
   Load the RTree from this file again, by calling this function with the path to the file.
   Optionally specify the node for the file containing the classifier


  Python prototype (for reference): 
  ```python3
  load(filepath[, nodeName]) -> retval
  ```

  """
  @spec load(binary()) :: Evision.ML.RTrees.t() | {:error, String.t()}
  def load(filepath) when is_binary(filepath)
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_RTrees_load_static(positional)
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
  @spec predict(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_RTrees_predict(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec predict(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_RTrees_predict(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.ML.RTrees.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, fn_) when is_struct(fn_, Evision.FileNode)
  do
    positional = [
      fn_: Evision.Internal.Structurise.from_struct(fn_)
    ]
    :evision_nif.ml_RTrees_read(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec save(Evision.ML.RTrees.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.ml_RTrees_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getActiveVarCount/1`

  Python prototype (for reference): 
  ```python3
  setActiveVarCount(val) -> None
  ```

  """
  @spec setActiveVarCount(Evision.ML.RTrees.t(), integer()) :: :ok | {:error, String.t()}
  def setActiveVarCount(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setActiveVarCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getCVFolds/1`

  Python prototype (for reference): 
  ```python3
  setCVFolds(val) -> None
  ```

  """
  @spec setCVFolds(Evision.ML.RTrees.t(), integer()) :: :ok | {:error, String.t()}
  def setCVFolds(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setCVFolds(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getCalculateVarImportance/1`

  Python prototype (for reference): 
  ```python3
  setCalculateVarImportance(val) -> None
  ```

  """
  @spec setCalculateVarImportance(Evision.ML.RTrees.t(), boolean()) :: :ok | {:error, String.t()}
  def setCalculateVarImportance(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setCalculateVarImportance(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getMaxCategories/1`

  Python prototype (for reference): 
  ```python3
  setMaxCategories(val) -> None
  ```

  """
  @spec setMaxCategories(Evision.ML.RTrees.t(), integer()) :: :ok | {:error, String.t()}
  def setMaxCategories(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setMaxCategories(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getMaxDepth/1`

  Python prototype (for reference): 
  ```python3
  setMaxDepth(val) -> None
  ```

  """
  @spec setMaxDepth(Evision.ML.RTrees.t(), integer()) :: :ok | {:error, String.t()}
  def setMaxDepth(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setMaxDepth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getMinSampleCount/1`

  Python prototype (for reference): 
  ```python3
  setMinSampleCount(val) -> None
  ```

  """
  @spec setMinSampleCount(Evision.ML.RTrees.t(), integer()) :: :ok | {:error, String.t()}
  def setMinSampleCount(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setMinSampleCount(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `Evision.Mat`


  @see `getPriors/1`

  Python prototype (for reference): 
  ```python3
  setPriors(val) -> None
  ```

  """
  @spec setPriors(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in()) :: :ok | {:error, String.t()}
  def setPriors(self, val) when (is_struct(val, Evision.Mat) or is_struct(val, Nx.Tensor))
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setPriors(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `float`


  @see `getRegressionAccuracy/1`

  Python prototype (for reference): 
  ```python3
  setRegressionAccuracy(val) -> None
  ```

  """
  @spec setRegressionAccuracy(Evision.ML.RTrees.t(), number()) :: :ok | {:error, String.t()}
  def setRegressionAccuracy(self, val) when is_float(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setRegressionAccuracy(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec setTermCriteria(Evision.ML.RTrees.t(), {integer(), integer(), number()}) :: :ok | {:error, String.t()}
  def setTermCriteria(self, val) when is_tuple(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setTermCriteria(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getTruncatePrunedTree/1`

  Python prototype (for reference): 
  ```python3
  setTruncatePrunedTree(val) -> None
  ```

  """
  @spec setTruncatePrunedTree(Evision.ML.RTrees.t(), boolean()) :: :ok | {:error, String.t()}
  def setTruncatePrunedTree(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setTruncatePrunedTree(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getUse1SERule/1`

  Python prototype (for reference): 
  ```python3
  setUse1SERule(val) -> None
  ```

  """
  @spec setUse1SERule(Evision.ML.RTrees.t(), boolean()) :: :ok | {:error, String.t()}
  def setUse1SERule(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setUse1SERule(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getUseSurrogates/1`

  Python prototype (for reference): 
  ```python3
  setUseSurrogates(val) -> None
  ```

  """
  @spec setUseSurrogates(Evision.ML.RTrees.t(), boolean()) :: :ok | {:error, String.t()}
  def setUseSurrogates(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_RTrees_setUseSurrogates(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.RTrees.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: boolean() | {:error, String.t()}
  def train(self, samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_RTrees_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.RTrees.t(), Evision.ML.TrainData.t(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def train(self, trainData, opts) when is_struct(trainData, Evision.ML.TrainData) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_RTrees_train(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec train(Evision.ML.RTrees.t(), Evision.ML.TrainData.t()) :: boolean() | {:error, String.t()}
  def train(self, trainData) when is_struct(trainData, Evision.ML.TrainData)
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_RTrees_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.ML.RTrees.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_RTrees_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.ML.RTrees.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_RTrees_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
