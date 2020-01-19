class MembersController < ApplicationController

  def index
    @members = Member.paginate(page: params[:page], per_page: 15)
  end

  def show
    @member = Member.find(params[:id])
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
    if @member.update_attributes(member_params)
      redirect_to @member, notice: "変更が完了しました。"
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private

  def member_params
    params.require(:mamber).permit(:new_profile_picture, :remove_profile_picture,
                   :name, :email, :pssword, :password_confirmation, :profile)
  end
end
