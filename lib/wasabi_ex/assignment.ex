defmodule WasabiEx.Assignment do
  @moduledoc """
  Module to interact with the assignments API. 
  """
  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Assignments.Payload

  def get(%Payload{} = payload, %Client{} = client) do
    url = "#{Client.get_url(client)}/assignments/applications/#{payload.application_name}/
      experiments/#{payload.experiment_label}/users/#{payload.user_id}"

    params =
      payload
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(url, params, :get)
  end

  def create(%Payload{} = payload, %Client{} = client) do
    url =
      "#{Client.get_url(client)}/assignments/applications/#{payload.application_name}/experiments/#{
        payload.experiment_label
      }/users/#{payload.user_id}"

    params =
      payload
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(url, params, :post)
  end
end
