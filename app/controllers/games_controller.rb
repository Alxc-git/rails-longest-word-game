require 'net/http'
require 'json'

class GamesController < ApplicationController

  def new
    @liste = Array.new(10) { rand(97..122).chr }
    session[:score] = 0
  end

  def score
    @word = params[:word].upcase
    url = URI("https://dictionary.lewagon.com/#{@word}")
    response = Net::HTTP.get(url)
    @data = JSON.parse(response)

    if @data['found']
      session[:score] += @word.length
    else
      session[:score] = 0
    end

    @score = session[:score]
    raise
  end
end
