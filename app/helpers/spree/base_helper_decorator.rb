Spree::BaseHelper.class_eval do
  def get_sizing_chart(product)
    brand = product.taxons.where(taxonomy_id: Rails.configuration.brand_id).pluck(:id)
    taxons = product.taxons.where(taxonomy_id: Rails.configuration.category_id).map(&:self_and_ancestors).flatten.uniq
    chart = Spree::SizingChart.where("taxon_id IN (?) AND brand_id IN (?)", taxons, brand).joins(:taxon).order("spree_taxons.lft")
    chart ||= Spree::SizingChart.where("taxon_id IN (?) AND brand_id = (?)", taxons, Rails.configuration.brand_id).joins(:taxon).order("spree_taxons.lft")
    return nil if chart.empty?

    chart.last

  end
end

