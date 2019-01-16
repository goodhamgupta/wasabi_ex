defmodule WasabiEx.Event do
  @moduledoc """
  Module to interact with events API
  """

  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Events.Payload

  def create(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/events/applications/#{payload.application_name}/
      experiments/#{payload.experiment_label}/users/#{payload.user_id}"

    params =
      payload
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(client.auth_token, url, params, :post)
  end
end
