class CustomAuthenticationFailure < Devise::FailureApp 
  protected 
    def redirect_url 
      hotel_path(params[:hotel_id]) #rootに飛ばす場合
  #    root_path+"users/auth/facebook" #自動でfacebook認証させる場合
    end 
  end 