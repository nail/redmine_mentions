class MentionMailer < ActionMailer::Base
  layout 'mailer'
  default :from => Setting.mail_from
  def self.default_url_options
    Mailer.default_url_options
  end
  
  
  def notify_mentioning(issue, journal, user)
    @issue = issue
    @journal = journal
    @issue_url = url_for(:controller => 'issues', :action => 'show', :id => issue)
    mail :to => user.mail,
        :subject => "You were mentioned in a note of ##{issue.id} - #{issue.subject} (#{issue.status.name})"
  end
end
