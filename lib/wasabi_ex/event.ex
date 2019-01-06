defmodule WasabiEx.Event do
  @moduledoc """
  Module to interact with events API
  """

  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Events.Payload

  def create(%Payload{} = payload, %Client{} = client) do
    url = "#{Client.get_url(client)}/events/applications/#{payload.application_name}/
      experiments/#{payload.experiment_label}/users/#{payload.user_id}"

    params =
      payload
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(url, params, :post)
  end
end
