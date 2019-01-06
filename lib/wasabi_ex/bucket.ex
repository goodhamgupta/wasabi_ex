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
    url =
      "#{Client.get_url(client)}/experiments/#{payload.experiment_id}/buckets/#{payload.label}"

    params = get_params(payload)

    Helper.make_request(url, params, :get)
  end

  @spec create(%Payload{}, %Client{}) :: {:ok, String.t()} | no_return()
  def create(%Payload{} = payload, %Client{} = client) do
    url = "#{Client.get_url(client)}/experiments/#{payload.experiment_id}/buckets"

    params = get_params(payload)

    Helper.make_request(url, params, :post)
  end

  @spec delete(%Payload{}, %Client{}) :: {:ok, String.t()} | no_return()
  def delete(%Payload{} = payload, %Client{} = client) do
    url =
      "#{Client.get_url(client)}/experiments/#{payload.experiment_id}/buckets/#{payload.label}"

    params = get_params(payload)

    Helper.make_request(url, params, :delete)
  end

  defp get_params(payload) do
    payload
    |> Payload.to_map()
    |> Jason.encode!()
  end
end
