class UserSession < Authlogic::Session::Base
  #attr_accessible :session_id, :data

  logout_on_timeout true
  consecutive_failed_logins_limit 10

end