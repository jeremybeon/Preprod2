{**
 * Google Merchant Center
 *
 * @author    businesstech.fr <modules@businesstech.fr> - https://www.businesstech.fr/
 * @copyright Business Tech - https://www.businesstech.fr/
 * @license   see file: LICENSE.txt
 *           ____    _______
 *          |  _ \  |__   __|
 *          | |_) |    | |
 *          |  _ <     | |
 *          | |_) |    | |
 *          |____/     |_|
 *}
	<div id="fbpsc" class="block {$sModuleName|escape:'htmlall':'UTF-8'}_block_user_account">
		{* Customer is not logged *}
		{if empty($bCustomerLogged)}

			<h4 class="title_block">{l s='Your account' mod='facebookpsconnect'}</h4>

				<form action="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}" method="post" id="login_form" class="box">

				<fieldset>
					<div class="form_content clearfix">
						<div class="form-group">
							<label for="email">{l s='Email address'  mod='facebookpsconnect' }</label>
							<input class="is_required validate account_input form-control" data-validate="isEmail" type="email" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|escape:'htmlall':'UTF-8'}{/if}" />
						</div>
						<div class="form-group">
							<label for="passwd">{l s='Password'  mod='facebookpsconnect'}</label>
							<input class="is_required validate account_input form-control" type="password" data-validate="isPasswd" id="passwd" name="passwd" value="" />
						</div>

						<p class="lost_password form-group pull-right"><a href="{$link->getPageLink('password')|escape:'html':'UTF-8'}" title="{l s='Recover your forgotten password'  mod='facebookpsconnect'}" rel="nofollow">{l s='Forgot your password?'  mod='facebookpsconnect'}</a></p>
						<p class="submit text-center">
							{if isset($back)}<input type="hidden" class="hidden" name="back" value="{$back|escape:'html':'UTF-8'}" />{/if}

							<button type="submit" id="SubmitLogin" name="SubmitLogin" class="button btn btn-default button-medium">
								<span>
									<i class="icon-lock left"></i>
									{l s='Sign in' mod='facebookpsconnect'}
								</span>
							</button>
						</p>

						{if isset($back)}
							<input type="hidden" class="hidden" name="back" value="{$back|escape:'htmlall':'UTF-8'}" />
						{/if}

						<div id="fbpsc" class="displayColumn"></div>

						{$sHtmlCode}

					</div>
				</fieldset>
			</form>
		{* Customer is logged *}
		{else}
			<h4>{l s='Welcome' mod='facebookpsconnect'}
			<div class="clr_10"></div>
			<b>{$customerName|escape:'htmlall':'UTF-8'}</b></h4>

			<div class="logged">
				<div class="content">

					<div class="clr_10"></div>
					<div class="col-xs-12">
						<img src="{$img_dir|escape:'htmlall':'UTF-8'}icon/my-account.gif" alt="{l s='Your Account' mod='facebookpsconnect'}"/>
						<a href="{$base_dir_ssl|escape:'htmlall':'UTF-8'}my-account.php" title="{l s='Your Account' mod='facebookpsconnect'}"><b>{l s='Your Account' mod='facebookpsconnect'}</b></a>
					</div>

					<div class="clr_10"></div>

					<div class="col-xs-12">
						<i class="icon icon-shopping-cart icon-2x"></i>
						<a href="{$link->getPageLink('order', true)|escape:'htmlall':'UTF-8'}" title="{l s='Your Shopping Cart' mod='facebookpsconnect'}">

							<b>&nbsp;{l s='Cart:' mod='facebookpsconnect'}</b>

							<span class="ajax_cart_quantity{if $iCartQty == 0} hidden{/if}">{$iCartQty|escape:'htmlall':'UTF-8'}</span>
							<span class="ajax_cart_product_txt{if $iCartQty != 1} hidden{/if}">{l s='product' mod='facebookpsconnect'}</span>
							<span class="ajax_cart_product_txt_s{if $iCartQty < 2} hidden{/if}">{l s='products' mod='facebookpsconnect'}</span>
							<span class="ajax_cart_total{if $iCartQty == 0} hidden{/if}"></span>

							<span class="ajax_cart_no_product{if $iCartQty > 0} hidden{/if}">{l s='(empty)' mod='facebookpsconnect'}</span>
						</a>

					</div>

					<div class="clr_20"></div>

					<a class="btn btn-mini btn-warning pull-right" href="{$base_dir|escape:'htmlall':'UTF-8'}index.php?mylogout" title="{l s='Log out' mod='facebookpsconnect'}">{l s='Log out' mod='facebookpsconnect'}</a>

				</div>
			</div>
		{/if}
	</div>
