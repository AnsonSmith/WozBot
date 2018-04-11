defmodule WozbotWeb.PageController do
  use WozbotWeb, :controller
  alias Wozbot.Quotes

  def index(conn, _params) do
    %{author: author, quotation: quotation} = Quotes.get_random_quote!()
    conn
    |> assign(:author, author)
    |> assign(:quotation, quotation)
    |> render("index.html")
  end
end
