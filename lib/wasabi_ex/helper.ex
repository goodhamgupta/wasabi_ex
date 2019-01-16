defmodule WasabiEx.Helper do
  alias WasabiEx.{Request, Response, Errors}

  def make_request(token, url, params, :get) do
    headers = get_headers(token)

    with {:ok, response} <- Request.get(url, params, headers),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def make_request(token, url, params, :post) do
    headers = get_headers(token)

    with {:ok, response} <- Request.post(url, params, headers),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def make_request(token, url, params, :delete) do
    headers = get_headers(token)

    with {:ok, response} <- Request.delete(url, params, headers),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  defp get_headers(token) do
    [
      Authorization: "Basic #{token}",
      Accept: "Application/json; Charset=utf-8",
      "Content-Type": "application/json"
    ]
  end
end
