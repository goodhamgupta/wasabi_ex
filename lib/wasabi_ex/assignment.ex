defmodule WasabiEx.Assignment do
  @moduledoc """
  Module to interact with the assignments API. 
  """
  alias WasabiEx.{Client, Helper}
  alias WasabiEx.Assignments.Payload

  def get(%Payload{} = payload, %Client{} = client) do
    url = "#{client.api_endpoint}/assignments/applications/#{payload.application_name}/
      experiments/#{payload.experiment_label}/users/#{payload.user_id}"

    params =
      payload
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(client.auth_token, url, params, :get)
  end

  def create(%Payload{} = payload, %Client{} = client) do
    url =
      "#{client.api_endpoint}/assignments/applications/#{payload.application_name}/experiments/#{
        payload.experiment_label
      }/users/#{payload.user_id}"

    params =
      payload
      |> Payload.validate()
      |> Payload.to_map()
      |> Jason.encode!()

    Helper.make_request(client.auth_token, url, params, :post)
  end
end
