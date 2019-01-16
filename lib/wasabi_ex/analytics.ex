defmodule WasabiEx.Analytics do
  @moduledoc """
  Module to interact with analytics API to get the metrics for each experiment.
  """

  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Experiments.Payload

  def get_counts(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/analytics/experiments/#{payload.id}/counts"

    Helper.make_request(client.auth_token, url, %{}, :get)
  end

  def get_statistics(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/analytics/experiments/#{payload.id}/statistics"

    Helper.make_request(client.auth_token, url, %{}, :get)
  end

  def get_dallies(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/analytics/experiments/#{payload.id}/counts/dailies"

    Helper.make_request(client.auth_token, url, %{}, :get)
  end
end
