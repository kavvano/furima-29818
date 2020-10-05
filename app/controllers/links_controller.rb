class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_user
  before_action :check_sold_out

  def index
    @link_item = LinkItem.new
  end

  def create
    @link_item = LinkItem.new(link_params)
    if @link_item.valid?
      @link_item.save
      pay_item
      @item.update(sold_out: true)
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def link_params
    params.require(:link_item).permit(:post_num, :area_id, :city, :address, :building, :cell_num).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def check_sold_out
    if @item.sold_out
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: link_params[:token],
      currency: 'jpy'
    )
  end
end
