module Spree
  module Admin
    class SizingChartsController < ResourceController

      before_action :load_data, except: :index

      def index
        @sizing_charts = Spree::SizingChart.all
      end

      def load_data
        @taxons = Taxon.order(:name)
        @template_charts = Spree::TemplateChart.all
      end

      protected

      def permitted_resource_params
        params.require(:sizing_chart).permit(:taxon_id, :brand_id, :chart_table)
      end
    end
  end
end
