require 'net/http'
require 'json'

class GamesController < ApplicationController

  def new
    @liste = Array.new(10) { rand(97..122).chr }
  end

  def score
    @word = params[:word]
    url = URI("https://dictionary.lewagon.com/#{@word}")
    response = Net::HTTP.get(url)
    @data = JSON.parse(response)
    raise # Trouver comment recuperer le @data[:found] si il est true ou false
  end
end
