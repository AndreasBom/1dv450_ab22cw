class AppIndexController < ApplicationController
  def index
    base_url = request.protocol.to_s + request.host.to_s + ":" + request.port.to_s

    response = {
        "creators": [
            {
                "create_new": base_url + '/creators/create',
                "show_all": base_url + '/creators/show/all',
                "show_single": base_url + '/creators/show/',
                "delete": '/creators/delete/'
            }
        ],
        "event": [
            {
                "create_new": base_url + '/events/create',
                "show_all": base_url + '/events/show/all',
                "show_single": base_url + '/events/show/',
                "delete": '/events/delete/',
                "query": [
                    "tag": '?tag=',
                    "search": '?search='
                ]
            }
        ],
        "tag": [
            {
                "create_new": base_url + '/tags/create',
                "show_all": base_url + '/tags/show/all',
                "show_single": base_url + '/tags/show/',
                "delete": '/tags/delete'
            }
        ],
        "positions": [
            {
                "create_new": base_url + '/positions/create',
                "show_all": base_url + '/positions/show/all',
                "show_single": base_url + '/positions/show/',
                "delete": '/positions/delete'
            }
        ]
    }

    render json: response
  end
end
