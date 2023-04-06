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

{*<span class="col-sm-3 col-md-3 hidden-sm-down sort-by">{l s='Sort by:' d='Shop.Theme.Global'}</span>*}
<div class="products-sort-order dropdown">
    <button
            class="btn-unstyle select-title"
            rel="nofollow"
            data-toggle="dropdown"
            aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}"
            aria-haspopup="true"
            aria-expanded="false">
        {* if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if *}
        {if !empty($smarty.get.order)}
            {$listing.sort_selected}
        {else}
            {l s='Trier par' d='Shop.Theme.Actions'}
        {/if}
        <span class="navbar-toggler collapse-icons hidden-sm-down">
            <i class="material-icons add">&#xE313;</i>
            <i class="material-icons remove">&#xE316;</i>
        </span>
    </button>
    <div class="dropdown-menu hidden-sm-down">
        {foreach from=$listing.sort_orders item=sort_order}
            <a
                    rel="nofollow"
                    href="{$sort_order.url}"
                    class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
            >
                {$sort_order.label}
            </a>
        {/foreach}
    </div>
    <div class="dropdown-menu hidden-md-up mobile">
        <div class="closedropdown"></div>
        <div class="dropdown_menu">
            {foreach from=$listing.sort_orders item=sort_order}
                <a
                        rel="nofollow"
                        href="{$sort_order.url}"
                        class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
                >
                    {$sort_order.label}
                </a>
            {/foreach}
        </div>
    </div>
</div>
