Spree::Api::TaxonsController.class_eval do

  def index
    if taxonomy
      @taxons = taxonomy.root.children.active
    else
      if params[:ids]
        @taxons = Spree::Taxon.includes(:children).accessible_by(current_ability, :read).where(id: params[:ids].split(','))
      elsif params[:parent_id]
        @taxons = Spree::Taxon.includes(:children).accessible_by(current_ability, :read).where(taxonomy_id: params[:parent_id]).order(:taxonomy_id, :lft).ransack(params[:q]).result
      else
        @taxons = Spree::Taxon.includes(:children).accessible_by(current_ability, :read).order(:taxonomy_id, :lft).ransack(params[:q]).result
      end
    end

    @taxons = @taxons.page(params[:page]).per(params[:per_page])
    respond_with(@taxons)
  end

end

