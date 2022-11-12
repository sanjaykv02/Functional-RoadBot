defmodule Evision.OCL.Device do
  import Kernel, except: [apply: 2, apply: 3]

  @typedoc """
  Type that represents an `Evision.OCL.Device` struct.

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
  def __to_struct__({:ok, %{class: :"OCL.Device", ref: ref}}) do
    {:ok, %T{ref: ref}}
  end

  def __to_struct__(%{class: :"OCL.Device", ref: ref}) do
    %T{
      ref: ref
    }
  end

  def __to_struct__(ret) do
    Evision.Internal.Structurise.to_struct(ret)
  end

  @doc """
  
  ##### Return
  - **self**: `Evision.OCL.Device`


  Python prototype (for reference): 
  ```python3
  Device() -> <ocl_Device object>
  ```

  """
  @spec device() :: Evision.OCL.Device.t() | {:error, String.t()}
  def device() do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_Device(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  OpenCLVersion() -> retval
  ```

  """
  @spec openCLVersion(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def openCLVersion(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_OpenCLVersion(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  OpenCL_C_Version() -> retval
  ```

  """
  @spec openCL_C_Version(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def openCL_C_Version(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_OpenCL_C_Version(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  addressBits() -> retval
  ```

  """
  @spec addressBits(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def addressBits(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_addressBits(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  available() -> retval
  ```

  """
  @spec available(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def available(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_available(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  compilerAvailable() -> retval
  ```

  """
  @spec compilerAvailable(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def compilerAvailable(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_compilerAvailable(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  deviceVersionMajor() -> retval
  ```

  """
  @spec deviceVersionMajor(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def deviceVersionMajor(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_deviceVersionMajor(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  deviceVersionMinor() -> retval
  ```

  """
  @spec deviceVersionMinor(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def deviceVersionMinor(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_deviceVersionMinor(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  doubleFPConfig() -> retval
  ```

  """
  @spec doubleFPConfig(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def doubleFPConfig(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_doubleFPConfig(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  driverVersion() -> retval
  ```

  """
  @spec driverVersion(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def driverVersion(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_driverVersion(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  endianLittle() -> retval
  ```

  """
  @spec endianLittle(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def endianLittle(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_endianLittle(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  errorCorrectionSupport() -> retval
  ```

  """
  @spec errorCorrectionSupport(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def errorCorrectionSupport(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_errorCorrectionSupport(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  executionCapabilities() -> retval
  ```

  """
  @spec executionCapabilities(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def executionCapabilities(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_executionCapabilities(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  extensions() -> retval
  ```

  """
  @spec extensions(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def extensions(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_extensions(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `Evision.OCL.Device`


  Python prototype (for reference): 
  ```python3
  getDefault() -> retval
  ```

  """
  @spec getDefault() :: Evision.OCL.Device.t() | {:error, String.t()}
  def getDefault() do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_getDefault_static(positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  globalMemCacheLineSize() -> retval
  ```

  """
  @spec globalMemCacheLineSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def globalMemCacheLineSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_globalMemCacheLineSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  globalMemCacheSize() -> retval
  ```

  """
  @spec globalMemCacheSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def globalMemCacheSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_globalMemCacheSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  globalMemCacheType() -> retval
  ```

  """
  @spec globalMemCacheType(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def globalMemCacheType(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_globalMemCacheType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  globalMemSize() -> retval
  ```

  """
  @spec globalMemSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def globalMemSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_globalMemSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  halfFPConfig() -> retval
  ```

  """
  @spec halfFPConfig(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def halfFPConfig(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_halfFPConfig(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  hostUnifiedMemory() -> retval
  ```

  """
  @spec hostUnifiedMemory(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def hostUnifiedMemory(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_hostUnifiedMemory(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  image2DMaxHeight() -> retval
  ```

  """
  @spec image2DMaxHeight(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def image2DMaxHeight(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_image2DMaxHeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  image2DMaxWidth() -> retval
  ```

  """
  @spec image2DMaxWidth(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def image2DMaxWidth(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_image2DMaxWidth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  image3DMaxDepth() -> retval
  ```

  """
  @spec image3DMaxDepth(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def image3DMaxDepth(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_image3DMaxDepth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  image3DMaxHeight() -> retval
  ```

  """
  @spec image3DMaxHeight(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def image3DMaxHeight(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_image3DMaxHeight(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  image3DMaxWidth() -> retval
  ```

  """
  @spec image3DMaxWidth(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def image3DMaxWidth(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_image3DMaxWidth(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  imageFromBufferSupport() -> retval
  ```

  """
  @spec imageFromBufferSupport(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def imageFromBufferSupport(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_imageFromBufferSupport(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  imageMaxArraySize() -> retval
  ```

  """
  @spec imageMaxArraySize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def imageMaxArraySize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_imageMaxArraySize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  imageMaxBufferSize() -> retval
  ```

  """
  @spec imageMaxBufferSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def imageMaxBufferSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_imageMaxBufferSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  imageSupport() -> retval
  ```

  """
  @spec imageSupport(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def imageSupport(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_imageSupport(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  intelSubgroupsSupport() -> retval
  ```

  """
  @spec intelSubgroupsSupport(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def intelSubgroupsSupport(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_intelSubgroupsSupport(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isAMD() -> retval
  ```

  """
  @spec isAMD(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def isAMD(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_isAMD(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  

  ##### Positional Arguments
  - **extensionName**: `String`

  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isExtensionSupported(extensionName) -> retval
  ```

  """
  @spec isExtensionSupported(Evision.OCL.Device.t(), binary()) :: boolean() | {:error, String.t()}
  def isExtensionSupported(self, extensionName) when is_binary(extensionName)
  do
    positional = [
      extensionName: Evision.Internal.Structurise.from_struct(extensionName)
    ]
    :evision_nif.ocl_ocl_Device_isExtensionSupported(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isIntel() -> retval
  ```

  """
  @spec isIntel(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def isIntel(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_isIntel(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  isNVidia() -> retval
  ```

  """
  @spec isNVidia(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def isNVidia(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_isNVidia(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `bool`


  Python prototype (for reference): 
  ```python3
  linkerAvailable() -> retval
  ```

  """
  @spec linkerAvailable(Evision.OCL.Device.t()) :: boolean() | {:error, String.t()}
  def linkerAvailable(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_linkerAvailable(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  localMemSize() -> retval
  ```

  """
  @spec localMemSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def localMemSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_localMemSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  localMemType() -> retval
  ```

  """
  @spec localMemType(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def localMemType(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_localMemType(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxClockFrequency() -> retval
  ```

  """
  @spec maxClockFrequency(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxClockFrequency(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxClockFrequency(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxComputeUnits() -> retval
  ```

  """
  @spec maxComputeUnits(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxComputeUnits(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxComputeUnits(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxConstantArgs() -> retval
  ```

  """
  @spec maxConstantArgs(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxConstantArgs(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxConstantArgs(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  maxConstantBufferSize() -> retval
  ```

  """
  @spec maxConstantBufferSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxConstantBufferSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxConstantBufferSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  maxMemAllocSize() -> retval
  ```

  """
  @spec maxMemAllocSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxMemAllocSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxMemAllocSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  maxParameterSize() -> retval
  ```

  """
  @spec maxParameterSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxParameterSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxParameterSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxReadImageArgs() -> retval
  ```

  """
  @spec maxReadImageArgs(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxReadImageArgs(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxReadImageArgs(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxSamplers() -> retval
  ```

  """
  @spec maxSamplers(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxSamplers(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxSamplers(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  maxWorkGroupSize() -> retval
  ```

  """
  @spec maxWorkGroupSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxWorkGroupSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxWorkGroupSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxWorkItemDims() -> retval
  ```

  """
  @spec maxWorkItemDims(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxWorkItemDims(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxWorkItemDims(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  maxWriteImageArgs() -> retval
  ```

  """
  @spec maxWriteImageArgs(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def maxWriteImageArgs(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_maxWriteImageArgs(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  memBaseAddrAlign() -> retval
  ```

  """
  @spec memBaseAddrAlign(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def memBaseAddrAlign(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_memBaseAddrAlign(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  name() -> retval
  ```

  """
  @spec name(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def name(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_name(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthChar() -> retval
  ```

  """
  @spec nativeVectorWidthChar(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthChar(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthChar(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthDouble() -> retval
  ```

  """
  @spec nativeVectorWidthDouble(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthDouble(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthDouble(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthFloat() -> retval
  ```

  """
  @spec nativeVectorWidthFloat(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthFloat(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthFloat(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthHalf() -> retval
  ```

  """
  @spec nativeVectorWidthHalf(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthHalf(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthHalf(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthInt() -> retval
  ```

  """
  @spec nativeVectorWidthInt(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthInt(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthInt(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthLong() -> retval
  ```

  """
  @spec nativeVectorWidthLong(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthLong(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthLong(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  nativeVectorWidthShort() -> retval
  ```

  """
  @spec nativeVectorWidthShort(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def nativeVectorWidthShort(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_nativeVectorWidthShort(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthChar() -> retval
  ```

  """
  @spec preferredVectorWidthChar(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthChar(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthChar(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthDouble() -> retval
  ```

  """
  @spec preferredVectorWidthDouble(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthDouble(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthDouble(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthFloat() -> retval
  ```

  """
  @spec preferredVectorWidthFloat(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthFloat(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthFloat(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthHalf() -> retval
  ```

  """
  @spec preferredVectorWidthHalf(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthHalf(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthHalf(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthInt() -> retval
  ```

  """
  @spec preferredVectorWidthInt(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthInt(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthInt(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthLong() -> retval
  ```

  """
  @spec preferredVectorWidthLong(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthLong(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthLong(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  preferredVectorWidthShort() -> retval
  ```

  """
  @spec preferredVectorWidthShort(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def preferredVectorWidthShort(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_preferredVectorWidthShort(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  printfBufferSize() -> retval
  ```

  """
  @spec printfBufferSize(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def printfBufferSize(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_printfBufferSize(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `size_t`


  Python prototype (for reference): 
  ```python3
  profilingTimerResolution() -> retval
  ```

  """
  @spec profilingTimerResolution(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def profilingTimerResolution(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_profilingTimerResolution(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  singleFPConfig() -> retval
  ```

  """
  @spec singleFPConfig(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def singleFPConfig(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_singleFPConfig(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  type() -> retval
  ```

  """
  @spec type(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def type(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_type(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `int`


  Python prototype (for reference): 
  ```python3
  vendorID() -> retval
  ```

  """
  @spec vendorID(Evision.OCL.Device.t()) :: integer() | {:error, String.t()}
  def vendorID(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_vendorID(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  vendorName() -> retval
  ```

  """
  @spec vendorName(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def vendorName(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_vendorName(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end

  @doc """
  
  ##### Return
  - **retval**: `String`


  Python prototype (for reference): 
  ```python3
  version() -> retval
  ```

  """
  @spec version(Evision.OCL.Device.t()) :: binary() | {:error, String.t()}
  def version(self) do
    positional = [
    ]
    :evision_nif.ocl_ocl_Device_version(Evision.Internal.Structurise.from_struct(self), positional)
    |> __to_struct__()
  end
end
