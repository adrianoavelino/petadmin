module Admin
  class SellsController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :ipdate]

    def adjust_enum
      params[:sell][:status] = params[:sell][:status].to_i
    end
  end
end
