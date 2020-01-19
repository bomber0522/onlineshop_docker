class MembersController < ApplicationController

  def index
    
  end

  def show
    
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      @member.send_activation_email
      redirect_to :root, notice: "認証メールを送りましたので「Activate」をクリックしてください。"
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def member_params
    params.require(:mamber).permit(:new_profile_picture, :remove_profile_picture,
                   :name, :email, :pssword, :password_confirmation, :profile)
  end
end
