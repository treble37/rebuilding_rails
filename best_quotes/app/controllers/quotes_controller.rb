# best_quotes/app/controllers/quotes_controller.rb
class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end
  def redirected_quote
    "Redirecting quotes..."
  end
  def exception
    raise "It's a bad one!"
  end
  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end
  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels.",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end
  def update_quote
    FileModel.save({"submitter"=>"Spock"})
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end
end