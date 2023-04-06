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

{* capture assign="productClasses"}{if !empty($productClass)}{$productClass}{else}col-xs-6 col-xl-4{/if}{/capture *}

<div class="products{if !empty($cssClass)} {$cssClass}{/if}">
    {assign var='nextR' value=7}
    {foreach from=$products item="product" key="position" name=products}
        {assign var='nextL' value=$nextR+5}
        {assign var='large_pd' value=0}

{*        {if $smarty.foreach.products.iteration == $nextR}*}
{*            {assign var='productClasses' value="col-xs-6 col-xl-6 pdl_large pd_large_r"}*}
{*            {assign var='large_pd' value=1}*}
{*        {elseif $smarty.foreach.products.iteration == $nextL}*}
{*            {assign var='productClasses' value="col-xs-6 col-xl-6 pdl_large pd_large_l"}*}
{*            {assign var='large_pd' value=1}*}
{*            {assign var='nextR' value=$nextR+14}*}
{*        {else}*}
            {assign var='productClasses' value="col-xs-6 col-xl-3"}
{*        {/if}*}

        {include file="catalog/_partials/miniatures/product.tpl" large_pd=$large_pd product=$product position=$position productClasses=$productClasses}
    {/foreach}
</div>
