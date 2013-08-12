get '/' do
  @notes = Note.all
  @message = params[:message]
  erb :index
end

get '/notes/new' do
  erb :new_note  
end

post '/notes' do
  @note = Note.create(title: params[:title], content: params[:content])
  erb :show
end

delete '/notes/:id' do
  note = Note.find(params[:id])
  if note.destroy
    redirect '/?message=Note%20has%20been%20deleted'
  else
    redirect '/?message=There%20was%20a%20problem%20deleting%20the%20note' 
  end
end

get '/notes/:id/update' do
  @note = Note.find(params[:id])
  erb :update_note  
end

put '/notes/:id' do
  note = Note.find(params[:id])
  note.update_attributes(title: params[:title], content: params[:content])
  redirect '/'
end
