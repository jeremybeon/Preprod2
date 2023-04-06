{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file=$layout}

{block name='head' append}
    <meta property="og:type" content="product">
    {if $product.cover}
        <meta property="og:image" content="{$product.cover.large.url}">
    {/if}

    {if $product.show_price}
        <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
        <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
        <meta property="product:price:amount" content="{$product.price_amount}">
        <meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='head_microdata_special'}
    {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}
    <section id="main">
        <meta content="{$product.url}">

        <div class="productblocbox product-container js-product-container">
            <div class="col-md-6 product_left">
                <div class="product_leftcover">
                    {block name='page_content_container'}
                        <section class="page-content" id="content">
                            {block name='page_content'}
                                {*{include file='catalog/_partials/product-flags.tpl'}*}
                                {block name='product_cover_thumbnails'}
                                    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                                {/block}
                                <div class="scroll-box-arrows">
                                    <i class="material-icons left">&#xE314;</i>
                                    <i class="material-icons right">&#xE315;</i>
                                </div>
                            {/block}
                            {if $product.quantity < 1 && !$product.inMyCart}
                                <div class="vendu hidden-md-up"><span>{l s='Vendu' d='Shop.Theme.Catalog'}</span>
                                </div>
                            {/if}
                            <button class="sharingtitle hidden-md-up" type="button" data-toggle="modal" data-target="#modalsharing">
								<small>{l s='Share' d='Shop.Theme.Actions'}</small>
							</button>
                        </section>
                    {/block}
{*
                    <div class="infos_product_mobile hidden-md-up">
                        <div class="infos_product_mobile_cover">
                            {block name='page_header_container'}
                                {block name='page_header'}
                                    <span class="h2 apercumedium">{Manufacturer::getnamebyid($product.id_manufacturer)}</span>
                                {/block}
                            {/block}

                            <div id="displayProductOffer">{hook h='displayProductOffer'  product=$product}</div>

                            {if !empty($model) && !empty($model.descriptif)}
                                <div class="prod_accroche">{$model.descriptif nofilter}</div>
                            {/if}
                        </div>
                        {block name='product_description_short'}
                            <div id="product-description-short-{$product.id}"
                                 class="product-description">{$product.description nofilter}</div>
                        {/block}
                    </div>
*}
                    <div class="productdetailsinfos hidden-sm-down">
                        {if !empty($product.features)}
                            <div class="details_elt">
                                <span class="title_elt">{l s='Détails & dimensions' d='Shop.Theme.Catalog'}</span>
                                <div class="content_elt">
                                    <ul>
                                        {foreach from=$product.features item=feature}
											{if $feature.value != ''}
                                            <li class="feature_{$feature.id_feature}">{$feature.name|escape:'htmlall':'UTF-8'}
                                                : {$feature.value|escape:'htmlall':'UTF-8'}</li>
											{/if}
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {/if}

                        <div class="details_elt">
                            <span class="title_elt">{l s='Livraison & retours' d='Shop.Theme.Catalog'}</span>
                            <div class="content_elt">
                                <ul>
                                    <li>{l s='Livraison à Paris et Petite couronne en 24h par coursier' d='Shop.Theme.Catalog'}</li>
                                    <li>{l s='Livraison en France en 24h à 48h ouvrés dans le créneau horaire qui vous convient le mieux via DPD' d='Shop.Theme.Catalog'}</li>
                                    <li>{l s='Livraison en Europe et monde en 24h à 48h Via DHL Express' d='Shop.Theme.Catalog'}</li>
                                    <li>{l s='Les retours s\'effectuent sous 15 jours' d='Shop.Theme.Catalog'}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 product_right">
                <div class="product_right_cover">
                    <div class="product_right_top {if $product.availability != 'available'}notinstock{/if}">
                        {block name='page_header_container'}
                            {block name='page_header'}
                                <span class="h2 apercumedium">{Manufacturer::getnamebyid($product.id_manufacturer)}</span>
                            {/block}
                        {/block}
                        <div class="prod_subtitle">
                            {*<h1>{$product.name}</h1>*}
                            <h1>{Product::getRealProductNameByAlex($product.id_product,$language.id)}</h1>


                            {if isset($linkbo)}
                                <h4><a href="https://{$linkbo}" target="_blank">Lien Back-Office</a></h4>
                            {/if}
                        </div>

                        {if !empty($model) && !empty($model.descriptif)}
                            <div class="prod_accroche">{$model.descriptif nofilter}</div>
                        {/if}

                         {*{if $product.minimal_quantity < 2}
                            {if $product.availability != 'available'}
                                <div class="vendu hidden-md-up"><span>{l s='Vendu' d='Shop.Theme.Catalog'}</span></div>
                            {/if}
                        {/if}*}
                        
                        {if $product.quantity < 1 && !$product.inMyCart}
                            <div class="vendu hidden-md-up"><span>{l s='Vendu' d='Shop.Theme.Catalog'}</span></div>
                        {/if}
                    </div>
                    
                    <div class="product-reference">
                    <p class="reference">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}</p>
                    </div>
                    
                    <div class="product-information">
                        {block name='product_description_short'}
                            <div id="product-description-short-{$product.id}"
                                 class="product-description hidden-sm-down">{$product.description nofilter}</div>
                        {/block}
						 
                        <div class="productinfos_onmobile productdetailsinfos hidden-md-up">
                            <div class="details_elt">
                                {if !empty($product.features)}
                                    <h2 class="title_elt">{l s='Détails & dimensions' d='Shop.Theme.Catalog'}</h2>
                                    <div class="content_elt">
                                        <ul>
                                            {foreach from=$product.features item=feature}
												{if $feature.value != ''}
                                                <li class="feature_{$feature.id_feature}">{$feature.name|escape:'htmlall':'UTF-8'}
                                                    : {$feature.value|escape:'htmlall':'UTF-8'}</li>
												{/if}
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/if}
                            </div>
                            <div class="details_elt">
                                <h2 class="title_elt">{l s='Livraison & retours' d='Shop.Theme.Catalog'}</h2>
                                <div class="content_elt">
                                    <ul>
                                        <li>{l s='Livraison à Paris et Petite couronne en 24h par coursier' d='Shop.Theme.Catalog'}</li>
                                        <li>{l s='Livraison en France en 24h à 48h ouvrés dans le créneau horaire qui vous convient le mieux via DPD' d='Shop.Theme.Catalog'}</li>
                                        <li>{l s='Livraison en Europe et monde en 24h à 48h Via DHL Express' d='Shop.Theme.Catalog'}</li>
                                        <li>{l s='Les retours s\'effectuent sous 15 jours' d='Shop.Theme.Catalog'}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        {if $product.is_customizable && count($product.customizations.fields)}
                            {block name='product_customization'}
                                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                            {/block}
                        {/if}

                        <div class="product-actions js-product-actions">
                            {block name='product_buy'}
                                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                    <input type="hidden" name="token" value="{$static_token}">
                                    <input type="hidden" name="id_product" value="{$product.id}"
                                           id="product_page_product_id">
                                    <input type="hidden" name="id_customization" value="{$product.id_customization}"
                                           id="product_customization_id" class="js-product-customization-id">

                                    {block name='product_variants'}
                                        {include file='catalog/_partials/product-variants.tpl'}
                                    {/block}

                                    {block name='product_pack'}
                                        {if $packItems}
                                            <section class="product-pack">
                                                <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                                                {foreach from=$packItems item="product_pack"}
                                                    {block name='product_miniature'}
                                                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                                                    {/block}
                                                {/foreach}
                                            </section>
                                        {/if}
                                    {/block}

                                    {block name='product_discounts'}
                                        {include file='catalog/_partials/product-discounts.tpl'}
                                    {/block}

                                    <div class="product_add_to_cart_box">
                                        {block name='product_add_to_cart'}
                                            {include file='catalog/_partials/product-add-to-cart.tpl'}
                                        {/block}
                                    </div>

                                    <div class="productactions displayflex hidden-sm-down">
                                        {hook h='displayProductActions' product=$product}
                                        <button class="sharingtitle" type="button" data-toggle="modal"
                                                data-target="#modalsharing">
                                            <small>{l s='Share' d='Shop.Theme.Actions'}</small>
                                        </button>
                                    </div>

                                    <div class="product_ask">
                                        <div class="title_elt">{l s='Une question sur ce produit ?' d='Shop.Theme.Catalog'}</div>
                                        <div class="product_ask_list displayflex">
                                            <div data-id="photoportee" class="product_ask_elt displayflex" type="button"
                                                 data-toggle="modal" data-target="#demandeinfos">
                                                <img src="{$urls.img_url}photoportee.svg" alt="">
                                                <div class="product_ask_elt_text">{l s='Une photo portée ?' d='Shop.Theme.Catalog'}</div>
                                            </div>
                                            <div data-id="dimensionprecise" class="product_ask_elt displayflex"
                                                 type="button" data-toggle="modal" data-target="#demandeinfos">
                                                <img src="{$urls.img_url}dimension.svg" alt="">
                                                <div class="product_ask_elt_text">{l s='Une dimension précise ?' d='Shop.Theme.Catalog'}</div>
                                            </div>
                                            <div data-id="videoetat" class="product_ask_elt displayflex" type="button"
                                                 data-toggle="modal" data-target="#demandeinfos">
                                                <img src="{$urls.img_url}video.svg" alt="">
                                                <div class="product_ask_elt_text">{l s='Une vidéo de l\'état ?' d='Shop.Theme.Catalog'}</div>
                                            </div>
                                        </div> 
										
                                       {* {if $product.quantity > 0 && !empty($product.deposit)}
                                            <div class="product_ask_elt last_elt displayflex">
                                                <a href="{$link->getModuleLink('oui_appointment', 'formulaire')}"><img
                                                            class="hidden-sm-down" src="{$urls.img_url}showroom.svg"
                                                            alt=""></a>
                                                <div class="product_ask_elt_text hidden-sm-down">
                                                    <a href="{$link->getModuleLink('oui_appointment', 'formulaire')}">
														{l s='Voir cet article ' d='Shop.Theme.Catalog'}{if $position} {$position}{else}au showroom{/if}
													</a>
                                                </div>
                                                <div class="product_ask_elt_text hidden-md-up">
                                                    {l s='Disponible ' d='Shop.Theme.Catalog'} 
													<a href="{$link->getModuleLink('oui_appointment', 'formulaire')}">{if $position} {$position}{else}au showroom{/if}</a>
                                                </div>
                                            </div>
                                        {/if}*}
                                    </div>

                                    <div class="vendrecleenmain hidden-md-up">
                                        <div class="title_elt">{l s='Vous avez un article similaire ?' d='Shop.Theme.Catalog'}</div>
                                        <a href="{$link->getModuleLink('oui_deposit', 'description', ['id_product' => $product.id])}" title="">{l s='Vendre clé en main' d='Shop.Theme.Catalog'}</a>
                                    </div>

                                    {block name='product_additional_info'}
                                        {include file='catalog/_partials/product-additional-info.tpl'}
                                    {/block}

                                    {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                                    {block name='product_refresh'}{/block}
                                </form>
                            {/block}

                        </div>

                        {*
                        {block name='hook_display_reassurance'}
                          {hook h='displayReassurance'}
                        {/block}
                        *}

                        {block name='product_tabs'}
                        <div class="tabs">
                            <ul class="nav nav-tabs" role="tablist">
                                {if $product.description}
                                    <li class="nav-item">
                                        <a
                                                class="nav-link{if $product.description} active js-product-nav-active{/if}"
                                                data-toggle="tab"
                                                href="#description"
                                                role="tab"
                                                aria-controls="description"
                                                {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
                                    </li>
                                {/if}
                                <li class="nav-item">
                                    <a
                                            class="nav-link{if !$product.description} active js-product-nav-active{/if}"
                                            data-toggle="tab"
                                            href="#product-details"
                                            role="tab"
                                            aria-controls="product-details"
                                            {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                                </li>
                                {if $product.attachments}
                                    <li class="nav-item">
                                        <a
                                                class="nav-link"
                                                data-toggle="tab"
                                                href="#attachments"
                                                role="tab"
                                                aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                                    </li>
                                {/if}
                                {foreach from=$product.extraContent item=extra key=extraKey}
                                    <li class="nav-item">
                                        <a
                                                class="nav-link"
                                                data-toggle="tab"
                                                href="#extra-{$extraKey}"
                                                role="tab"
                                                aria-controls="extra-{$extraKey}">{$extra.title}</a>
                                    </li>
                                {/foreach}
                            </ul>

                            <div class="tab-content" id="tab-content">
                                <div class="tab-pane fade in{if $product.description} active js-product-tab-active{/if}"
                                     id="description" role="tabpanel">
                                    {block name='product_description'}
                                        <div class="product-description">{$product.description nofilter}</div>
                                    {/block}
                                </div>

                                {block name='product_details'}
                                    {include file='catalog/_partials/product-details.tpl'}
                                {/block}

                                {block name='product_attachments'}
                                    {if $product.attachments}
                                        <div class="tab-pane fade in" id="attachments" role="tabpanel">
                                            <section class="product-attachments">
                                                <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                                                {foreach from=$product.attachments item=attachment}
                                                    <div class="attachment">
                                                        <h4>
                                                            <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                                                        </h4>
                                                        <p>{$attachment.description}</p>
                                                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                                            {l s='Download' d='Shop.Theme.Actions'}
                                                            ({$attachment.file_size_formatted})
                                                        </a>
                                                    </div>
                                                {/foreach}
                                            </section>
                                        </div>
                                    {/if}
                                {/block}

                                {foreach from=$product.extraContent item=extra key=extraKey}
                                <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}"
                                     role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                                {$extra.content nofilter}
                            </div>
                            {/foreach}
                        </div>
                    </div>
                    {/block}
                </div>
            </div>
        </div>
        </div>

        {if $accessories}
            <section class="shopthelook productblocbox">
                <div class="container">
                    <div class="row displayflex">
                        <h2 class="h2 titleh2 hidden-md-up">{l s='Shop the look' d='Shop.Theme.Catalog'}</h2>
                        {*<div class="col-xs-12 col-md-4 shopthelook_img">
						{if !empty($shopLookImg)}
							<img src="{$shopLookImg}" alt="" class="img-responsive">
						{else}
							<img src="{$urls.img_url}shoplook.jpg" alt="">
						{/if} 
                        </div>*}
                        <div class="col-xs-12 col-md-12 shopthelook_list">
                            <h2 class="h2 titleh2 hidden-sm-down">{l s='Shop the look' d='Shop.Theme.Catalog'}</h2>
                            <div class="products row shopthelook_slide">
                                {foreach from=$accessories item="product_accessory" key="position"}
                                    {block name='product_miniature'}
                                        {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-6 col-lg-4 col-xl-3"}
                                    {/block}
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        {/if}

        <section class="asksimilarproduct hidden-sm-down">
            <div class="asksimilarproduct_cover">
                <h2 class="h2 titleh2">{l s='Vous avez un article similaire ?' d='Shop.Theme.Catalog'}</h2>
                <div class="fashion_for_good displayflex">
                    <div class="fashiongood_title">
                        <span>{l s='Fashion for good' d='Shop.Theme.Catalog'}</span>
                    </div>
                    <div class="fashion_for_good_cnt displayflex">
                        <div class="fashiongood_elt">
                            <img class="" src="{$urls.img_url}financer.svg" alt="">
                            <div class="fashion_desc">
                                En revendant vos articles, participez à un mode de consommation responsable et bon pour
                                la planète !
                            </div>
                        </div>
                        <div class="fashiongood_elt">
                            <img class="" src="{$urls.img_url}deposez.svg" alt="">
                            <div class="fashion_desc">
                                Un service de vente clé en main : vous n’avez qu’à nous faire parvenir votre article
                            </div>
                        </div>
                        <div class="fashiongood_elt">
                            <img class="" src="{$urls.img_url}financer.svg" alt="">
                            <div class="fashion_desc">
                                Financez votre futur achat grâce à une économie circulaire, et augmenter votre pouvoir
                                d’achat
                            </div>
                        </div>
                    </div>
                    <div class="saleourproduct">
                        <a class="boutonstyle" href="{$link->getModuleLink('oui_deposit', 'description', ['id_product' => $product.id])}"
                           title="">{l s='Vendre vos articles' d='Shop.Theme.Catalog'}</a>
                    </div>
                </div>
            </div>
        </section>

       {* {block name='product_accessories'}
            {if 0 && $accessories}
                <section class="product-accessories clearfix productblocbox">
                    <h2 class="h2 titleh2">{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
                    <div class="products row slickslider5">
                        {foreach from=$accessories item="product_accessory" key="position"}
                            {block name='product_miniature'}
                                {include file='catalog/_partials/miniatures/product-suggest.tpl' product=$product_accessory position=$position productClasses="col-xs-6 col-lg-4 col-xl-3"}
                            {/block}
                        {/foreach}
                    </div>
                </section>
            {/if}
        {/block}*}

        <section>
            {hook h='displayAccessoriesProductRules'}
        </section>

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        <div id="modalsharing" class="modalsharing modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                    <div class="modal-body">
                        {widget name="ps_sharebuttons" hook='displayProductActions'}
                    </div>
                </div>
            </div>
        </div>

        <div id="demandeinfos" class="demandeinfos modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="demandeinfos_body">
                            <button type="button" class="close displayflex" data-dismiss="modal" aria-label="Close">
                                <span id="photoportee"
                                      class="demande_title">{l s='Demander une photo portée' d='Shop.Theme.Catalog'}</span>
                                <span id="dimensionprecise"
                                      class="demande_title">{l s='Demander une dimension précise' d='Shop.Theme.Catalog'}</span>
                                <span id="videoetat"
                                      class="demande_title">{l s='Demander une vidéo de l’état' d='Shop.Theme.Catalog'}</span>
                                <span class="spanclose">&times;</span>
                            </button>
                            <form action="" method="post" id="askInfosForm">
                                <div class="productbox displayflex">
                                    <!--<div class="p_img displayflex"><img src="{$urls.img_url}showroom.svg" alt=""></div>-->
                                    <div class="productbox_desc">
                                        <span class="p_brand"><a href="#" title="">{Manufacturer::getnamebyid($product.id_manufacturer)}</a></span>
                                        <div class="p_name">{$product.name}</div>
                                        <div class="price">{$product.price}</div> 
                                    </div>
                                </div>
                                <div class="moyen_demande displayflex">
                                    <div data-id="byemail" class="byemail">
                                        <div data-type="email" class="moyen_cov displayflex active">
                                            <img src="{$urls.img_url}p_email.svg" alt="">
                                            <span>{l s='Par mail' d='Shop.Theme.Catalog'}</span>
                                        </div>
                                    </div>
                                    <div data-id="byphone" class="bysms">
                                        <div data-type="sms" class="moyen_cov displayflex">
                                            <img src="{$urls.img_url}p_video.svg" alt="">
                                            <span>{l s='Par sms' d='Shop.Theme.Catalog'}</span>
                                        </div>
                                    </div>
                                    <div data-id="byphone" class="bywhatsapp">
                                        <div data-type="whatsapp" class="moyen_cov displayflex">
                                            <img src="{$urls.img_url}p_whatsapp.svg" alt="">
                                            <span>{l s='Par WhatsApp' d='Shop.Theme.Catalog'}</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="ask_field">
									<input type="hidden" value="" id="ask_mode" name="ask_mode" >
									<input type="hidden" value="email" id="ask_type" name="ask_type" >
									<input type="hidden" value="{$product.name}" id="ask_name" name="ask_name" >
									<input type="hidden" value="{$product.id_product}" name="ask_id" >
									
                                    <div id="byemail" class="form-group row">
                                        <div class="customfield">
                                            <label class="label_field form-control-label"
                                                   for="">{l s='Email*' d='Shop.Theme.Catalog'}</label>
                                            <input id="ask_email" class="form-control" name="ask_email" type="email" value="">
                                        </div>
                                    </div>
                                    <div id="byphone" class="form-group row"  style="display: none;">
                                        <div class="customfield">
                                            <label class="label_field form-control-label"
                                                   for="">{l s='Téléphone*' d='Shop.Theme.Catalog'}</label>
                                            <input id="ask_phone" class="form-control" name="ask_phone" type="number" value="">
                                        </div>
                                    </div>
                                    <footer class="form-footer">
                                        <input id="submitAskPdInfos" type="submit" class="boutonstyle"  name="submitAskPdInfos" value="{l s='Demander' d='Shop.Theme.Catalog'}">
                                    </footer>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {block name='page_footer_container'}
            <footer class="page-footer">
                {block name='page_footer'}
                    <!-- Footer content -->
                {/block}
            </footer>
        {/block}
    </section>
{/block}
