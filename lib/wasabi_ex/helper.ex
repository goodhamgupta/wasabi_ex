defmodule WasabiEx.Helper do
  alias WasabiEx.{Request, Response, Errors}

  def make_request(url, params, :get) do
    with {:ok, response} <- Request.get(url, params),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def make_request(url, params, :post) do
    require IEx
    IEx.pry
    with {:ok, response} <- Request.post(url, params),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end

  def make_request(url, params, :delete) do
    with {:ok, response} <- Request.delete(url, params),
         {:ok, body} <- Response.parse(response) do
      {:ok, body}
    else
      {:error, error} ->
        raise Errors.ApiError, Kernel.inspect(error)
    end
  end
end
