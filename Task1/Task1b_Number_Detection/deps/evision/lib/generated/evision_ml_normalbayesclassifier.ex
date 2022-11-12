defmodule Evision.ML.NormalBayesClassifier do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.NormalBayesClassifier` struct.

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
  def __to_struct__({:ok, %{class: :"ML.NormalBayesClassifier", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.NormalBayesClassifier", ref: ref}) do
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
  @spec calcError(Evision.ML.NormalBayesClassifier.t(), Evision.ML.TrainData.t(), boolean(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test, opts) when is_struct(data, Evision.ML.TrainData) and is_boolean(test) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_calcError(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec calcError(Evision.ML.NormalBayesClassifier.t(), Evision.ML.TrainData.t(), boolean()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def calcError(self, data, test) when is_struct(data, Evision.ML.TrainData) and is_boolean(test)
  do
    positional = [
      data: Evision.Internal.Structurise.from_struct(data),
      test: Evision.Internal.Structurise.from_struct(test)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_calcError(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Clears the algorithm state


  Python prototype (for reference): 
  ```python3
  clear() -> None
  ```

  """
  @spec clear(Evision.ML.NormalBayesClassifier.t()) :: :ok | {:error, String.t()}
  def clear(self) do
    positional = [
    ]
    :evision_nif.ml_NormalBayesClassifier_clear(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.ML.NormalBayesClassifier`

  Creates empty model
  Use StatModel::train to train the model after creation.

  Python prototype (for reference): 
  ```python3
  create() -> retval
  ```

  """
  @spec create() :: Evision.ML.NormalBayesClassifier.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_create_static(positional)
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
  @spec empty(Evision.ML.NormalBayesClassifier.t()) :: boolean() | {:error, String.t()}
  def empty(self) do
    positional = [
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_empty(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getDefaultName(Evision.ML.NormalBayesClassifier.t()) :: binary() | {:error, String.t()}
  def getDefaultName(self) do
    positional = [
    ]
    :evision_nif.ml_NormalBayesClassifier_getDefaultName(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec getVarCount(Evision.ML.NormalBayesClassifier.t()) :: integer() | {:error, String.t()}
  def getVarCount(self) do
    positional = [
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_getVarCount(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isClassifier(Evision.ML.NormalBayesClassifier.t()) :: boolean() | {:error, String.t()}
  def isClassifier(self) do
    positional = [
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_isClassifier(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec isTrained(Evision.ML.NormalBayesClassifier.t()) :: boolean() | {:error, String.t()}
  def isTrained(self) do
    positional = [
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_isTrained(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized NormalBayesClassifier from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized NormalBayesClassifier


  ##### Keyword Arguments
  - **nodeName**: `String`.

    name of node containing the classifier


  ##### Return
  - **retval**: `Evision.ML.NormalBayesClassifier`

   Use NormalBayesClassifier::save to serialize and store an NormalBayesClassifier to disk.
   Load the NormalBayesClassifier from this file again, by calling this function with the path to the file.
   Optionally specify the node for the file containing the classifier


  Python prototype (for reference): 
  ```python3
  load(filepath[, nodeName]) -> retval
  ```

  """
  @spec load(binary(), [{atom(), term()},...] | nil) :: Evision.ML.NormalBayesClassifier.t() | {:error, String.t()}
  def load(filepath, opts) when is_binary(filepath) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_load_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Loads and creates a serialized NormalBayesClassifier from a file

  ##### Positional Arguments
  - **filepath**: `String`.

    path to serialized NormalBayesClassifier


  ##### Keyword Arguments
  - **nodeName**: `String`.

    name of node containing the classifier


  ##### Return
  - **retval**: `Evision.ML.NormalBayesClassifier`

   Use NormalBayesClassifier::save to serialize and store an NormalBayesClassifier to disk.
   Load the NormalBayesClassifier from this file again, by calling this function with the path to the file.
   Optionally specify the node for the file containing the classifier


  Python prototype (for reference): 
  ```python3
  load(filepath[, nodeName]) -> retval
  ```

  """
  @spec load(binary()) :: Evision.ML.NormalBayesClassifier.t() | {:error, String.t()}
  def load(filepath) when is_binary(filepath)
  do
    positional = [
      filepath: Evision.Internal.Structurise.from_struct(filepath)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_load_static(positional)
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
  @spec predict(Evision.ML.NormalBayesClassifier.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples, opts) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_predict(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec predict(Evision.ML.NormalBayesClassifier.t(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t()} | {:error, String.t()}
  def predict(self, samples) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_predict(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  Predicts the response for sample(s).

  ##### Positional Arguments
  - **inputs**: `Evision.Mat`

  ##### Keyword Arguments
  - **flags**: `int`.

  ##### Return
  - **retval**: `float`
  - **outputs**: `Evision.Mat`.
  - **outputProbs**: `Evision.Mat`.

  The method estimates the most probable classes for input vectors. Input vectors (one or more)
  are stored as rows of the matrix inputs. In case of multiple input vectors, there should be one
  output vector outputs. The predicted class for a single input vector is returned by the method.
  The vector outputProbs contains the output probabilities corresponding to each element of
  result.


  Python prototype (for reference): 
  ```python3
  predictProb(inputs[, outputs[, outputProbs[, flags]]]) -> retval, outputs, outputProbs
  ```

  """
  @spec predictProb(Evision.ML.NormalBayesClassifier.t(), Evision.Mat.maybe_mat_in(), [{atom(), term()},...] | nil) :: {number(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def predictProb(self, inputs, opts) when (is_struct(inputs, Evision.Mat) or is_struct(inputs, Nx.Tensor)) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_predictProb(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Predicts the response for sample(s).

  ##### Positional Arguments
  - **inputs**: `Evision.Mat`

  ##### Keyword Arguments
  - **flags**: `int`.

  ##### Return
  - **retval**: `float`
  - **outputs**: `Evision.Mat`.
  - **outputProbs**: `Evision.Mat`.

  The method estimates the most probable classes for input vectors. Input vectors (one or more)
  are stored as rows of the matrix inputs. In case of multiple input vectors, there should be one
  output vector outputs. The predicted class for a single input vector is returned by the method.
  The vector outputProbs contains the output probabilities corresponding to each element of
  result.


  Python prototype (for reference): 
  ```python3
  predictProb(inputs[, outputs[, outputProbs[, flags]]]) -> retval, outputs, outputProbs
  ```

  """
  @spec predictProb(Evision.ML.NormalBayesClassifier.t(), Evision.Mat.maybe_mat_in()) :: {number(), Evision.Mat.t(), Evision.Mat.t()} | {:error, String.t()}
  def predictProb(self, inputs) when (is_struct(inputs, Evision.Mat) or is_struct(inputs, Nx.Tensor))
  do
    positional = [
      inputs: Evision.Internal.Structurise.from_struct(inputs)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_predictProb(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec read(Evision.ML.NormalBayesClassifier.t(), Evision.FileNode.t()) :: :ok | {:error, String.t()}
  def read(self, fn_) when is_struct(fn_, Evision.FileNode)
  do
    positional = [
      fn_: Evision.Internal.Structurise.from_struct(fn_)
    ]
    :evision_nif.ml_NormalBayesClassifier_read(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec save(Evision.ML.NormalBayesClassifier.t(), binary()) :: :ok | {:error, String.t()}
  def save(self, filename) when is_binary(filename)
  do
    positional = [
      filename: Evision.Internal.Structurise.from_struct(filename)
    ]
    :evision_nif.ml_NormalBayesClassifier_save(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.NormalBayesClassifier.t(), Evision.Mat.maybe_mat_in(), integer(), Evision.Mat.maybe_mat_in()) :: boolean() | {:error, String.t()}
  def train(self, samples, layout, responses) when (is_struct(samples, Evision.Mat) or is_struct(samples, Nx.Tensor)) and is_integer(layout) and (is_struct(responses, Evision.Mat) or is_struct(responses, Nx.Tensor))
  do
    positional = [
      samples: Evision.Internal.Structurise.from_struct(samples),
      layout: Evision.Internal.Structurise.from_struct(layout),
      responses: Evision.Internal.Structurise.from_struct(responses)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec train(Evision.ML.NormalBayesClassifier.t(), Evision.ML.TrainData.t(), [{atom(), term()},...] | nil) :: boolean() | {:error, String.t()}
  def train(self, trainData, opts) when is_struct(trainData, Evision.ML.TrainData) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_train(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec train(Evision.ML.NormalBayesClassifier.t(), Evision.ML.TrainData.t()) :: boolean() | {:error, String.t()}
  def train(self, trainData) when is_struct(trainData, Evision.ML.TrainData)
  do
    positional = [
      trainData: Evision.Internal.Structurise.from_struct(trainData)
    ]
    :evision_nif.ml_ml_NormalBayesClassifier_train(Evision.Internal.Structurise.from_struct(self), positional)
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
  @spec write(Evision.ML.NormalBayesClassifier.t(), Evision.FileStorage.t(), [{atom(), term()},...] | nil) :: :ok | {:error, String.t()}
  def write(self, fs, opts) when is_struct(fs, Evision.FileStorage) and (opts == nil or (is_list(opts) and is_tuple(hd(opts))))
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_NormalBayesClassifier_write(Evision.Internal.Structurise.from_struct(self), positional ++ Evision.Internal.Structurise.from_struct(opts || []))
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
  @spec write(Evision.ML.NormalBayesClassifier.t(), Evision.FileStorage.t()) :: :ok | {:error, String.t()}
  def write(self, fs) when is_struct(fs, Evision.FileStorage)
  do
    positional = [
      fs: Evision.Internal.Structurise.from_struct(fs)
    ]
    :evision_nif.ml_NormalBayesClassifier_write(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
