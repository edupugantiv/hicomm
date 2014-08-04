class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :load_postable

  def index
    @posts = @postable.posts
  end

  def new
    @post = @postable.posts.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create

    @account_sid = 'AC8bbb26ca09317b88c68ffc3f0028deb3'
    @auth_token = '8227e8dfb59538d2cb2002cac66f7097'
    @twilio_client = Twilio::REST::Client.new @account_sid, @auth_token

    @post = @postable.posts.new(post_params)

    if @postable.instance_of?(Post)
        target = @postable.postable
        @post.header = @postable.header
        @post.message_type = "message"
    else
        target = @postable
        @post.message_type = "conversation"
    end

      @users = target.users-[current_user]

    if not current_user.nil? then
      @post.user = current_user
      @post.source = "web"
    else
      @post.user = User.find_by_pho1ne_number(post_params[:phone_number])
      @post.source = "sms"
    end

    if @post.content == "" then
      redirect_to @postable, alert: "cannot post empty message"
    else

    @users.each do |u|
      if not u.phone_number.nil? and u.phone_number != post_params[:title] then
        @twilio_client.account.messages.create(:body => post_params[:content],
          :to => u.phone_number,
          :from => "+17572169373"
          ) 
      end
    end

    if @post.save
      redirect_to @postable, notice: "post created."
    else
      render :new
    end
  end
end

private

  def load_postable
    resource, id = request.path.split('/')[1, 2]
    @postable = resource.singularize.classify.constantize.find(id)
  end

  def post_params
      params.require(:post).permit(:header, :content, :user, :phone_number, :post)
   end

  # def load_postable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @postable = klass.find(params["#{klass.name.underscore}_id"])
  # end

end
