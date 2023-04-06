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
{extends file='page.tpl'}

{block name='notifications'}{/block}

{block name='page_content_container'}
    <section id="content" class="page-content">

        <div class="row">
            <div class="my_account_menu menu-content col-md-4">
                <div class="account_infosuser">
                    <div class="myaccount_img">
                        <img src="{$urls.img_url}/update/espace_compte.jpg" alt="">
                        <div class="top">
                            {l s='Welcome' d='Shop.Theme.Customeraccount'} <span>{$customer.firstname}</span>
                        </div>
                    </div>
                    <div class="my_account_menu_title hidden-md-up">
                        {l s='Mon compte' d='Shop.Theme.Customeraccount'}
                    </div>
                </div>
                <div class="my_account_menu_cover">

                    {include file='customer/_partials/account-menu.tpl'}

                    <div class="menu_box_accounter hidden-md-up">
                        <div class="buy_box accounter">
                            <a href="">
                                <img src="{$urls.img_url}/sacmobile.jpg" alt="">
                                <span class="displayflex">{l s='Acheter' d='Shop.Theme.Customeraccount'}</span>
                            </a>
                        </div>
                        <div class="sale_box accounter">
                            <a href="">
                                <img src="{$urls.img_url}/update/depots.jpg" alt="">
                                <span class="displayflex">{l s='Vendre' d='Shop.Theme.Customeraccount'}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="my_account_main main-content col-md-8">
                <div class="my_account_main_cover">
                    {if $page.page_name == 'address'}
	                    <div class="pagetitle">
                            <h1 class="page_title sub_page_title" onclick="javascript:window.history.back();">
                            	<span class="backtoprevpage"></span>
                            	{l s='Modify my adresse' d='Shop.Theme.Customeraccount'}
                            </h1>
	                    </div>
                   	{/if}

                    
                    {block name='page_content_top'}
                        {block name='customer_notifications'}
                            {include file='_partials/notifications.tpl'}
                        {/block}
                    {/block}
                    {block name='page_content'}
                        <!-- Page content -->

	                    
                    {/block}
                </div>
            </div>
        </div>
        </div>
    </section>
{/block}

{block name='page_footer'}
    {block name='my_account_links'}
        {include file='customer/_partials/my-account-links.tpl'}
    {/block}
{/block}
