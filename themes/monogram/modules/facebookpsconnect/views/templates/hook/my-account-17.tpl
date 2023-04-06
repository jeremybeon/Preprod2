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
<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="bt_sl-link" href="{$sBtSlModuleUri|escape:'htmlall':'UTF-8'}">
	<span class="link-item">
		<i class="material-icons">link</i>
		{l s='Connection with Social Networks' mod='facebookpsconnect'}
	</span>
</a>

{* Handle the popup with the voucher code *}
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
						'overlayShow'	:	true,
						'centerOnScroll' : true,
					});
				}
				{/literal}{/if}{literal}
			});
	
		</script>
	{/literal}
		<div id="MyVoucherCode" class="col-xs-12" style="display: none;">
			<div class="col-xs-12">
					<h3 class="bg-dark">{l s='Discount code' mod='facebookpsconnect'}</h3>
					<hr/>
					<p class="alert alert-info">
						{l s='Code' mod='facebookpsconnect'}: <b>{$sVoucherCode|escape:'htmlall':'UTF-8'}</b>
						<br/>
						{l s='Valid until (date and hour)' mod='facebookpsconnect'}: <b>{$sVoucherDateTo|escape:'htmlall':'UTF-8'}</b>
					</p>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-5"><a class="btn btn-sm btn-primary" href="{$sBtVoucheUri|escape:'htmlall':'UTF-8'}">{l s='See my vouchers' mod='facebookpsconnect'}</a></div>
						<div class="col-md-3"></div>
					</div>
				
			</div>

			<div class="clr_10"></div>
			<div class="clr_hr"></div>
			<div class="clr_10"></div>
			<div class="fbpsc_voucher_popup_button">
				<a href="javascript:$.fancybox.close();" class="btn btn-sm btn-success center">{l s='Close' mod='facebookpsconnect'}</a>
				<a href="javascript:dontShow();" class="btn btn-sm btn-danger center">{l s='Don\'t show again' mod='facebookpsconnect'}</a>
			</div>

		</div>
	{/if}