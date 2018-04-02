defmodule WozbotWeb.QuoteController do
  use WozbotWeb, :controller

  alias Wozbot.Quotes

  action_fallback WozbotWeb.FallbackController

  def index(conn, _params) do
    quotes = Quotes.list_quotes()
    render(conn, "index.json", quotes: quotes)
  end

  def random(conn, _params) do
    qte = Quotes.get_random_quote!()
    render(conn, "show.json", quote: qte)
  end

end

