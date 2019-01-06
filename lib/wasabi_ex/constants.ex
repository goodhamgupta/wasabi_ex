defmodule WasabiEx.Constants do
  @moduledoc """
  This module contains the constants used to construct the event payload.

  ## Examples

      iex> WasabiEx.Constants.tracker_version()
      "elixir-0.1.0"
  """
  @tracker_version "elixir-0.1.0"

  # Experiment Parameters
  @id "id"
  @application_name "applicationName"
  @description "description"
  @end_time "endTime"
  @rapid_experiment "isRapidExperiment"
  @user_cap "userCap"
  @label "label"
  @sampling_percent "samplingPercent"
  @start_time "startTime"
  @tags "tags"

  # Bucket parameters
  @allocation_percent "allocationPercent"
  @experiment_id "experimentID"
  @control "isControl"
  @payload "payload"
  @state "state"

  # Assignment parameters
  @experiment_label "experimentLabel"
  @user_id "userID"
  @context "content"
  @create_assignment "createAssignment"
  @ignore_sampling_percent "ignoreSamplingPercent"
  @segmentation_profile "segmentationProfile"

  # Event parameters
  @event_list "eventList"

  def tracker_version, do: @tracker_version

  def id, do: @id

  def application_name, do: @application_name

  def description, do: @description

  def end_time, do: @end_time

  def rapid_experiment, do: @rapid_experiment

  def user_cap, do: @user_cap

  def label, do: @label

  def sampling_percent, do: @sampling_percent

  def start_time, do: @start_time

  def tags, do: @tags

  def allocation_percent, do: @allocation_percent

  def experiment_id, do: @experiment_id

  def control, do: @control

  def payload, do: @payload

  def state, do: @state

  def experiment_label, do: @experiment_label

  def user_id, do: @user_id

  def context, do: @context

  def create_assignment, do: @create_assignment

  def ignore_sampling_percent, do: @ignore_sampling_percent

  def segmentation_profile, do: @segmentation_profile

  def event_list, do: @event_list
end
