{*
 * ColorFeatures
 *
 * @author    silbersaiten <info@silbersaiten.de>
 * @copyright 2019 silbersaiten
 * @license   See joined file licence.txt
 * @link      http://www.silbersaiten.de
 * @support   silbersaiten <support@silbersaiten.de>
 * @category  Module
 * @version   1.0.0
 *}
 
<style>
	#mColorPickerImg{ background-image: url("../img/admin/colorpicker.png") !important; }
	#mColorPickerImgGray{ background-image: url("../img/admin/graybar.jpg") !important; }
	#mColorPickerFooter{ background-image: url("../img/admin/grid.gif") !important; }
</style>

<div class="form-group">
    <label class="control-label col-lg-3">
        {l s='Is colour feature' mod='colorfeatures'}
    </label>
    <div class="col-lg-9">
        <span class="switch prestashop-switch fixed-width-lg">
            <input type="radio" name="is_colour_feature" id="is_colour_feature_on" value="1"
                  {if isset($feature.value) && $feature.value}checked="checked"{/if}>
            <label for="is_colour_feature_on">{l s='Yes' mod='colorfeatures'}</label>
            <input type="radio" name="is_colour_feature" id="is_colour_feature_off" value="0"
                   {if !isset($feature.value) || !$feature.value}checked="checked"{/if}>
            <label for="is_colour_feature_off">{l s='No' mod='colorfeatures'}</label>
            <a class="slide-button btn"></a>
        </span>
        <p class="help-block">
            {l s="Opened colour properties" mod='colorfeatures'}
        </p>
    </div>
</div>
<div class="colorAttributeProperties">
    <div class="form-group">
        <label class="control-label col-lg-3">
            <span>
                {l s="Colour" mod='colorfeatures'}
            </span>
        </label>
        <div class="col-lg-9">
            <div class="form-group">
                <div class="col-lg-2">
                    <div class="row">
                        <div class="input-group">
                            <input type="text" class="color" name="color" value="{if isset($feature.value) && $feature.value}{$feature.value}{else}#000000{/if}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
