#initialize recaptcha.rb
Recaptcha.configure do |config|
    config.site_key = Rails.application.credentials.dig(:recaptcha, :site_key)
    config.site_key  = '6Ld_e5MdAAAAAFn4c4d9RoEGmrAAs6rPx68PDcs8'
    config.secret_key = '6Ld_e5MdAAAAAF7niN7zwZ8Fz1wgMZ_f24Vv4uXA'
    #uncomment the following line if you are using a proxy
    #config.proxy = 'http://myproxy.com.au:8080'
  end