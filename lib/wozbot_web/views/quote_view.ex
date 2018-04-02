defmodule WozbotWeb.QuoteView do
  use WozbotWeb, :view
  alias WozbotWeb.QuoteView

  def render("index.json", %{quotes: quotes}) do
    %{data: render_many(quotes, QuoteView, "quote.json")}
  end

  def render("show.json", %{quote: qte}) do
    %{data: render_one(qte, QuoteView, "quote.json")}
  end

  def render("quote.json", %{quote: qte}) do
    %{
      quotation: qte.quotation,
      author: qte.author}
  end
end
