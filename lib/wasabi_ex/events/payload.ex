defmodule WasabiEx.Events.Payload do
  @moduledoc """
  Module to define the structure for an event for a specific user.
  NOTE: Please record events only after the user has been assigned to a particular bucket.
  """

  alias WasabiEx.{Constants, Errors}
  alias __MODULE__

  @keys [
    application_name: nil,
    experiment_label: nil,
    user_id: nil,
    event_list: [name: nil, payload: nil]
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          application_name: String.t(),
          experiment_label: String.t(),
          user_id: String.t(),
          event_list: list(map())
        }

  def validate(%Payload{application_name: nil}) do
    raise Errors.InvalidParam, "application_name cannot be nil"
  end

  def validate(%Payload{experiment_label: nil}) do
    raise Errors.InvalidParam, "experiment_label cannot be nil"
  end

  def validate(%Payload{user_id: nil}) do
    raise Errors.InvalidParam, "user_id cannot be nil"
  end

  def new(data) when is_map(data) do
    %__MODULE__{
      application_name: Map.get(data, :application_name),
      experiment_label: Map.get(data, :experiment_label),
      user_id: Map.get(data, :user_id),
      event_list: Map.get(data, :event_list)
    }
  end

  def new(data) do
    raise Errors.InvalidParam, "expected map, received #{data}"
  end

  def to_map(%Payload{} = payload) do
    %{
      Constants.application_name() => payload.application_name,
      Constants.experiment_label() => payload.experiment_label,
      Constants.user_id() => payload.user_id,
      Constants.event_list() => payload.event_list
    }
  end
end
