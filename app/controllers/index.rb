get '/' do
  if params[:word]
    @results = Word.anagrams(params[:word])
    @test = AnagramFinder.new(params[:word]).all_matches
  end
  # @results = Anagram.run!(@word)
  erb :index
end

post '/word' do
  redirect "/?word=#{params[:word]}"
end
