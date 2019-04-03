var set_taxon_select_from_parent = function(selector, parent){
    if ($(selector).length > 0) {
        $(selector).select2({
            placeholder: Spree.translations.taxon_placeholder,
            multiple: true,
            maximumSelectionSize: 1,
            initSelection: function (element, callback) {
                var url = Spree.url(Spree.routes.taxons_search, {
                    ids: element.val(),
                    token: Spree.api_key
                });
                return $.getJSON(url, null, function (data) {
                    return callback(data['taxons']);
                });
            },
            ajax: {
                url: Spree.routes.taxons_search,
                datatype: 'json',
                data: function (term, page) {
                    return {
                        per_page: 50,
                        page: page,
                        parent_id: parent,
                        without_children: true,
                        q: {
                            name_cont: term
                        },
                        token: Spree.api_key
                    };
                },
                results: function (data, page) {
                    var more = page < data.pages;
                    return {
                        results: data['taxons'],
                        more: more
                    };
                }
            },
            formatResult: function (taxon) {
                return taxon.pretty_name;
            },
            formatSelection: function (taxon) {
                return taxon.pretty_name;
            }
        });
    }
}

$(document).ready(function () {

    set_taxon_select_from_parent('#sizing_chart_taxon_id', 1);
    set_taxon_select_from_parent('#sizing_chart_brand_id', 2);

    //Permet de gérer le contenu du editor et de faire un backup du contenu si on selectionne un template pour revenir en arrière
    var backup;
    $('select#template').select2().change(function() {
        $.ajax({
            url: "/admin/template_chart/ajax",
            data: {id: $(this).val()},
            dataType: 'json',
            success: function(data) {
                backup = CKEDITOR.instances.sizing_chart_chart_table.getData();
                CKEDITOR.instances.sizing_chart_chart_table.setData(data.chart_table);
                $("button#btn_backup").prop("disabled", false );
            }
        })
    });
    $('button#btn_backup').click(function() {
        CKEDITOR.instances.sizing_chart_chart_table.setData(backup);
        $("button#btn_backup").prop("disabled", true );
        $('select#template').val(null);
    });
});
