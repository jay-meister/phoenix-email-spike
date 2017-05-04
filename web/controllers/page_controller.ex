defmodule EmailSpike.PageController do
  use EmailSpike.Web, :controller

  def index(conn, _params) do
    EmailSpike.Email.welcome_html_email("jmurphy.web@gmail.com") |> EmailSpike.Mailer.deliver_now
    render conn, "index.html"
  end
end
