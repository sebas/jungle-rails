class Admin::MailerController < Admin::ApplicationController
  def preview_welcome()
    @user = User.last
    render :file => "mailer/welcome.html.erb", :layout => "mailer"
  end
end
