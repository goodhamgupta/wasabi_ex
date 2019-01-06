defmodule WasabiEx.Client do
  @moduledoc """
  Module to authenticate user token with wasabi server
  """

  alias WasabiEx.{Errors, Request, Response}

  alias __MODULE__

  @auth_endpoint "authentication/verifyToken"

  @keys [
    auth_token: Application.get_env(:wasabi_ex, :auth_token, nil),
    wasabi_endpoint: Application.get_env(:wasabi_ex, :wasabi_endpoint, nil),
    wasabi_port: Application.get_env(:wasabi_ex, :wasabi_port, "8080"),
    protocol: Application.get_env(:wasabi_ex, :protocol, "http")
  ]

  defstruct @keys

  @type t :: %__MODULE__{
          auth_token: String.t(),
          wasabi_endpoint: String.t(),
          wasabi_port: String.t(),
          protocol: String.t()
        }

  def validate(%Client{auth_token: nil}) do
    raise Errors.InvalidParam, "auth_token cannot be nil"
  end

  def validate(%Client{auth_token: ""}) do
    raise Errors.InvalidParam, "auth_token cannot be empty string"
  end

  def validate(%Client{wasabi_endpoint: nil}) do
    raise Errors.InvalidParam, "wasabi_endpoint cannot be nil"
  end

  def validate(%Client{wasabi_endpoint: ""}) do
    raise Errors.InvalidParam, "wasabi_endpoint cannot be empty string"
  end

  def validate(client) do
    url = "#{Client.get_url(client)}/#{@auth_endpoint}"

    with {:ok, response} <- Request.get(url, recv_timeout: 50000),
         {:ok, _body} <- Response.parse(response) do
      {:ok, client}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def get_url(%Client{wasabi_port: nil} = client),
    do: "#{client.protocol}://#{client.wasabi_endpoint}/api/v1"

  def get_url(client),
    do: "#{client.protocol}://#{client.wasabi_endpoint}:#{client.wasabi_port}/api/v1"

  def new do
    Client.validate(%Client{})
  end
end
