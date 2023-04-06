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

<div class="product-add-to-cart js-product-add-to-cart"> 
  {if $product.quantity < 1}
    <div class="infos_productalert">
		{*{if $product.inMyCart}
			<p class="create_alert_title">{l s='Ce produit est déjà dans votre panier' d='Shop.Theme.Catalog'}</p>
			<a class="alert-link" href="{$urls.pages.cart}?action=show">
				<span class="link-item"> 
					{l s='Voir mon panier' d='Shop.Theme.Global'}
				</span>
			</a>
		{else}
			<p class="create_alert_title">{l s='Trop tard ! Cet article est déjà vendu' d='Shop.Theme.Catalog'}</p>
			
			{hook h=displayCDProductAlert product=$product}
		{/if}*}
    </div>
  {else}
    <div class="pricesandcart displayflex">
      <div class="pricesandcart_top displayflex">
        {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
        {/block}
        {if !$configuration.is_catalog}
          {block name='product_quantity'}
              <div class="product-quantity clearfix">
                {*<div class="qty">
                  <input
                    type="number"
                    name="qty"
                    id="quantity_wanted"
                    inputmode="numeric"
                    pattern="[0-9]*"
                    {if $product.quantity_wanted}
                      value="{$product.quantity_wanted}"
                      min="{$product.minimal_quantity}"
                    {else}
                      value="1"
                      min="1"
                    {/if}
                    class="input-group"
                    aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                  >
                </div>*}

                <div class="add">
                    <button
            {*Alexandre Carette pb mobile reste disable sur mobile*}
					  {*disabled="disabled"*}
                      class="boutonstyle add-to-cart"
                      data-button-action="add-to-cart"
                      type="submit"
                      {if $product.quantity == 0}
                        disabled
                      {/if}
                    >
                      
                      <span class="hidden-sm-down">{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                      <span class="hidden-md-up">{l s='Acheter' d='Shop.Theme.Actions'}</span>
                    </button>
                </div>
              </div>
          {/block}
        </div>
        <div class="paiementpar_tranche" id="">
          {l s='' d='Shop.Theme.Catalog'}
        </div>
      {/if}
    </div>
	
	<div id="displayProductOffer" class="hidden-sm-down">{hook h='displayProductOffer'  product=$product}</div>

    {*<div class="offredeprix displayflex">
      <div class="offrefield">
        <input type="number" name="offredeprix" value="" id="" class="input_offerprice" placeholder="{l s='Proposer une offre de prix' d='Shop.Theme.Catalog'}">
        <span class="focusfield">{l s='Proposer une offre de prix' d='Shop.Theme.Catalog'}</span>
        <span class="infosprix">{l s='Votre prix doit être compris entre 1950€ et 2250€' d='Shop.Theme.Catalog'}</span>
      </div>
      <input id="submitoffredeprix" class="submitoffredeprix" type="submit" name="offredeprix" value="{l s='Envoyer' d='Shop.Theme.Catalog'}" id="">
    </div>
    <div class="alert_offredeprix" style="display: none;">
      {l s='Votre offre de prix a été envoyée ! Nous allons vous répondre d’ici 48h dans votre espace personnel.' d='Shop.Theme.Catalog'}
    </div>*}


    {*{block name='product_availability'}
      {if $product.show_availability && $product.availability_message}
        <span id="product-availability" class="js-product-availability">
            {if $product.availability == 'available'}
              <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
            {elseif $product.availability == 'last_remaining_items'}
              <i class="material-icons product-last-items">&#xE002;</i>
            {else}
              <i class="material-icons product-unavailable">&#xE14B;</i>
            {/if}
            {$product.availability_message}
        </span>
      {/if}
    {/block}*}

    {block name='product_minimal_quantity'}
      {if $product.minimal_quantity > 1}
        <p class="product-minimal-quantity js-product-minimal-quantity">
            {l
            s='The minimum purchase order quantity for the product is %quantity%.'
            d='Shop.Theme.Checkout'
            sprintf=['%quantity%' => $product.minimal_quantity]
            }
        </p>
      {/if}
    {/block}
  {/if}
</div>
