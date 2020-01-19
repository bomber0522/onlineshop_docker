class PasswordResetsController < ApplicationController

  def new
    
  end

  def create
    @member = Member.find_by(email: params[:password_reset][:email].downcase)
    if @member
      @member.create_reset_digest
      @member.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to :root
    else
      flash.now[:danger] = "Email address not found"
      render "new"
    end
  end

  def edit
    
  end

  def update
    if params[:member][:password].empty?
      @member.errors.add(:password, :blank)
      render 'edit'
    elsif @member.update_attributes(member_params)
      log_in @member
      flash[:success] = "Password has been reset."
      redirect_to @member
    else
      render 'edit'
    end
  end

  private

  def member_params
    params.require(:member).permit(:password, :password_confirmation)
  end
end
