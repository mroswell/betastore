class UserMailerPreview <ActionMailer::Preview
  def welcome
    UserMailer.welcome(User.last)
  end
end
