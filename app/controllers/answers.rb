get "/answers/:id/comment/new" do
  @answer = Answer.find(params[:id])
  erb :'comments/new_for_answer', locals: { answer: @answer }
end

post "/answers/:id/comments" do

  @answer = Answer.find(params[:id])
  @comment = Comment.create(content: params[:comment_content], commentable_type: "Answer", commentable_id: @answer.id, commenter_id: current_user.id)

  if @comment.valid?
    redirect "/questions/#{@answer.question.id}"
  else
    status 422
    @errors = @comment.errors.full_messages
    erb :'comments/new_for_answer'
  end

end
