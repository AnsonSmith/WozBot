defmodule Wozbot.Quotes do
  @moduledoc """
  The Quotes context.
  """
  alias Wozbot.Quotes.QuoteServer

  @doc """
  Returns the list of quotes.

  ## Examples

      iex> list_quotes()
      [%Quote{}, ...]

  """
  def list_quotes do
    QuoteServer.all_quotes()
  end

  @doc """
  Gets a random single quote.
  ## Examples

      iex> random_quote!()
      %Quote{}

  """
  def get_random_quote!(), do: QuoteServer.random_quote()
end
