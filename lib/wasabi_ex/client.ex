defmodule WasabiEx.Client do
  @moduledoc """
  Module to authenticate user token with wasabi server
  """

  alias WasabiEx.{Errors, Request, Response}

  alias __MODULE__

  @auth_endpoint "authentication/verifyToken"

  @keys [
    auth_token: nil,
    wasabi_server: nil,
    wasabi_port: "8080",
    protocol: "http",
    version: "v1",
    api_endpoint: nil
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          auth_token: String.t(),
          wasabi_server: String.t(),
          wasabi_port: String.t(),
          protocol: String.t(),
          version: String.t(),
          api_endpoint: String.t()
        }

  def validate(%Client{auth_token: nil}) do
    raise Errors.InvalidParam, "auth_token cannot be nil"
  end

  def validate(%Client{auth_token: ""}) do
    raise Errors.InvalidParam, "auth_token cannot be empty string"
  end

  def validate(%Client{wasabi_server: nil}) do
    raise Errors.InvalidParam, "wasabi_server cannot be nil"
  end

  def validate(%Client{wasabi_server: ""}) do
    raise Errors.InvalidParam, "wasabi_server cannot be empty string"
  end

  def validate(client) do
    url = "#{client.api_endpoint}/#{@auth_endpoint}"

    with {:ok, response} <- Request.get(url, recv_timeout: 50000),
         {:ok, _body} <- Response.parse(response) do
      {:ok, client}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def new(client) do
    client = Map.put(client, :api_endpoint, generate_url(client))

    if Application.get_env(:wasabi_ex, :enabled) do
      Client.validate(client)
    else
      {:ok, client}
    end
  end

  defp generate_url(%Client{wasabi_port: nil} = client),
    do: "#{client.protocol}://#{client.wasabi_server}/api/#{client.version}"

  defp generate_url(client),
    do: "#{client.protocol}://#{client.wasabi_server}:#{client.wasabi_port}/api/#{client.version}"
end
