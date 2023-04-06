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
 <div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
 aria-hidden="true">
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="{l s='Close' d='Shop.Theme.Global'}">
                <span aria-hidden="true"><i class="material-icons">close</i></span>
            </button>
            <div class="modal-title" id="myModalLabel">
                <a class="hidden-sm-down" rel="nofollow" aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}" href="{$cart_url}">
                    {l s='Votre panier' d='Shop.Theme.Checkout'}
(<div class="blockcart cart-preview" data-refresh-url="{if isset($refresh_url)}{$refresh_url}{/if}">
                        <span class="cart-products-count products_count">{$cart.products_count}</span>
                    </div>)
                </a>
                <a href="{$urls.pages.order}" class="hidden-md-up">
                    {l s='Votre panier' d='Shop.Theme.Checkout'}

                    (<div class="blockcart cart-preview" data-refresh-url="{if isset($refresh_url)}{$refresh_url}{/if}">
                        <span class="cart-products-count products_count">{$cart.products_count}</span>
                    </div>)

                </a>
            </div>
        </div>
        <div class="modal-body">
        {if isset($product)}
            <div class="row"> 
                {if $page.page_name != 'module-oui_deposit-mesdepots'}
                <div class="col-md-12 col-sm-12 col-xs-12 divide-right cartmodal_top cartmodalonall">
                    <div class="row displayflex">
                        <div class="cartmodal_img col-md-6">
                        {if $cart.products_count >0}
                            {if !empty($product.default_image)}
                                {if isset($product.default_image.small.url)}
                                    <img
                                        src="{$product.default_image.small.url}"
                                        data-full-size-image-url="{$product.default_image.small.url}"
                                        title="{$product.default_image.legend}"
                                        alt="{$product.default_image.legend}"
                                        loading="lazy"
                                        class="product-image"
                                >
                                {/if}
                            {else}
                                {if isset($urls.no_picture_image.bySize.small.url)}
                                <img
                                        src="{$urls.no_picture_image.bySize.small.url}"
                                        loading="lazy"
                                        class="product-image"
                                />
                                {/if}
                            {/if}
                        {/if}
                        </div>
                        <div class="cartmodal_desc col-md-6 displayflex">
                            <div class="name_and_price displayflex">
                                <div class="name_and_price_left">
                                    {if Manufacturer::getnamebyid($product.id_manufacturer)}
                                        <h5 class="prod_brand">
                                            <a href="{$link->getManufacturerLink($product->id_manufacturer)}" title="">
                                                {Manufacturer::getnamebyid($product.id_manufacturer)}
                                            </a>
                                        </h5>
                                    {/if}
                                    <h6 class="h6 product-name">{$product.name|truncate:15:'...'}</h6>
                                    {*<div class="product_desc">
                                      {$product.description_short nofilter}
                                    </div>*}
                                </div>

                                <p class="product-price">{$product.price}</p>
                                {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                            </div>
                        </div>
                    </div>
                </div>
                {/if}

                <div class="col-md-12 col-sm-12 col-xs-12 cartmodalonmobile"> 
                    {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}  
                    <div class="cart_modal_ressurance">
                        <ul class="nostyle">
                           <li class="rce_item displayflex">
                               <div class="rce_img"><img src="{$urls.img_url}mrce1.png" alt=""></div>
                               <div class="rce_desc">{l s='Paiement sécurisé jusqu\'en 10fos' d='Shop.Theme.Global'}</div>
                           </li> 
                           <li class="rce_item displayflex">
                               <div class="rce_img"><img src="{$urls.img_url}mrce2.png" alt=""></div>
                               <div class="rce_desc">{l s='Livraison express en 48h' d='Shop.Theme.Global'}</div>
                           </li> 
                           <li class="rce_item displayflex">
                               <div class="rce_img"><img src="{$urls.img_url}mrce3.png" alt=""></div>
                               <div class="rce_desc">{l s='Suivi de commande' d='Shop.Theme.Global'}</div>
                           </li> 
                           <li class="rce_item displayflex">
                               <div class="rce_img"><img src="{$urls.img_url}mrce4.png" alt=""></div>
                               <div class="rce_desc"><a href="mailto:serviceclient@monogramparis.com">Serviceclient@monogramparis.com</a></div>
                           </li> 
                        </ul>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 cartmodal_products">
                    <div class="" id="oui_blockcart-modal-cross"></div>
                    {hook h='displayCartModalFooter' product=$product}
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 cartmodal_bottom">
                    <div class="cart-content">
                        {*{if $cart.products_count > 1}
                          <p class="cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
                        {else}
                          <p class="cart-products-count">{l s='There is %products_count% item in your cart.' sprintf=['%products_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
                        {/if}*}

                        <p class="hidden-sm-down">
                            <span class="label">{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>&nbsp;
                            <span class="subtotal value">{$cart.subtotals.products.value}</span>
                        </p>

                        <div class="cart_subtotals hidden-md-up">
                            {block name='cart_summary_subtotals'}
                                {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
                            {/block}
                        </div>

                        {*{if $cart.subtotals.shipping.value}
                          <p><span>{l s='Shipping:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="shipping value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span></p>
                        {/if}

                        {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                          <p><span>{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>&nbsp;<span>{$cart.totals.total.value}</span></p>
                          <p class="product-total"><span class="label">{$cart.totals.total_including_tax.label}</span>&nbsp;<span class="value">{$cart.totals.total_including_tax.value}</span></p>
                        {else}
                          <p class="product-total"><span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>&nbsp;<span class="value">{$cart.totals.total.value}</span></p>
                        {/if}

                        {if $cart.subtotals.tax}
                          <p class="product-tax">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;<span class="value">{$cart.subtotals.tax.value}</span></p>
                        {/if}*}
                        <p class="paiement_possible">{l s='Paiement en 3 ou 4 fois possible' d='Shop.Theme.Actions'}</p>
                        <div class="cart-content-btn cartmodal_buttons">
                            <a href="{$cart_url}" class="boutonstyle hidden-sm-down">{l s='Valider mon panier' d='Shop.Theme.Actions'}</a>
                            <a href="{$urls.pages.order}" class="boutonstyle hidden-md-up">{l s='Valider mon panier' d='Shop.Theme.Actions'}</a>
                            <button type="button" class="boutonstyle" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        </div>
    </div>
</div>
</div>


{* Bug JS detecté Alexandre Carette 21/02/2023*}
{* je transfere ce block vers le layout-both-column *}
{*<script type="text/javascript">
$(document).ready(function() {
    prestashop.on(
    'updateCart',
        function (event) {}
    );
});
</script>*}
