{**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 
{extends file='customer/page.tpl'}

{$page.body_classes['page-customer-account'] = true}

{block name='page_content'}
	<div class="mes_envies">
		<div class="mes_envies_cover custom_accountpage">
			<div class="pagetitle"> 
				<h1 class="page_title">
					{l s='Ma wishlist' d='Shop.Theme.Customeraccount'}
				</h1>
			</div>
			<div class="pageintro">
				{l s='Sauvegardez vos articles coup de coeur mais n’oubliez pas que nos produits sont des pièces uniques, faites vite !' d='Shop.Theme.Customeraccount'}
			</div>
			<div class="mes_envies_cont">
				<div
					class="wishlist-products-container"
					data-url="{$url}"
					data-list-id="{$id}"
					data-default-sort="{l s='Last added' d='Modules.Blockwishlist.Shop'}"
					data-add-to-cart="{l s='Acheter' d='Shop.Theme.Actions'}"
					data-sell="{l s='Vendu' d='Shop.Theme.Actions'}"
					data-share="{if $isGuest}true{else}false{/if}"
					data-customize-text="{l s='Customize' d='Modules.Blockwishlist.Shop'}"
					data-quantity-text="{l s='Quantity' d='Shop.Theme.Catalog'}"
					data-title="{$wishlistName}"
					data-no-products-message="{l s='No products found' d='Modules.Blockwishlist.Shop'}"
					data-filter="{l s='Filter' d='Shop.Theme.Actions'}"
				  >
				</div>
				{include file="module:blockwishlist/views/templates/components/pagination.tpl"}
				{include file="module:blockwishlist/views/templates/components/modals/delete.tpl" deleteProductUrl=$deleteProductUrl}
				{include file="module:blockwishlist/views/templates/components/toast.tpl"}
			</div>
		</div>

		{widget name="ps_viewedproduct" hook='displayFooterProduct'}
		
	</div> 
{/block} 
