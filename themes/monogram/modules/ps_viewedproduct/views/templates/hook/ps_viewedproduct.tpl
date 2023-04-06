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
<section class="featured-products clearfix">
  {if $page.page_name == 'view'}

    <h2 class="titleh2 h2">{l s='CONSULTÉS RÉCEMMENT' d='Shop.Theme.Catalog'}</h2>
    {include file="catalog/_partials/productlist-suggest.tpl" products=$products cssClass="recents_viewsprod"  productClass="col-xs-6 col-lg-4 col-xl-4"}
  
  {else}

    <h2 class="titleh2 h2">{l s='VOUS AVEZ CONSULTÉ RECEMMENT' d='Shop.Theme.Catalog'}</h2>
    {include file="catalog/_partials/productlist-suggest.tpl" products=$products cssClass="slickslider5"  productClass="col-xs-6 col-lg-4 col-xl-3"}

  {/if}

</section>
