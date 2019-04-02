module Spree
  module Admin
    class SizingChartsController < ResourceController

      before_action :load_data, except: :index

      def index
        @sizing_charts = Spree::SizingChart.all
      end

      def load_data
        @taxons = Taxon.order(:name)
      end

    end
  end
end
