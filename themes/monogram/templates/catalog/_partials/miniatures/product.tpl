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
 {block name='product_miniature_item'}
 <div class="product_item  js-product product{if !empty($productClasses)} {$productClasses}{/if}">
     <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}"
              data-id-product-attribute="{$product.id_product_attribute}">
         <div class="thumbnail-container">
             <div class="thumbnail-top">
                 <div class="sticker_elements">
                     <ul class="displayflex">
                         {if !empty($product.stickers)}
                             {foreach from=$product.stickers item='sticker' key='key'}
                                 <li class="{$key}">{$sticker}</li>
                             {/foreach}
                         {/if}
                     </ul>
                 </div>
                 {block name='product_thumbnail'}
                     {if !empty($large_pd)}
                         {if $product.cover}
                             <a href="{$product.url}"
                                class="thumbnail product-thumbnail {if isset($product.images[1])}hasmoreimg{/if}">
                                   <span class="princ_image">
                                     <img
                                             src="{$product.cover.bySize.home_large.url}"
                                             alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                             loading="lazy"
                                             data-full-size-image-url="{$product.cover.large.url}"
                                             width="{$product.cover.bySize.home_large.width}"
                                             height="{$product.cover.bySize.home_large.height}"
                                     />
                                   </span>
                                 {if isset($product.images[1])}
                                     <span class="hover_image">
                                       <img
                                               src="{$product.images[1].bySize.home_large.url}"
                                               alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                               data-full-size-image-url="{$product.images[1].bySize.home_large.url}"
                                       />
                                     </span>
                                 {/if}
                             </a>
                         {else}
                             <a href="{$product.url}" class="thumbnail product-thumbnail">
                                 <img
                                         src="{$urls.no_picture_image.bySize.home_large.url}"
                                         loading="lazy"
                                         width="{$urls.no_picture_image.bySize.home_large.width}"
                                         height="{$urls.no_picture_image.bySize.home_large.height}"
                                 />
                             </a>
                         {/if}
                     {else}
                         {if $product.cover}
                             <a href="{$product.url}"
                                class="thumbnail product-thumbnail {if isset($product.images[1])}hasmoreimg{/if}">
                                   <span class="princ_image">
                                     <img
                                             src="{$product.cover.bySize.home_default.url}"
                                             alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                             loading="lazy"
                                             data-full-size-image-url="{$product.cover.large.url}"
                                             width="{$product.cover.bySize.home_default.width}"
                                             height="{$product.cover.bySize.home_default.height}"
                                     />
                                   </span>
                                 {if isset($product.images[1])}
                                     <span class="hover_image">
                                       <img
                                               src="{$product.images[1].bySize.home_default.url}"
                                               alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                               data-full-size-image-url="{$product.images[1].bySize.home_default.url}"
                                       />
                                     </span>
                                 {/if}
                             </a>
                         {else}
                             <a href="{$product.url}" class="thumbnail product-thumbnail">
                                 <img
                                         src="{$urls.no_picture_image.bySize.home_default.url}"
                                         loading="lazy"
                                         width="{$urls.no_picture_image.bySize.home_default.width}"
                                         height="{$urls.no_picture_image.bySize.home_default.height}"
                                 />
                             </a>
                         {/if}
                     {/if}
                 {/block}
                  
                 <div class="highlighted-informations{if !$product.main_variants} no-variants{/if}">
                     {*{block name='quick_view'}
                       <a class="quick-view js-quick-view" href="#" data-link-action="quickview">
                         <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
                       </a>
                     {/block}*}

                     {block name='product_variants'}
                         {*{if $product.main_variants}
                           {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                         {/if}*}
                     {/block}
                     <div class="ajout_au_panier">
                         {if $product.quantity < 1} 
                             <div class="product_alert_button">
                                 {if $product.inMyCart}
                                     <a class="boutonstyle" href="{$urls.pages.cart}?action=show">
                                     {l s='Voir mon panier' d='Shop.Theme.Global'}
                                 </a>
                                 {else}
                                     <a class="boutonstyle" href="{$link->getModuleLink('cd_productalert', 'alert', ['id_product' => $product.id, 'page' => $page.page_name, 'cat' => $smarty.get.id_category])}">
                                     {l s='Créer une alerte' d='Shop.Theme.Global'}
                                 </a>
                                 {/if}
                             </div>
                         {else}
                             <form action="{$urls.pages.cart}">
                                 <input type="hidden" name="token" value="{$static_token}">
                                 <input type="hidden" name="id_product" value="{$product.id}">
                                 <input type="hidden" name="id_customization" value="0">
                                 <input type="hidden" name="id_product_attribute"
                                        value="{$product.id_product_attribute}">
                                 <input type="hidden" name="qty" value="1">
                                 <button
                                         class="boutonstyle add-to-cart"
                                         data-button-action="add-to-cart"
                                         type="submit"
                                       
                                 >
                                     {l s='Add to cart' d='Shop.Theme.Global'}<i class="iconplus"></i>
                                 </button>
                             </form>
                         {/if}
                     </div>
                 </div>
                 {if $product.quantity < 1 && !$product.inMyCart}
                     {*<div class="vendu"><span>{l s='Vendu' d='Shop.Theme.Catalog'}</span></div>*}
                 {/if}
             </div>

             <div class="product-description">

                 {if Manufacturer::getnamebyid($product.id_manufacturer)}
                     <span class="product_brand">
                         <a href="{$product.url}" title="">
                             {Manufacturer::getnamebyid($product.id_manufacturer)}
                         </a>
                     </span>
                 {/if}

                 {block name='product_name'}
                     <h2 class="{if Manufacturer::getnamebyid($product.id_manufacturer)}pdt_hasbrand{/if} h3 product-title">
                         <a href="{$product.url}"
                            content="{$product.url}">{$product.name|truncate:30:'...'}</a>
                     </h2>
                 {/block}

                 {block name='product_description_short'}
                     <div class="product_desc">
                         <a href="{$product.url}" itemprop="url" content="{$product.url}">
                             {$product.description_short|strip_tags:'UTF-8'|truncate:25:'...'}
                         </a>
                     </div>
                 {/block}


                 {block name='product_price_and_shipping'}

                     {if $product.quantity < 1 && !$product.inMyCart}
                         {else}
                    
                     {if $product.show_price}
                         <div class="product-price-and-shipping">
                             {if $product.has_discount}
                                 {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                 <span class="regular-price"
                                       aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                                 {if $product.discount_type === 'percentage'}
                                     <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                                 {elseif $product.discount_type === 'amount'}
                                     <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                                 {/if}
                             {/if}

                             {hook h='displayProductPriceBlock' product=$product type="before_price"}

                             <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
             {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                                 {if '' !== $smarty.capture.custom_price}
                                     {$smarty.capture.custom_price nofilter}
                                 {else}
                                     {$product.price}
                                 {/if}
           </span>

                             {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                             {hook h='displayProductPriceBlock' product=$product type='weight'}
                         </div>
                     {/if}
                 {/if}
                 {/block}

                 {block name='product_reviews'}
                     {hook h='displayProductListReviews' product=$product}
                 {/block}
             </div>

             {*{include file='catalog/_partials/product-flags.tpl'}*}
         </div>
     </article>
 </div>
{/block}
