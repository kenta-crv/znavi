class EstimateMailer < ActionMailer::Base
  default from: "reform@factoru.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "driver@factoru.jp"
    mail(subject: 'ドライバドズより見積り依頼が届きました') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: 'ドライバドズにお問い合わせ頂きありがとうございます') do |format|
      format.text
    end
  end

  def client_email(estimate)
    @estimate = estimate
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: 'ドライバドズより見積り依頼が届きました') do |format|
      format.text
    end
  end

  def regist_user(user)
    @user = user
    mail to: @user.email
    mail(subject: 'ドライバドズに会員登録頂きありがとう御座います') do |format|
      format.text
    end
  end
end
