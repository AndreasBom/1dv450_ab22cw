class AppIndexController < ApplicationController
  def index
    base_url = request.protocol.to_s + request.host.to_s + ":" + request.port.to_s

    response = {
        "creators": [
            {
                "create_new": base_url + '/creators/create',
                "show_all": base_url + '/creators/show/all',
                "show_single": base_url + '/creators/show/', #plus id
                "delete": '/creators/delete/' #plus id
            }
        ],
        "event": [
            {
                "create_new": base_url + '/events/create',
                "show_all": base_url + '/events/show/all',
                "show_single": base_url + '/events/show/', #plus id
                "delete": base_url + '/events/delete/', #plus id
                "update": base_url + '/event/update', #plus id
                "query": [
                    "tag": '?tag=', #in end of show_all
                    "search": '?search=' #in end of show_all
                    ""
                ]
            }
        ],
        "tag": [
            {
                "create_new": base_url + '/tags/create',
                "show_all": base_url + '/tags/show/all',
                "show_single": base_url + '/tags/show/', #plus id
                "delete": base_url + '/tags/delete' #plus id
            }
        ],
        "positions": [
            {
                "create_new": base_url + '/positions/create',
                "show_all": base_url + '/positions/show/all',
                "show_single": base_url + '/positions/show/', #plus id
                "delete": base_url + '/positions/delete', #plus id
                "nearby": base_url + '/nearby' # needs to be combined with show_single and an ID. ex. show_all + 1 + nearby will show nearbys from position with id 1
            }
        ]
    }

    render json: response
  end
end
