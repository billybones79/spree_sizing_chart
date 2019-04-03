module Spree
  module Admin
    class TemplateChartsController < ResourceController
      def ajax
        render json: Spree::TemplateChart.find(params[:id])
      end
    end
  end
end
