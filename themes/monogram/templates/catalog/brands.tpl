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
{extends file=$layout}

{block name='content'}
    <section id="main">
        {*{block name='brand_header'}
            <h1>{l s='Brands' d='Shop.Theme.Catalog'}</h1>
        {/block}*}
        <div>
            {hook h='ouiDisplayTopBrands'}
        </div>

        {block name='brand_miniature'}
            <div class="brand_bottom brands_container">
                <div class="brand_top">
                    <div class="container">
                        <div class="brand_top_cover displayflex hidden-sm-down">
                            {foreach from=$brands key=letter item=brand name=brands}
                                <a href="#brand-letter-{$letter}">{$letter}</a>
                            {/foreach}
                        </div>
                        <div class="brand_top_cover displayflex hidden-md-up sliderbrands">
                            {foreach from=$brands key=letter item=brand name=brands}
                                <a href="#brand-letter-{$letter}">{$letter}</a>
                            {/foreach}
                        </div>
                    </div>
                </div>

                <div class="brand_middle">
                    <div class="container">
                        <div class="row">
                            <div class="brand_search search col-md-3">
                                <form action="" method="">
                                    <div class="form-group row">
                                        <div class="customfield">
                                            <label class="label_field form-control-label" for="brand-serch">{l s='Rechercher par créateur' d='Shop.Theme.Customeraccount'}</label>
                                            <input id="brand-serch" class="form-control" name="" type="text" value="">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="brand_listing main col-md-9 displayflex">
                                {foreach from=$brands key=letter item=brandList name=brands}
                                    <div id="brand-letter-{$letter}" class="brand_group_byletter col-xs-12 col-sm-4 col-md-4">
                                        <p class="letter">{$letter}</p>
                                        <ul class="list-group">
                                            {foreach from=$brandList item=brand name=bl}
                                                <li>
                                                    <a href="{$brand.url}">{$brand.name}</a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

           
        {/block}
    </section>
{/block}
