module SpecUtils
  def api_header(api_key)
    {
        'X-api-key' => api_key
    }
  end

  def no_params
    {}
  end

  def response_json
    JSON.parse(response.body)
  end
end