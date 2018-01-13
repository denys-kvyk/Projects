class ApplicationSource
  attr_reader :browserName, :driverPath, :implicitWaitTimeOut, \
    :baseUrl, :userLoginUrl, :userLogoutUrl, \
    :adminLoginUrl, :adminLogoutUrl

  def initialize(browserName, driverPath, implicitWaitTimeOut, \
                 baseUrl, userLoginUrl, userLogoutUrl, \
                 adminLoginUrl, adminLogoutUrl)
    @browserName = browserName
    @driverPath = driverPath
    @implicitWaitTimeOut = implicitWaitTimeOut
    @baseUrl = baseUrl
    @userLoginUrl = userLoginUrl
    @userLogoutUrl = userLogoutUrl
    @adminLoginUrl = adminLoginUrl
    @adminLogoutUrl = adminLogoutUrl
  end

end
