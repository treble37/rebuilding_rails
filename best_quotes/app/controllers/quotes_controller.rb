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
    ua = request.user_agent
    render_response :quote, :obj => quote_1,:ua => ua
  end
  def index
    quotes = FileModel.all
    render_response :index, :quotes => quotes
  end
  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels.",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    ua = request.user_agent
    render :quote, :obj => m,:ua => ua
  end
  def update_quote
    FileModel.save({"submitter"=>"Spock"})
    quote_1 = FileModel.find(1)
    ua = request.user_agent
    render :quote, :obj => quote_1,:ua => ua
  end
  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote,:ua => ua
  end
  def quote_auto_render
    quote_auto_render = FileModel.find(1) 
  end
end