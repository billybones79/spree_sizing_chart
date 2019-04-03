module Spree
  module Admin
    class TemplateChartsController < ResourceController
      def ajax
        render json: Spree::TemplateChart.find(params[:id])
      end

      protected

      def permitted_resource_params
        params.require(:template_chart).permit(:name, :chart_table)
      end
    end
  end
end
