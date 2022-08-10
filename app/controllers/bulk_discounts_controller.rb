class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @holidays = HolidayFacade.find_holidays
  end
  
  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.bulk_discounts.create(discount_params)
    redirect_to merchant_bulk_discounts_path(merchant.id)
  end

   def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    discount = BulkDiscount.find(params[:id]).destroy
    redirect_to merchant_bulk_discounts_path(merchant.id)
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    discount = BulkDiscount.find(params[:id])  
    discount.update(discount_params)
    redirect_to merchant_bulk_discount_path(merchant, discount)  
  end

  private 
  def discount_params
    params.permit(:percent, :threshold)    
  end
end 