module Spree
  class SizingChart < Spree::Base
    belongs_to :taxon, :class_name => 'Spree::Taxon', :foreign_key => 'taxon_id'
    belongs_to :brand, :class_name => 'Spree::Taxon', :foreign_key => 'brand_id'

    validates :brand, presence: true
    validates :taxon, presence: true
    validates_uniqueness_of :taxon_id, :scope => :brand_id



  end
end


