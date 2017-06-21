class ItemsController < ApplicationController
  def vote
    item = Item.find(params[:id])

    if item.votes.find_by_ip_address(request.remote_ip)
      # do nothing because this ip address has already voted
    else
      value = params[:value].to_i > 0 ? 1 : -1

      item.votes.create :value => value, :ip_address => request.remote_ip
      item.net_votes += value
      item.save
    end

    render :nothing => true
  end
end
