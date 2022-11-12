defmodule Evision.ML.KNearest do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.KNearest` struct.

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
  def __to_struct__({:ok, %{class: :"ML.KNearest", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.KNearest", ref: ref}) do
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
  @spec calcError(Evision.ML.KNearest.t(), Evision.ML.TrainData.t(), boolean(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test, opts) when is_struct(data, Evision.ML.TrainData) and is_boolean(test) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_KNearest_calcError(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec calcError(Evision.ML.KNearest.t(), Evision.ML.TrainData.t(), boolean()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test) when is_struct(data, Evision.ML.TrainData) and is_boolean(test)
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_KNearest_calcError(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clears the algorithm state


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.ML.KNearest.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.ml_KNearest_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Creates the empty model
  ##### Return
  - **retval**: `Evision.ML.KNearest`

  The static method creates empty %KNearest classifier. It should be then trained using StatModel::train method.

  Python prototype (for reference): 
  ```python3
  create() -> retval
  ```

  """
  @spec create() :: Evision.ML.KNearest.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_create_static(positional)
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
  @spec empty(Evision.ML.KNearest.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_empty(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Finds the neighbors and predicts responses for input vectors.

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    Input samples stored by rows. It is a single-precision floating-point matrix of
    `<number_of_samples> * k` size.

  - **k**: `int`.

    Number of used nearest neighbors. Should be greater than 1.


  ##### Return
  - **retval**: `float`
  - **results**: `Evision.Mat`.

    Vector with results of prediction (regression or classification) for each input
    sample. It is a single-precision floating-point vector with `<number_of_samples>` elements.

  - **neighborResponses**: `Evision.Mat`.

    Optional output values for corresponding neighbors. It is a single-
    precision floating-point matrix of `<number_of_samples> * k` size.

  - **dist**: `Evision.Mat`.

    Optional output distances from the input vectors to the corresponding neighbors. It
    is a single-precision floating-point matrix of `<number_of_samples> * k` size.



  For each input vector (a row of the matrix samples), the method finds the k nearest neighbors.
  In case of regression, the predicted result is a mean value of the particular vector's neighbor
  responses. In case of classification, the class is determined by voting.
  For each input vector, the neighbors are sorted by their distances to the vector.
  In case of C++ interface you can use output pointers to empty matrices and the function will
  allocate memory itself.
  If only a single input vector is passed, all output matrices are optional and the predicted
  value is returned by the method.
  The function is parallelized with the TBB library.


  Python prototype (for reference): 
  ```python3
  findNearest(samples, k[, results[, neighborResponses[, dist]]]) -> retval, results, neighborResponses, dist
  ```

  """
  @spec findNearest(Evision.ML.KNearest.t(), Evision.Mat.maybe_mat_in(), integer(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def findNearest(self, samples, k, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(k) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.ml_ml_KNearest_findNearest(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Finds the neighbors and predicts responses for input vectors.

  ##### Positional Arguments
  - **samples**: `Evision.Mat`.

    Input samples stored by rows. It is a single-precision floating-point matrix of
    `<number_of_samples> * k` size.

  - **k**: `int`.

    Number of used nearest neighbors. Should be greater than 1.


  ##### Return
  - **retval**: `float`
  - **results**: `Evision.Mat`.

    Vector with results of prediction (regression or classification) for each input
    sample. It is a single-precision floating-point vector with `<number_of_samples>` elements.

  - **neighborResponses**: `Evision.Mat`.

    Optional output values for corresponding neighbors. It is a single-
    precision floating-point matrix of `<number_of_samples> * k` size.

  - **dist**: `Evision.Mat`.

    Optional output distances from the input vectors to the corresponding neighbors. It
    is a single-precision floating-point matrix of `<number_of_samples> * k` size.



  For each input vector (a row of the matrix samples), the method finds the k nearest neighbors.
  In case of regression, the predicted result is a mean value of the particular vector's neighbor
  responses. In case of classification, the class is determined by voting.
  For each input vector, the neighbors are sorted by their distances to the vector.
  In case of C++ interface you can use output pointers to empty matrices and the function will
  allocate memory itself.
  If only a single input vector is passed, all output matrices are optional and the predicted
  value is returned by the method.
  The function is parallelized with the TBB library.


  Python prototype (for reference): 
  ```python3
  findNearest(samples, k[, results[, neighborResponses[, dist]]]) -> retval, results, neighborResponses, dist
  ```

  """
  @spec findNearest(Evision.ML.KNearest.t(), Evision.Mat.maybe_mat_in(), integer()) :: {number(), Evision.Mat.t(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def findNearest(self, samples, k) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(k)
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      k: Evision.Internal.Structurise.from_struct(k)
    ]
    :evision_nif.ml_ml_KNearest_findNearest(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setAlgorithmType/2`

  Python prototype (for reference): 
  ```python3
  getAlgorithmType() -> retval
  ```

  """
  @spec getAlgorithmType(Evision.ML.KNearest.t()) :: integer() | {:error, String.t()}
  def getAlgorithmType(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_getAlgorithmType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setDefaultK/2`

  Python prototype (for reference): 
  ```python3
  getDefaultK() -> retval
  ```

  """
  @spec getDefaultK(Evision.ML.KNearest.t()) :: integer() | {:error, String.t()}
  def getDefaultK(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_getDefaultK(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.ML.KNearest.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.ml_KNearest_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`

  @see `setEmax/2`

  Python prototype (for reference): 
  ```python3
  getEmax() -> retval
  ```

  """
  @spec getEmax(Evision.ML.KNearest.t()) :: integer() | {:error, String.t()}
  def getEmax(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_getEmax(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`

  @see `setIsClassifier/2`

  Python prototype (for reference): 
  ```python3
  getIsClassifier() -> retval
  ```

  """
  @spec getIsClassifier(Evision.ML.KNearest.t()) :: boolean() | {:error, String.t()}
  def getIsClassifier(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_getIsClassifier(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getVarCount(Evision.ML.KNearest.t()) :: integer() | {:error, String.t()}
  def getVarCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_getVarCount(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isClassifier(Evision.ML.KNearest.t()) :: boolean() | {:error, String.t()}
  def isClassifier(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_isClassifier(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isTrained(Evision.ML.KNearest.t()) :: boolean() | {:error, String.t()}
  def isTrained(self) do
    positional = [
    ]
    :evision_nif.ml_ml_KNearest_isTrained(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized knearest from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized KNearest


  ##### Return
  - **retval**: `Evision.ML.KNearest`

   Use KNearest::save to serialize and store an KNearest to disk.
   Load the KNearest from this file again, by calling this function with the path to the file.


  Python prototype (for reference): 
  ```python3
  load(filepath) -> retval
  ```

  """
  @spec load(binary()) :: Evision.ML.KNearest.t() | {:error, String.t()}
  def load(filepath) when is_binary(filepath)
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_KNearest_load_static(positional)
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
  @spec predict(Evision.ML.KNearest.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_KNearest_predict(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec predict(Evision.ML.KNearest.t(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_KNearest_predict(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.ML.KNearest.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, fn_) when is_struct(fn_, Evision.FileNode)
  do
    positional = [
      fn_: Evision.Internal.Structurise.from_struct(fn_)
    ]
    :evision_nif.ml_KNearest_read(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec save(Evision.ML.KNearest.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.ml_KNearest_save(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getAlgorithmType/1`

  Python prototype (for reference): 
  ```python3
  setAlgorithmType(val) -> None
  ```

  """
  @spec setAlgorithmType(Evision.ML.KNearest.t(), integer()) :: :ok | {:error, String.t()}
  def setAlgorithmType(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_KNearest_setAlgorithmType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getDefaultK/1`

  Python prototype (for reference): 
  ```python3
  setDefaultK(val) -> None
  ```

  """
  @spec setDefaultK(Evision.ML.KNearest.t(), integer()) :: :ok | {:error, String.t()}
  def setDefaultK(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_KNearest_setDefaultK(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `int`


  @see `getEmax/1`

  Python prototype (for reference): 
  ```python3
  setEmax(val) -> None
  ```

  """
  @spec setEmax(Evision.ML.KNearest.t(), integer()) :: :ok | {:error, String.t()}
  def setEmax(self, val) when is_integer(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_KNearest_setEmax(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **val**: `bool`


  @see `getIsClassifier/1`

  Python prototype (for reference): 
  ```python3
  setIsClassifier(val) -> None
  ```

  """
  @spec setIsClassifier(Evision.ML.KNearest.t(), boolean()) :: :ok | {:error, String.t()}
  def setIsClassifier(self, val) when is_boolean(val)
  do
    positional = [
      val: Evision.Internal.Structurise.from_struct(val)
    ]
    :evision_nif.ml_ml_KNearest_setIsClassifier(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.KNearest.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: boolean() | {:error, String.t()}
  def train(self, samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_KNearest_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.KNearest.t(), Evision.ML.TrainData.t(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def train(self, trainData, opts) when is_struct(trainData, Evision.ML.TrainData) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_KNearest_train(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec train(Evision.ML.KNearest.t(), Evision.ML.TrainData.t()) :: boolean() | {:error, String.t()}
  def train(self, trainData) when is_struct(trainData, Evision.ML.TrainData)
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_KNearest_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.ML.KNearest.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_KNearest_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.ML.KNearest.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_KNearest_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
