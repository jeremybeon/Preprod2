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

<div class="bottom menu">
    <div class="bottom_elt">
        <p class="p_title">{l s='Mon profil' d='Shop.Theme.Customeraccount'}</p>
        <ul>
            <!--<li>
                <a class="" id="wishlist-link" href="{url entity='monogram' id='liste'}">
                    {l s='Ma wishlist' d='Shop.Theme.Customeraccount'}
                    <i class="material-icons">favorite</i>
                </a>
            </li>-->
            <li class="{if $page.page_name=='identity'} active{/if}">
                <a class="" id="identity-link" href="{$urls.pages.identity}">
                    {l s='Mes informations personnelles' d='Shop.Theme.Customeraccount'}
                </a>
            </li>
            <li class="{if $page.page_name=='addresses'} active{/if}">
                {if $customer.addresses|count}
                    <a class="" id="addresses-link" href="{$urls.pages.addresses}">
                        {l s='Mes adresses' d='Shop.Theme.Customeraccount'}
                    </a>
                {else}
                    <a class="" id="address-link" href="{$urls.pages.address}">
                        {l s='Add first address' d='Shop.Theme.Customeraccount'}
                    </a>
                {/if}
            </li>
            {hook h='displayCustomerAccount'}
        </ul>
    </div>
	
    <div class="bottom_elt">
        <p class="p_title">{l s='Mes achats' d='Shop.Theme.Customeraccount'}</p>
        <ul>
            {if !$configuration.is_catalog}
                <li class="{if $page.page_name=='history'} active{/if}">
					<a href="{$urls.pages.history}">{l s='Mon historique d’achats' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}

            {if !$configuration.is_catalog}
                <li class="{if $page.page_name=='order-slip'} active{/if}">
                    <a id="order-slips-link" href="{$urls.pages.order_slip}">
                        {l s='Credit slips' d='Shop.Theme.Customeraccount'}
                    </a>
                </li>
            {/if}

            {if $configuration.voucher_enabled && !$configuration.is_catalog}
                <li class="{if $page.page_name=='discount'} active{/if}">
                    <a id="discounts-link"
                       href="{$urls.pages.discount}">{l s='Mes bons de réductions' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}

            {if $configuration.return_enabled && !$configuration.is_catalog}
                <li class="{if $page.page_name=='order-follow'} active{/if}">
                    <a id="returns-link" href="{$urls.pages.order_follow}">
                        {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
                    </a>
                </li>
            {/if}

           {hook h='displayCustomerAccountMiddle'}
        </ul>
    </div> 
	
    <div class="bottom_elt">
        <p class="p_title">{l s='Mes Dépots' d='Shop.Theme.Customeraccount'}</p>
        <ul>
            {hook h='displayCustomerAccountBottom'}
        </ul>
    </div>
    <div class="account_bottom displayflex"> 
        <div class="sign_out">
            <a href="{$urls.actions.logout}">
                {l s='Sign out' d='Shop.Theme.Actions'}
            </a>
        </div>
    </div>
</div>

