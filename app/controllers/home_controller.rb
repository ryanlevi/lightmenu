class HomeController < ApplicationController
  def index

  end

  def app
    test = "https://api.nutritionix.com/v1_1/search/taco-bell?results=0:20&fields=item_name,nf_calories&appId=#{ENV["N_ID"]}&appKey=#{ENV["N_KEY"]}"
    response = HTTParty.get(test)
    parsed_responsed = response.parsed_response

    @out = []
    parsed_responsed["hits"].each do |x|
      @out.push x["fields"]["item_name"] if params["calories"].to_i >= x["fields"]["nf_calories"]
    end

  end
end
