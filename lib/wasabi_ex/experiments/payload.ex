defmodule WasabiEx.Experiments.Payload do
  alias WasabiEx.{Errors, Constants}

  alias __MODULE__

  @keys [
    id: nil,
    application_name: nil,
    description: nil,
    start_time: nil,
    end_time: nil,
    rapid_experiment: nil,
    user_cap: nil,
    label: nil,
    sampling_percent: nil,
    tags: []
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          id: String.t(),
          application_name: String.t(),
          description: String.t(),
          start_time: DateTime.t(),
          end_time: DateTime.t(),
          rapid_experiment: Boolean.t(),
          user_cap: Integer.t(),
          label: String.t(),
          sampling_percent: String.t(),
          tags: String.t()
        }

  def validate(%Payload{id: nil}) do
    raise Errors.InvalidParam, "id cannot be nil"
  end

  def validate(%Payload{application_name: nil}) do
    raise Errors.InvalidParam, "application_name cannot be nil"
  end

  def validate(%Payload{start_time: nil}) do
    raise Errors.InvalidParam, "start_time cannot be nil"
  end

  def validate(%Payload{end_time: nil}) do
    raise Errors.InvalidParam, "end_time cannot be nil"
  end

  def validate(%Payload{label: nil}) do
    raise Errors.InvalidParam, "label cannot be nil"
  end

  def new(data) when is_map(data) do
    %__MODULE__{
      id: Map.get(data, :id, UUID.uuid4()),
      application_name: Map.get(data, :application_name),
      description: Map.get(data, :description),
      start_time: Map.get(data, :start_time, DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_iso8601()),
      end_time: Map.get(data, :end_time, DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_iso8601()),
      rapid_experiment: Map.get(data, :rapid_experiment, false),
      user_cap: Map.get(data, :user_cap, 0),
      label: Map.get(data, :label),
      sampling_percent: Map.get(data, :sampling_percent, 1),
      tags: Map.get(data, :tags, [])
    }
  end

  def new(data) do
    raise Errors.InvalidParam, "expected map, received #{data}"
  end

  @doc """
  Function to create a map with the relevant key-value pairs for the Wasabi Experiment
  """
  def to_map(%Payload{} = payload) do
    %{
      Constants.id() => payload.id,
      Constants.application_name() => payload.application_name,
      Constants.description() => payload.description,
      Constants.end_time() => payload.end_time,
      Constants.rapid_experiment() => payload.rapid_experiment,
      Constants.user_cap() => payload.user_cap,
      Constants.label() => payload.label,
      Constants.sampling_percent() => payload.sampling_percent,
      Constants.start_time() => payload.start_time,
      Constants.tags() => payload.tags
    }
  end
end
