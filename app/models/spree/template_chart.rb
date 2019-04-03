module Spree
  class TemplateChart < Spree::Base
    validates :name, :presence => true, uniqueness: true
    validates :chart_table, :presence => true



  end
end