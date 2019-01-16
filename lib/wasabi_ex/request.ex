defmodule WasabiEx.Request do
  @moduledoc """
  This module provides function to perform HTTP calls to the collector
  endpoint.
  """
  require HTTPoison

  use HTTPoison.Base

  # :timeout - timeout to establish a connection, in milliseconds.
  # :recv_timeout - timeout used when receiving a connection.
  def process_request_options(_options) do
    [timeout: 5000, recv_timeout: 5000]
  end
end
