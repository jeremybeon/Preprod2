/**
 * ColorFeatures
 *
 * @author    silbersaiten <info@silbersaiten.de>
 * @copyright 2019 silbersaiten
 * @license   See joined file licence.txt
 * @link      http://www.silbersaiten.de
 * @support   silbersaiten <support@silbersaiten.de>
 * @category  Module
 * @version   1.0.0
 */

var AdminColorFeatures = {
    init: function () {
        this.listeners();
        this.addColourBlock();
    },
    listeners: function () {
        $(document).on('click', 'input[name=is_colour_feature]', function () {
            AdminColorFeatures.propertiesTrigger(parseInt($(this).val()))
        });
    },
    propertiesTrigger: function (show) {
        if (show) {
            $('#feature_value_form .colorAttributeProperties').slideDown();
        } else {
            $('#feature_value_form .colorAttributeProperties').slideUp();
        }
    },
    addColourBlock: function () {
        $.post(af_tpl_path,
            {
                action: "GetTemplate",
                ajax: true,
                id_feature_value: $('#id_feature_value').val()
            })
            .done(function (data) {
                $('.form-wrapper').append(data);

                AdminColorFeatures.propertiesTrigger(parseInt($('input[name=is_colour_feature]:checked').val()));
				
				$.fn.mColorPicker.defaults.imageFolder =  '../img/admin/';
				
                $('input.color').mColorPicker($.fn.mColorPicker.defaults);
            });
    }
};


$(document).ready(function () { alert(2);
    if ($('#feature_value_form').length) {
        AdminColorFeatures.init();
    }
	
	$('#table-feature_value .btn-group.pull-right a.edit').addClass('btn btn-default');
});
