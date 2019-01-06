defmodule WasabiEx.Assignments.Payload do
  @moduledoc """
  Module containing the payload definition for assignments API.
  """

  alias WasabiEx.{Errors, Constants}
  alias __MODULE__

  @keys [
    application_name: nil,
    experiment_label: nil,
    user_id: nil,
    context: "PROD",
    create_assignment: true,
    ignore_sampling_percent: false,
    segmentation_profile: nil
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          application_name: String.t(),
          experiment_label: String.t(),
          user_id: String.t(),
          context: String.t(),
          create_assignment: Boolean.t(),
          ignore_sampling_percent: Boolean.t(),
          segmentation_profile: nil
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
      context: Map.get(data, :context, "PROD"),
      create_assignment: Map.get(data, :create_assignment, true),
      ignore_sampling_percent: Map.get(data, :ignore_sampling_percent, false),
      segmentation_profile: Map.get(data, :segmentation_profile)
    }
  end

  def new(data) do
    raise Errors.InvalidParam, "expected map, received #{data}"
  end

  def to_map(payload) do
    %{
      Constants.application_name() => payload.application_name,
      Constants.experiment_label() => payload.experiment_label,
      Constants.user_id() => payload.user_id,
      Constants.context() => payload.context,
      Constants.create_assignment() => payload.create_assignment,
      Constants.ignore_sampling_percent() => payload.ignore_sampling_percent,
      Constants.segmentation_profile() => payload.segmentation_profile
    }
  end
end
