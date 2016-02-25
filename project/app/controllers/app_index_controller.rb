class AppIndexController < ApplicationController
  def index
    url = request.protocol.to_s + request.host.to_s + ":" + request.port.to_s

    response = {
        "creators": [
            {
                "create_new": url + '/creators/create',
                "show_all": url + '/creators/show/all',
                "show_single": url + '/creators/show/',
                "delete": '/creators/delete/'
            }
        ],
        "event": [
            {
                "create_new": url + '/events/create',
                "show_all": url + '/events/show/all',
                "show_single": url + '/events/show/',
                "delete": '/events/delete/',
                "search_tag": '/?tag='
            }
        ],
        "tag": [
            {
                "create_new": url + '/tags/create',
                "show_all": url + '/tags/show/all',
                "show_single": url + '/tags/show/',
                "delete": '/tags/delete'
            }
        ],
        "positions": [
            {
                "create_new": url + '/positions/create',
                "show_all": url + '/positions/show/all',
                "show_single": url + '/positions/show/',
                "delete": '/positions/delete'
            }
        ]
    }

    render json: response
  end
end
