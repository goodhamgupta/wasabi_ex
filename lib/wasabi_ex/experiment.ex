defmodule WasabiEx.Experiment do
  @moduledoc """
  Module to interact with the experiments API.
  """

  @experiments_url "experiments"

  alias WasabiEx.{Client, Helper}

  alias WasabiEx.Experiments.Payload

  @doc """
  API to create the experiment in Wasabi.
  """
  def create(%Payload{} = payload, %Client{} = client) do
    params =
      payload
      |> Payload.validate()
      |> Payload.to_map()
      |> Jason.encode!()

    url = "#{client.api_endpoint}/#{@experiments_url}"

    {:ok, response} = Helper.make_request(client.auth_token, url, params, :post)
    expt = Map.put(payload, :id, response["id"])
    {:ok, expt}
  end
end
