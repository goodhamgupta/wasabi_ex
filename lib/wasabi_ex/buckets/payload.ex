defmodule WasabiEx.Buckets.Payload do
  @moduledoc """
  Defines the payload structure to modify a bucket in an experiment
  """

  alias WasabiEx.{Constants, Errors}
  alias __MODULE__

  @keys [
    allocation_percent: nil,
    description: nil,
    experiment_id: nil,
    control: false,
    label: nil,
    payload: nil,
    state: "OPEN"
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          allocation_percent: float(),
          description: String.t(),
          experiment_id: String.t(),
          control: Boolean.t(),
          label: String.t(),
          payload: String.t(),
          state: String.t()
        }

  def validate(%Payload{allocation_percent: nil}) do
    raise Errors.InvalidParam, "allocation_percent cannot be nil"
  end

  def validate(%Payload{experiment_id: nil}) do
    raise Errors.InvalidParam, "experiment_id cannot be nil"
  end

  def validate(%Payload{label: nil}) do
    raise Errors.InvalidParam, "label cannot be nil"
  end

  def validate(%Payload{} = payload), do: payload

  def new(data) when is_map(data) do
    %__MODULE__{
      allocation_percent: Map.get(data, :allocation_percent, 0.5),
      description: Map.get(data, :description),
      experiment_id: Map.get(data, :experiment_id),
      control: Map.get(data, :control),
      label: Map.get(data, :label),
      payload: Map.get(data, :payload),
      state: Map.get(data, :state, "OPEN")
    }
  end

  def new(data) do
    raise Errors.InvalidParam, "expected map, received #{data}"
  end

  @doc """
  Function to create a map with the relevant key-value pairs for the Wasabi Experiment
  """
  def to_map(payload) do
    %{
      Constants.allocation_percent() => payload.allocation_percent,
      Constants.description() => payload.description,
      Constants.experiment_id() => payload.experiment_id,
      Constants.control() => payload.control,
      Constants.label() => payload.label,
      Constants.payload() => payload.payload,
      Constants.state() => payload.state
    }
  end
end
