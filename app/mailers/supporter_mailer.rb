class SupporterMailer < ApplicationMailer
  default from: "jhg2v@virginia.edu"

  def supporter_report(user)
    @user = user
    @dailies = user.dailies
    @supporter = user.supporter
    mail to: user.supporter.email, subject: "Goal Report for #{@user.full_name}"
  end

end
