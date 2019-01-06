defmodule WasabiEx.Request do
  @moduledoc """
  This module provides function to perform HTTP calls to the collector
  endpoint.
  """
  require HTTPoison

  use HTTPoison.Base

  defp base_headers do
    auth_token = Application.get_env(:wasabi_ex, :auth_token)

    %{
      "Authorization" => "Basic #{auth_token}",
      "Accept" => "Application/json; Charset=utf-8",
      "Content-Type" => "application/json"
    }
  end

  def process_request_headers(request_headers) do
    headers =
      request_headers
      |> Enum.into(%{})

    Map.merge(base_headers(), headers)
    |> Enum.into([])
  end

  # :timeout - timeout to establish a connection, in milliseconds.
  # :recv_timeout - timeout used when receiving a connection.
  def process_request_options(_options) do
    [timeout: 5000, recv_timeout: 5000]
  end
end
