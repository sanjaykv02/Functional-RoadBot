defmodule Evision.ML.ParamGrid do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.ML.ParamGrid` struct.

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
  def __to_struct__({:ok, %{class: :"ML.ParamGrid", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"ML.ParamGrid", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  Creates a ParamGrid Ptr that can be given to the %SVM::trainAuto method
  ##### Keyword Arguments
  - **minVal**: `double`.

    minimum value of the parameter grid

  - **maxVal**: `double`.

    maximum value of the parameter grid

  - **logstep**: `double`.

    Logarithmic step for iterating the statmodel parameter


  ##### Return
  - **retval**: `Evision.ML.ParamGrid`



  Python prototype (for reference): 
  ```python3
  create([, minVal[, maxVal[, logstep]]]) -> retval
  ```

  """
  @spec create([{atom(), term()},...] | nil) :: Evision.ML.ParamGrid.t() | {:error, String.t()}
  def create(opts) when opts == nil or (is_list(opts) and is_tuple(hd(opts)))
  do
    positional = [
    ]
    :evision_nif.ml_ml_ParamGrid_create_static(positional ++ Evision.Internal.Structurise.from_struct(opts || []))
     |> __to_struct__()
  end

  @doc """
  Creates a ParamGrid Ptr that can be given to the %SVM::trainAuto method
  ##### Keyword Arguments
  - **minVal**: `double`.

    minimum value of the parameter grid

  - **maxVal**: `double`.

    maximum value of the parameter grid

  - **logstep**: `double`.

    Logarithmic step for iterating the statmodel parameter


  ##### Return
  - **retval**: `Evision.ML.ParamGrid`



  Python prototype (for reference): 
  ```python3
  create([, minVal[, maxVal[, logstep]]]) -> retval
  ```

  """
  @spec create() :: Evision.ML.ParamGrid.t() | {:error, String.t()}
  def create() do
    positional = [
    ]
    :evision_nif.ml_ml_ParamGrid_create_static(positional)
    |> __to_struct__()
  end
  @spec get_logStep(Evision.ML.ParamGrid.t()) :: number()
  def get_logStep(self) do
    :evision_nif.ml_ParamGrid_get_logStep(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_logStep(Evision.ML.ParamGrid.t(), number()) :: Evision.ML.ParamGrid.t()
  def set_logStep(self, prop) do
    :evision_nif.ml_ParamGrid_set_logStep(Evision.Internal.Structurise.from_struct(self), [logStep: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_maxVal(Evision.ML.ParamGrid.t()) :: number()
  def get_maxVal(self) do
    :evision_nif.ml_ParamGrid_get_maxVal(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_maxVal(Evision.ML.ParamGrid.t(), number()) :: Evision.ML.ParamGrid.t()
  def set_maxVal(self, prop) do
    :evision_nif.ml_ParamGrid_set_maxVal(Evision.Internal.Structurise.from_struct(self), [maxVal: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
  @spec get_minVal(Evision.ML.ParamGrid.t()) :: number()
  def get_minVal(self) do
    :evision_nif.ml_ParamGrid_get_minVal(Evision.Internal.Structurise.from_struct(self))
    |> __to_struct__()
  end
  @spec set_minVal(Evision.ML.ParamGrid.t(), number()) :: Evision.ML.ParamGrid.t()
  def set_minVal(self, prop) do
    :evision_nif.ml_ParamGrid_set_minVal(Evision.Internal.Structurise.from_struct(self), [minVal: Evision.Internal.Structurise.from_struct(prop)])
    |> __to_struct__()
  end
end
