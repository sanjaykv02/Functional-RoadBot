defmodule ServoKit.ProcessRegistry do
  @moduledoc """
  Registers and manages processes.
  """

  require Logger

  @spec child_spec(any) :: Supervisor.child_spec()
  def child_spec(_args) do
    Supervisor.child_spec(
      Registry,
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    )
  end

  @doc """
  Returns a standardized via-tuple for this registry.

      iex> ProcessRegistry.via_tuple(SomeKey)
      {:via, Registry, {ProcessRegistry, SomeKey}}
  """
  @spec via_tuple(any) :: {:via, Registry, {ServoKit.ProcessRegistry, any}}
  def via_tuple(key) when is_tuple(key) do
    {:via, Registry, {__MODULE__, key}}
  end

  @spec whereis_name(any) :: :undefined | pid
  def whereis_name(key) when is_tuple(key) do
    Registry.whereis_name({__MODULE__, key})
  end

  @doc """
  Starts a unique registry.
  """
  @spec start_link :: {:ok, pid} | {:error, any}
  def start_link() do
    Logger.debug("#{__MODULE__} starting")
    Registry.start_link(keys: :unique, name: __MODULE__)
  end
end
