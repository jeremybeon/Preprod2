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

<link rel="stylesheet" type="text/css" href="{$smarty.const._FPC_URL_CSS|escape:'htmlall':'UTF-8'}bootstrap-social.css">
<link rel="stylesheet" type="text/css" href="{$smarty.const._FPC_URL_CSS|escape:'htmlall':'UTF-8'}font-awesome.css">

{if !empty($bCustomerCollect)}
{literal}
	<script type="text/javascript" xmlns="http://www.w3.org/1999/html">
	$(document).ready(function(){
		$('#header').after('<div style="clear: both; height:0"></div><div class="alert valide form-error" style="display: block;">'+"{/literal}{l s='Thank you. Your Facebook Like has been recorded and correctly linked to your account. This will allow us to potentially suggest this product to your friends as a gift idea for you' mod='facebookpsconnect'}{literal}"+'</div><div style="clear: both; height:20px"></div>');
	});
	</script>
{/literal}
{/if}

{if !empty($bDisplay)}
	{literal}
	<script type="text/javascript" xmlns="http://www.w3.org/1999/html">
		$(document).ready(function(){
			var content = $('#ao_fpsc_fancybox').html();
			$('#ao_fpsc_fancybox').remove();

			$.fancybox({
				'content': content
			});

			// init form div error
			$('.alert-email-error').hide();
			$('.alert-firstname-error').hide();
			$('.alert-name-error').hide();
			$('.alert-password-verify-error').hide();
			$('.alert-password-error').hide();

			//init var
			var delay = 1500;
			var fadeout = 300;

			function validateEmail(email)
			{
				var reg = new RegExp('^[a-z0-9]+([_|\.|-]{1}[a-z0-9]+)*@[a-z0-9]+([_|\.|-]{1}[a-z0-9]+)*[\.]{1}[a-z]{2,6}$', 'i');
				if(reg.test(email))
				  {
					return(true);
				  }
				else
				  {
					return(false);
				  }
			}
			$(".CheckEmail").focusout(function() {
				if (validateEmail($(".CheckEmail").val()) == true && validateEmail($(".CheckEmail").val()) != '')
				{
					$(".CheckEmail").css({border:"1px solid #46a74e", color:"green", 'background-color': "#ddf9e1"});
					$('#btn-save').attr("disabled", false);
				}
				else
				{
					$(".CheckEmail").css({border:"1px solid #f13340", color:"red",'background-color': "#fff1f2"});
					$('#btn-save').attr("disabled", true);
					$('.alert-email-error').show();
					$(".alert-email-error").delay(delay).fadeOut(fadeout);
				}
			});

			$("#socialFirstName").focusout(function() {
				if ($("#socialFirstName").val() != "")
				{
					$("#socialFirstName").css({border:"1px solid #46a74e", color:"green", 'background-color': "#ddf9e1"});
					$('#btn-save').attr("disabled", false);
				}
				else
				{
					$("#socialFirstName").css({border:"1px solid #f13340", color:"red",'background-color': "#fff1f2"});
					$('#btn-save').attr("disabled", true);
					$('.alert-firstname-error').show();
					$(".alert-firstname-error").delay(delay).fadeOut(fadeout);
				}
			});

			$("#socialName").focusout(function() {
				if ($("#socialName").val() != "")
				{
					$("#socialName").css({border:"1px solid #46a74e", color:"green", 'background-color': "#ddf9e1"});
					$('#btn-save').attr("disabled", false);
				}
				else
				{
					$("#socialName").css({border:"1px solid #f13340", color:"red",'background-color': "#fff1f2"});
					$('#btn-save').attr("disabled", true);
					$('.alert-name-error').show();
					$(".alert-name-error").delay(delay).fadeOut(fadeout);
				}
			});

			$("#socialPassword").focusout(function() {
				if ($("#socialPassword").val() != "" )
				{
					$("#socialPassword").css({border:"1px solid #46a74e", color:"green", 'background-color': "#ddf9e1"});
					$('#btn-save').attr("disabled", false);
				}
				else
				{
					$("#socialPassword").css({border:"1px solid #f13340", color:"red",'background-color': "#fff1f2"});
					$('#btn-save').attr("disabled", true);
					$('.alert-password-error').show();
					$(".alert-password-error").delay(delay).fadeOut(fadeout);
				}
			});

			$("#socialPasswordVerify").focusout(function() {
				if ($("#socialPasswordVerify").val() != "" && $("#socialPasswordVerify").val() == $("#socialPassword").val())
				{
					$("#socialPasswordVerify").css({border:"1px solid #46a74e", color:"green", 'background-color': "#ddf9e1"});
					$('#btn-save').attr("disabled", false);
				}
				else
				{
					$("#socialPasswordVerify").css({border:"1px solid #f13340", color:"red",'background-color': "#fff1f2"});
					$('.alert-password-verify-error').show();
					$('#btn-save').attr("disabled", true);
					$(".alert-password-verify-error").delay(delay).fadeOut(fadeout);
				}
			});

			// check if one field is wrong
			if ((validateEmail($(".CheckEmail").val()) == false && validateEmail($(".CheckEmail").val()) == "") || ($("#socialName").val() == "") || ($("#socialFirstName").val() != "")|| ($("#socialPassword").val() == "" )|| ($("#socialPasswordVerify").val() == "" && $("#socialPasswordVerify").val() != $("#socialPassword").val()))
			{
				$('#btn-save').attr("disabled", true);
			}
			else
			{
				$('#btn-save').attr("disabled", false);
			}
		});
	</script>
	{/literal}
	<div id="ao_fpsc_fancybox" style="display:none; visibility:hidden;">
		<div id='fbpsc'>
			{if !empty($bSocialCustomerExist)}
			<div id="fpcFancyboxContent">
				<div class="clr_20"></div>
				<h2 style="text-align:center;margin:0; padding:0;">{l s='Save time on your next login!' mod='facebookpsconnect'}</h2>
				<div class="clr_10"></div>
				<div class="clr_hr"></div>
				<div class="clr_20"></div>
				<p class="alert alert-info">{l s='Click on one of the buttons below and save time on your next visit by logging in directly through your favorite social network' mod='facebookpsconnect'}</p>

				<div class="clr_10"></div>

				<div class="form-group text-center" style="text-align:center;margin:0; padding:0;" id="fbpsc">
					<div class="row text-center">

						{foreach from=$aConnectors name=connector key=cName item=cValue}
							{if $sButtonStyle == 'modern'}
								<a href="javascript:void(0)" onclick="javascript:popupWin = window.open('{$sModuleURI|escape:'htmlall':'UTF-8'}?sAction=connect&sType=plugin&connector={$cValue.cssClass|escape:'htmlall':'UTF-8'}&back={$sBackUri|escape:'htmlall':'UTF-8'}', 'login', 'location,width=600,height=600,top=0');popupWin.focus();" class="col-xs-3 btn-connect btn-block-connect btn-social {if $cValue.cssClass|escape:'htmlall':'UTF-8' == 'facebook'}btn-facebook{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'amazon'}btn-amazon{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'google'}btn-google{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'paypal'}btn-paypal{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'twitter'}btn-twitter{/if}" >
									<span class="fa fa-bt-{$cValue.cssClass|escape:'htmlall':'UTF-8'}"></span>
									<span class='btn-title-connect'>{$cValue.cssClass|escape:'htmlall':'UTF-8'|ucfirst|escape:'htmlall':'UTF-8'}</span>
								</a>
							{else}
								<p onclick="javascript:popupWin = window.open('{$sModuleURI|escape:'htmlall':'UTF-8'}?sAction=connect&sType=plugin&connector={$cValue.cssClass|escape:'htmlall':'UTF-8'}&back={$sBackUri|escape:'htmlall':'UTF-8'}', 'login', 'location,width=600,height=600,top=0');popupWin.focus();" class="col-xs-3 ao_bt_fpsc {if $cValue.cssClass|escape:'htmlall':'UTF-8' == 'facebook'}ao_bt_fpsc_facebook{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'amazon'}ao_bt_fpsc_amazon{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'google'}ao_bt_fpsc_google{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'paypal'}ao_bt_fpsc_paypal{elseif $cValue.cssClass|escape:'htmlall':'UTF-8' == 'twitter'}ao_bt_fpsc_twitter{/if}" >
									<span class='picto'></span>
									<span class='title'>{$cValue.cssClass|escape:'htmlall':'UTF-8'|ucfirst|escape:'htmlall':'UTF-8'}</span>
								</p>
							{/if}
						{/foreach}
					</div>
				</div>

				<div class="clr_20"></div>

				<p align="right"><a class="btn btn-danger btn-mini" onclick="{$sModuleName|escape:'htmlall':'UTF-8'}.ajax('{$sModuleURI|escape:'htmlall':'UTF-8'}','sAction=update&sType=customer&id={$iCustomerId|escape:'htmlall':'UTF-8'}','ajax_customer_response');$.fancybox.close();" href="#">{l s='Do not show this message again' mod='facebookpsconnect'}</a></p>

				<div id="ajax_customer_response"></div>
			</div>

			{elseif !empty($bTwitterCustomerExist)}
			<h3 style="margin:0; padding:0;">{l s='You have linked your shop account to your Twitter profile' mod='facebookpsconnect'}</h3>
			<div class="clr_hr"></div>
			<div class="clr_20"></div>
			<form action="" class="form-horizontal" method="post" id="{$sModuleName|escape:'htmlall':'UTF-8'}TwitterForm" name=''>
				<input type="hidden" name="sAction" value="update" />
				<input type="hidden" name="sType" value="email" />
				<input type="hidden" name="connector" value="{$sConnector|escape:'htmlall':'UTF-8'}" />
				<input type="hidden" name="customerId" value="{$iCustomerId|escape:'htmlall':'UTF-8'}" />
				<div class="bootstrap">
					<p class="alert alert-info">
						{l s='Because Twitter does not give us your all your information, your account was created with a false generic e-mail and generic password. Please update your information now by filling it out below' mod='facebookpsconnect'}.
						<span class="clr_10"></span>
					</p>
					<div class="form-group">
						<label class="control-label col-lg-4">{l s='Your e-mail' mod='facebookpsconnect'}: </label>
						<div class="col-xs-3">
							<input name="socialEmail" id="socialEmail" type="text" class="CheckEmail" value="" size="35"/>
							<div class="clr_20"></div>
							<div class="alert-email-error">
								<p class="alert alert-danger">
									{l s='Please insert a correct Email' mod='facebookpsconnect'}
								</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-4">{l s='Your firstname' mod='facebookpsconnect'}: </label>
						<div class="col-xs-3">
							<input name="socialFirstName" id="socialFirstName" type="text" value="" size="35" />
							<div class="clr_20"></div>
							<div class="alert-firstname-error">
								<p class="alert alert-danger">
									{l s='Please insert your firstname' mod='facebookpsconnect'}
								</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-4">{l s='Your name' mod='facebookpsconnect'}: </label>
						<div class="col-xs-3">
							<input name="socialName" id="socialName" type="text" value="" size="35" />
							<div class="clr_20"></div>
							<div class="alert-name-error">
								<p class="alert alert-danger">
									{l s='Please insert your name' mod='facebookpsconnect'}
								</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-4">{l s='Your password' mod='facebookpsconnect'}: </label>
						<div class="col-xs-3">
							<input name="socialPassword" id="socialPassword" type="password" value="" size="35" />
							<div class="clr_20"></div>
							<div class="alert-password-error">
								<p class="alert alert-danger">
									{l s='Please set your password' mod='facebookpsconnect'}
								</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-4">{l s='Check your password' mod='facebookpsconnect'}: </label>
						<div class="col-xs-3">
							<input name="socialPasswordVerify" id="socialPasswordVerify" type="password" value="" size="35" />
							<div class="clr_20"></div>
							<div class="alert-password-verify-error">
								<p class="alert alert-danger">
									{l s='Please set your password again' mod='facebookpsconnect'}
								</p>
							</div>
						</div>
					</div>
					<center>
						<button id="btn-save" name="{$sModuleName|escape:'htmlall':'UTF-8'}Button" class="button btn btn-success" value="{l s='Send' mod='facebookpsconnect'}"  onclick="{$sModuleName|escape:'htmlall':'UTF-8'}.form('{$sModuleName|escape:'htmlall':'UTF-8'}TwitterForm', '{$sModuleURI|escape:'htmlall':'UTF-8'}', '', 'socialMessage', 'socialMessage', false, false, null, 'VoucherDisplay');return false;" >{l s='Send' mod='facebookpsconnect'}</button>
					</center>
				</div>
			</form>
			<div id="{$sModuleName|escape:'htmlall':'UTF-8'}EmailError"></div>
		{/if}
	</div>
	</div>
{/if}

{if $sDisplayVoucher == 'popup' || $sDisplayVoucher == 'both'}
{literal}
	<script type="text/javascript">

		function dontShow(){
			$.fancybox.close();
			document.cookie="bShow=false";
		}

		// to get the cookies value
		function getCookieValue(cname) {
			var name = cname + "=";
			var ca = document.cookie.split(';');
			for(var i=0; i<ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0)==' ') c = c.substring(1);
				if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
			}
			return "";
		}

		var bShow = getCookieValue("bShow");

		$(document).ready(function(){
			{/literal}{if !empty($sVoucherCode) &&  !empty($iVoucherQuantity) &&  !empty($bActive) && !empty($bVoucherAvailable)}{literal}
			if (bShow != "false") {
				$.fancybox({
					'href'   : '#MyVoucherCode',
					'transitionIn'	:	'elastic',
					'transitionOut'	:	'elastic',
					'speedIn'		:	600,
					'speedOut'		:	200,
					'overlayShow'	:	false,
					'centerOnScroll' : true
				});
			}
			{/literal}{/if}{literal}
		});

	</script>
{/literal}

		<div id="MyVoucherCode" style="display: none;">
			<div class="fbpsc_voucher_popup col-xs-12 bootstrap">
				<h3>{l s='Discount code' mod='facebookpsconnect'}</h3>
				<div class="clr_10"></div>
				<p class="alert-success">
					{l s='Code' mod='facebookpsconnect'}: <b>{$sVoucherCode|escape:'htmlall':'UTF-8'}</b>
					<br/>
					{l s='Valid until (date and hour)' mod='facebookpsconnect'}: <b>{$sVoucherDateTo|escape:'htmlall':'UTF-8'}</b>
				</p>
				<div class="clr_10"></div>
				<p class="alert-info">
					{l s='You can also find this code in the "Vouchers" section of your customer account' mod='facebookpsconnect'}
				</p>
			</div>

			<div class="clr_10"></div>
			<div class="clr_hr"></div>
			<div class="clr_10"></div>
			<div class="fbpsc_voucher_popup_button">
				<a href="javascript:$.fancybox.close();" class="btn btn-small btn-success center">{l s='Close' mod='facebookpsconnect'}</a>
				<a href="javascript:dontShow();" class="btn btn-small btn-danger center">{l s='Don\'t show again' mod='facebookpsconnect'}</a>
			</div>

		</div>
{/if}