get '/' do
  @word = params[:word]
  erb :index
end

post '/word' do
  redirect "/?word=#{params[:word]}"
end
