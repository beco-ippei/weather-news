class LocationsController < ApplicationController
  def index
    pos = [params[:latitude], params[:longitude]]

    address = Geocoder.search pos.join(',')

#    address.each_with_index {|e,i| p "#{i} .. ", e.data }

    data = address.map do |a|
      {
        formatted_address: a.data['formatted_address'],
        components: a.data['address_components'].reverse.map { |i|
          {types: i['types'], name: i['long_name']}
        },
        types: a.data['types'],
      }
    end

    render json: data
  end
end
