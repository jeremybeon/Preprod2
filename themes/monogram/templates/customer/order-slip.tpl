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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Credit slips' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'} 
  <div class="mes_bons_dachats">
    <div class="custom_accountpage">
      <div class="pagetitle"> 
        <h1 class="page_title">
            {l s='Mes avoirs' d='Shop.Theme.Customeraccount'}
          </h1>
      </div>
      <div class="list_bons_dachats">
        {if $credit_slips}
			{foreach from=$credit_slips item=slip}
			<div class="bondachat_elt">
			  <div class="bondachat_date">{$slip.credit_slip_date}</div>
			  <div class="bondachat_elt_cover displayflex">
				<div class="bondachat_desc">
				  <div class="bnd_title">Solde converti sur la commande #{$slip.order_reference}</div>
				  <div class="bnd_desc">Bon d’achat Monogram <b>{$slip.credit_slip_number}</b></div>
				</div>
				<div class="bondachat_price">+ {Tools::displayPrice($slip.total_products_tax_incl)}</div>
			  </div>
			</div>
			</div>
			{/foreach} 
		{else}
			<p class="alert alert-infos">{l s="Vous n'avez pas encore reçu d'avoir." d='Shop.Theme.Customeraccount'}</p>
		{/if} 
		</div> 
	</div> 
</div> 
{/block}
