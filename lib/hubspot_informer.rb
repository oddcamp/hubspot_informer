require 'hubspot_informer/version'
require 'faraday'
require 'uri'
require 'json'

class HubspotInformer
  HubspotInformerError = Class.new(StandardError)
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @page_url ||= ''
    @request_ip ||= ''
    @hutk ||= ''
    @page_title ||= ''

    raise HubspotInformerError.new(
      "HubspotInformer API Error: Missing portal_id and/or form_guid"
      ) unless @portal_id && @form_guid

    base_url = "https://forms.hubspot.com/"
    @conn = Faraday.new(
      url:      base_url,
      ssl:      { verify: false },
      headers:  { accept: 'application/json' })
  end

  def submit params
    params[:hs_context] = hs_context
    response = @conn.post do |req|
      req.url "uploads/form/v2/#{@portal_id}/#{@form_guid}"
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
      req.body = URI.encode_www_form params
    end
    if response.status == 204
      response
    else
      raise HubspotInformerError.new("HubspotInformer API Error: #{response.body} (status code #{response.status})")
    end
  end

  def hs_context
    values = {
      'hutk' => @hutk,
      'ipAddress' => @request_ip,
      'pageUrl' => @page_url,
      'pageTitle' => @page_title
    }
    values.to_json
  end
end
