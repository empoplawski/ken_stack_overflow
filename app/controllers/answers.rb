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

post '/answers/:id/upvote' do
  @answer = Answer.find(params[:id])
  @up_vote = Vote.new(votable_type: "Answer", value: 1, votable_id: @answer.id, voter_id: current_user.id)
  if @up_vote.save
    redirect back
  else
    @message = "You can only vote once!!!"
    redirect "/questions/#{@answer.question.id}?message=#{@message}"

  end
end

post '/answers/:id/downvote' do
  @answer = Answer.find(params[:id])
  @down_vote = Vote.new(votable_type: "Answer", value: -1, votable_id: @answer.id, voter_id: current_user.id)
  if @down_vote.save
    redirect back
  else
    @message = "You can only vote once!!!"
    redirect "/questions/#{@answer.question.id}?message=#{@message}"
  end
end
