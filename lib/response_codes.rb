module ResponseCodes

  def ok_code
    ps.response_code = "200 OK"
  end

  def move_code
    ps.response_code = "301 Moved Permanently"
  end

  def standard_code
    ps.response_code = "302 Standard"
  end

  def unauthorized_code
    ps.response_code = "401 Unauthorized"
  end

  def forbidden_code
    ps.response_code = "403 Forbidden"
  end

  def not_found_code
    ps.response_code = "404 Not Found"
  end

  def internal_error_code
    ps.response_code = "500 Internal Server Error"
  end
end
