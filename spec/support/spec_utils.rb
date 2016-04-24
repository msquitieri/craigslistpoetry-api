module SpecUtils
  def api_header
    {
        'X-api-key' => valid_api_key
    }
  end

  def no_params
    {}
  end

  def valid_api_key
    'funfunfun'
  end

  def response_json
    JSON.parse(response.body)
  end
end