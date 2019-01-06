defmodule WasabiEx.Errors.NotImplemented do
  defexception [:reason]

  def exception(reason), do: %__MODULE__{reason: reason}

  def message(%__MODULE__{reason: reason}), do: "WasabiEx::NotImplemented - #{reason}"
end

defmodule WasabiEx.Errors.ApiError do
  defexception [:reason]

  def exception(reason), do: %__MODULE__{reason: reason}

  def message(%__MODULE__{reason: reason}), do: "WasabiEx::ApiError - #{reason}"
end

defmodule WasabiEx.Errors.InvalidParam do
  defexception [:reason]

  def exception(reason), do: %__MODULE__{reason: reason}

  def message(%__MODULE__{reason: reason}), do: "WasabiEx::InvalidParam - #{reason}"
end
