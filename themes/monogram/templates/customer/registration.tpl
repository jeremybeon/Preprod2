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

{*{block name='page_title'}
  {l s='Create an account' d='Shop.Theme.Customeraccount'}
{/block}*}

{block name='page_content'}
	<div class="loginpage displayflex">
	    <div class="loginpage_left">
	    	<img src="{$urls.img_url}creationcompte.jpg" alt="" style="object-position: center 0;">
	    </div>
	    <div class="loginpage_right">
	      	<div class="customer_boxform">
			    {block name='register_form_container'}
			    	<h1 class="h1" style="margin-bottom: 35px;">{l s='Create an account' d='Shop.Theme.Customeraccount'}</h1>
			      	{$hook_create_account_top nofilter}

              {* Start shortcode for authentication *}<div id="sl_connector_authentication"></div>{literal}<script type="text/javascript"  data-keepinline="true"> $(document).ready(function(){fbpsc.getConnectors('authentication', 'authentication');});</script>{/literal}{* End shortcode for authentication *}

			      	<section class="register-form">

{*                  <p class="login_ou">{l s='Ou' d='Shop.Theme.Customeraccount'}</p>*}

			          	{render file='customer/_partials/customer-form.tpl' ui=$register_form}
			      		<div class="no-account">
			      			{l s='Already have an account?' d='Shop.Theme.Customeraccount'} 
			      			<a href="{$urls.pages.authentication}"><span>{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</span></a>
			      		</div>
			      	</section>
			    {/block}
		    </div>
	    </div>
  </div>
{/block}
