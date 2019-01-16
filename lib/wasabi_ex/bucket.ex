defmodule WasabiEx.Bucket do
  @moduledoc """
  Module to interact with the buckets for a specific experiment.
  """

  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Buckets.Payload

  @doc """
  Function to create a new bucket in the experiment.
  """

  @spec get(%Payload{}, %Client{}) :: {:ok, String.t()} | no_return()
  def get(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/experiments/#{payload.experiment_id}/buckets/#{payload.label}"

    params = get_params(payload)

    Helper.make_request(client.auth_token, url, params, :get)
  end

  @spec create(%Payload{}, %Client{}) :: {:ok, String.t()} | no_return()
  def create(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/experiments/#{payload.experiment_id}/buckets"

    params = get_params(payload)

    Helper.make_request(client.auth_token, url, params, :post)
  end

  @spec delete(%Payload{}, %Client{}) :: {:ok, String.t()} | no_return()
  def delete(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/experiments/#{payload.experiment_id}/buckets/#{payload.label}"

    params = get_params(payload)

    Helper.make_request(client.auth_token, url, params, :delete)
  end

  defp get_params(payload) do
    payload
    |> Payload.to_map()
    |> Jason.encode!()
  end
end
