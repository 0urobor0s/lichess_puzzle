require "http/client"
require "json"

class Lichess::Puzzle
  getter id

  def self.daily
    response = HTTP::Client.get(
      "https://lichess.org/training/daily",
      headers: HTTP::Headers{"Accept" => "application/vnd.lichess.v5+json"}
    )
    value = JSON.parse(response.body)

    self.new(value["puzzle"]["id"].to_s).download
  end

  def initialize(id : String)
    @id = id
  end

  def download
    image_url = "https://lichess1.org/training/export/gif/thumbnail/"
    image = HTTP::Client.get("#{image_url}#{id}.gif")
    image.body
  end
end
