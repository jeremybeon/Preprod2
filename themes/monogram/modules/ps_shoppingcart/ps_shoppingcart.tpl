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




<!-- Lien liste d'envies -->
<div class="monogram_wishlist rightnavtem">
  <a href="{if $customer.is_logged} {url entity='module' name='blockwishlist' controller='lists'} {/if}" title="{l s='Liste d\'envies' d='Shop.Theme.Global'}"><i class="material-icons iconelt" aria-hidden="true"></i></a>
</div>

<!-- Lien panier -->
<div id="desktop_cart" class="monogram_cart rightnavtem">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header" title="{l s='Cart' d='Shop.Theme.Checkout'}">
      {if $cart.products_count > 0}
        <a class="hidden-sm-down" rel="nofollow" aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}" href="{$cart_url}">
      {/if}
        <i class="material-icons shopping-cart iconelt hidden-sm-down" aria-hidden="true"></i>
        <span class="cart-products-count products_count hidden-sm-down">{$cart.products_count}</span>
      {if $cart.products_count > 0}
        </a>
      {/if}

      <a href="" class="hidden-md-up get_modal_cart" data-toggle="modal" data-target="#blockcart-modal">
        <i class="material-icons shopping-cart iconelt hidden-md-up" aria-hidden="true"></i>
        <span class="cart-products-count products_count hidden-md-up">{$cart.products_count}</span>
      </a>
    </div>
  </div>
</div>
<div class="cart_detailed_mobile hidden-md-up" style="height: 0;width: 0;opacity: 0;visibility: hidden;z-index: -99;">
  {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
</div>

<script>
    let body = document.querySelector('body')
    if(body.id ==="index"){
        if(window.innerWidth > 768 && body.id ==="index"){
            const desktopCartElements = {
                accountCart: document.querySelector('#desktop_cart .iconelt'),
                cartCount: document.querySelector('#desktop_cart .cart-products-count'),
            };

            if (formValues.SWITCH_COLOR_ACTIVE_CART === "1" ) {

                desktopCartElements.accountCart.classList.add('active');
                if(desktopCartElements.cartCount){
                    desktopCartElements.cartCount.classList.add('active');
                }

            }

        }else {
            const mobileCartElements = {
                accountCart: document.querySelector('#desktop_cart .hidden-md-up .iconelt'),
                cartCount: document.querySelector('#desktop_cart .hidden-md-up .cart-products-count'),

            };
            if (formValues.SWITCH_COLOR_ACTIVE_CART_MOBILE === "1" ) {
                mobileCartElements.accountCart.classList.add('active');
                if(mobileCartElements.cartCount){
                    mobileCartElements.cartCount.classList.add('active');
                }
            }
        }
    }
</script>
{include file="module:ps_shoppingcart/modal.tpl"}