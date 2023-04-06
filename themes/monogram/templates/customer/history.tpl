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
    {l s='Mes achats' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    {*<h6>{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</h6>*}

    {if $orders}
        <ul class="orders_list">
            {foreach from=$orders item=order}
                <li>
                    <div class="order_ref_and_status displayflex">
                        <div class="ref_date">#{$order.details.reference} - Le {$order.details.order_date}</div>
                        <div class="order_status">
                            {l s='Statut' d='Shop.Theme.Checkout'} :
                            <span style="color:{$order.history.current.color}">{$order.history.current.ostate_name}</span>
                        </div>
                    </div>
                    <div class="order_product_cover displayflex">
                        <div class="order_img">
                            <a href="{$order.product.link}" title="{$order.product.name}"><img
                                        src="{$order.product.image}" alt=""></a>
                        </div>
                        <div class="order_desc displayflex">
                            <div class="order_desc_left displayflex">
                                <div class="product_cover_name">
                                    <a href="{$order.product.link}"
                                       title="{$order.product.name}">{$order.product.brand}</a>
                                </div>
                                <div class="product_cover_sdesc">
                                    <a href="{$order.product.link}"
                                       title="{$order.product.name}">{$order.product.name}</a>
                                </div>
                            </div>
                            <div class="order_desc_right displayflex">
                                <div class="order_price">{$order.totals.total.value}</div>
                                <div class="order_details">
                                    <a href="{$order.details.details_url}" data-link-action="view-order-details">
                                        {l s='Voir la commande >' d='Shop.Theme.Customeraccount'}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="displayflex resale">
                        <div class="resale_text">
                            {l s='Plus certain(e) qu’il vous plaise ? Vous avez fait un investissement !' d='Shop.Theme.Actions'}
                        </div>
                        <div class="resale_link">
                            {if $order.products|count == 1}
                                <a class="displayflex"
                                   href="{$link->getModuleLink('oui_deposit','description', [id_product => $order.product.id_product])}">{l s='Revendre' d='Shop.Theme.Actions'}</a>
                            {else}
                                <a class="displayflex"
                                   href="{$order.details.details_url}">{l s='Revendre' d='Shop.Theme.Actions'}</a>
                            {/if}
                        </div>
                    </div>
                </li>
            {/foreach}
        </ul>
    {/if}
{/block}
