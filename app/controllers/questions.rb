get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  @question = Question.new
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/comment/new' do
  @question = Question.find(params[:id])
  erb :'comments/new_for_question', locals: { question: @question }
end


post '/questions' do
  @question = Question.new(params[:question])
  @question.asker_id = current_user.id
  if @question.save
    redirect '/'
  else
    status 422
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

post '/questions/:id/comments' do

  @question = Question.find(params[:id])
  @comment = Comment.create(content: params[:comment_content], commentable_type: "Question", commentable_id: @question.id, commenter_id: current_user.id)

  if @comment.valid?
    redirect "/questions/#{@question.id}"
  else
    status 422
    @errors = @comment.errors.full_messages
    erb :'comments/new_for_question'
  end

end

get '/questions/:id/answer/new' do
  @question = Question.find(params[:id])
  erb :'answers/new', locals: { question: @question }
end

post '/questions/:id/answers' do

  @question = Question.find(params[:id])
  @answer = Answer.create(body: params[:body], question_id: @question.id, creator_id: current_user.id)

  if @answer.valid?
    redirect "/questions/#{@question.id}"
  else
    status 422
    @errors = @answer.errors.full_messages
    erb :'comments/new_for_answer'
  end
end

