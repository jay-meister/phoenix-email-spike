defmodule EmailSpike.Email do
  use Bamboo.Phoenix, view: EmailSpike.EmailView

  def welcome_html_email(email_address) do
    welcome_text_email(email_address)
    |> put_html_layout({EmailSpike.LayoutView, "email.html"})
    |> render("welcome.html")
  end


  def welcome_text_email(email_address) do
    base_email()
    |> to(email_address)
    |> subject("Welcome!")
    |> put_text_layout({EmailSpike.LayoutView, "email.text"})
    |> render("welcome.text")
  end

  defp base_email do
    new_email()
    |> from("jmurphy.web@gmail.com")
    |> put_header("Reply-To", "jmurphy.web@gmail.com")
  end
end
