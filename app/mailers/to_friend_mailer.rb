class ToFriendMailer < ActionMailer::Base

  def mail_to_friend(object, mail_to_friend)
    @object = object
    @mail = mail_to_friend
    opts = {}

    if mail_to_friend.hide_recipients && Spree::Config[:hidden_recipients_to_address]
      opts[:to] = Spree::Config[:hidden_recipients_to_address]
      opts[:bcc] = mail_to_friend.recipient_email
    else
      opts[:to] = mail_to_friend.recipient_email
    end
    #default_url_options[:host] = mail_to_friend.host
    opts[:subject] =  mail_to_friend.subject
    opts[:reply_to] = mail_to_friend.sender_email

    mail(opts)
  end
end
