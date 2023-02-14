class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def purchases_data
    @date_filter = params[:date_filter]

    datetime = DateTime.parse(@date_filter)

    @purchases = Purchase.all.order(purchased_at: :desc)
    @purchases = @purchases.where(purchased_at: datetime.beginning_of_day..datetime.end_of_day) if @date_filter.present?
  end
end
