# HubSpot Informer for Ruby

A simple API wrapper for HubSpot form submission API.

## Usage

### In Rails

    hubspot = HubspotInformer.new(
      # These are mandatory
      portal_id: 1234,
      form_guid: 567890,
      # These are optional
      request_ip: request.remote_ip,
      hutk: cookies[:hutk],
      page_url: "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
      page_title: @title
      )
    hubspot.submit params

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
