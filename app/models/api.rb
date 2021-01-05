class Api

  def url_creator(pokemon)
    url = "https://pokeapi.co/api/v2/pokemon?limit=151"
    uri = URI.parse(url)
    response = Net::HTTP.get_resposne(uri)
    response.body

    @pokemon_data = JSON.parse(response.body)
  end
end




