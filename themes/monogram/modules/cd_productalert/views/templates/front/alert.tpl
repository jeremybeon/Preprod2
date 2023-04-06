{extends file='customer/page.tpl'}

{$page.body_classes['page-customer-account'] = true}


{block name="page_title"}
    {$title|escape:'htmlall':'UTF-8'}
{/block}

{block name="page_content"}
    <section class="product-alert">
        <form action="{$action_link}" method="post">
            <div class="row">
                <div class="col-md-6 col-xs-12">
                    {if isset($attributes) && !empty($attributes)} 
                        {foreach from=$attributes item=group key=k}
                            <div class="form-group customfield">
                                <label class="label_field form-control-label">{$group.name}</label>
                                <select class="form-control form-control-select" name="attribute[{$group.group_id}]">
                                    <option value="" style="height: 0;"></option>
                                    {foreach from=$group.attributes item=attr key=attr_key}
                                        {assign var="is_selected" value=false}
                                        {if isset($selected_attributes)}
                                            {foreach from=$selected_attributes item=sa key=sak}
                                                {if $attr.id_attribute == $a.id_attribute}
                                                    {assign var="is_selected" value=true}
                                                {/if}
                                            {/foreach}
                                        {/if}
                                        <option {if (isset($alert) && $alert && isset($alert->attributes) && in_array($attr.id_attribute,$alert->attributes)) || $is_selected}selected="selected"{/if} value="{$attr.id_attribute}">
                                            {$attr.name}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        {/foreach}
                    {/if}
                    {if isset($features) && !empty($features)} 
                        {foreach from=$features item=feature key=fk}
                            <div class="form-group customfield">
                                <label class="label_field form-control-label">{$feature.name}</label>
                                <select class="form-control  form-control-select" name="feature[{$feature.feature_id}]">
                                    <option value="" style="height: 0"></option>
                                    {foreach from=$feature.values item=value key=val_key}
                                        {assign var="is_selected" value=false}
                                        {if isset($selected_features)}
                                            {foreach from=$selected_features item=sf key=sfk}
                                                {if $value.id_feature_value == $sf.id_feature_value}
                                                    {assign var="is_selected" value=true}
                                                {/if}
                                            {/foreach}
                                        {/if}
                                        <option {if (isset($alert) && $alert && isset($alert->features) && in_array($value.id_feature_value,$alert->features)) || $is_selected}selected="selected"{/if} value="{$value.id_feature_value}">
                                            {$value.value}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        {/foreach}
                    {/if}
                </div>

                <div class="col-md-6 col-xs-12">
                {if isset($alert) && $alert}
                    <input value="{$alert->id}" name="id_alert" type="hidden"/>
                {/if}
                    <div class="form-group customfield">
                        <label class="label_field form-control-label">
                            {l s="Donnez un nom à cette alerte" d="Modules.Cdproductalert.alert"}
                            <span class="text-danger">*</span>
                        </label>
                        <input value="{if isset($alert) && $alert}{$alert->alert_name|escape:'htmlall':'UTF-8'}{/if}" name="alert_name" class="form-control" />
                    </div>
                    <div class="form-group customfield">
                        <label class="label_field form-control-label">
                            {l s="Votre budget" d="Modules.Cdproductalert.alert"}
                        </label>
                        <input name="alert_price" value="{if isset($alert) && $alert}{$alert->alert_price|escape:'htmlall':'UTF-8'}{/if}" class="form-control" />
                    </div>
                    {if isset($suppliers) && !empty($suppliers)} 
                        <div class="form-group customfield">
                            <label class="label_field form-control-label">{l s="Fournisseurs" d="Modules.Cdproductalert.alert"}</label>
                            <select class="form-control  form-control-select" name="supplier">
                                <option value="" style="height: 0;"></option>
                                {foreach from=$suppliers item=supplier key=fk}
                                    <option {if 
                                    (isset($alert) && $alert && $alert->id_supplier == $supplier.id_supplier) || 
                                    (isset($selected_supplier) && $selected_supplier == $supplier.id_supplie)}selected="selected"{/if} value="{$supplier.id_supplier}">
                                        {$supplier.name}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}

                    {if isset($manufacturers) && !empty($manufacturers)} 
                        <div class="form-group">
                            <div class="customfield">
                                <label class="label_field form-control-label">{l s="Fabriquant" d="Modules.Cdproductalert.alert"}</label>
                                <select class="form-control  form-control-select" name="manufacturer">
                                    <option value="" style="height: 0;"></option>
                                    {foreach from=$manufacturers item=manufacturer key=fk}
                                        <option {if (isset($ref_fabricant) && $ref_fabricant == $manufacturer.id_manufacturer) ||
                                    (isset($selected_manufacturer) && $selected_manufacturer == $manufacturer.id_manufacturer) ||
                                    (isset($alert) && $alert && $alert->id_manufacturer == $manufacturer.id_manufacturer)}
                                                selected="selected"
                                                {/if} value="{$manufacturer.id_manufacturer}">
                                            {$manufacturer.name}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    {/if} 
                </div>
            </div>
            
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-12 text-center">
                    <button type="submit" name="submitNewCustomerAlert" value="1" class="boutonstyle">{l s="Enregistrer" d="Modules.Cdproductalert.alert"}</button>
                </div>
            </div>
        </form>
    </section>
{/block}