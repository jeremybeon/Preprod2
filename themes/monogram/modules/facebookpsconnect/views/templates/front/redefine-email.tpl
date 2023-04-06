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

{capture name=path}<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">{l s='My account'  mod='facebookpsconnect'}</a><span class="navigation-pipe">{$navigationPipe|escape:'htmlall':'UTF-8'}</span><span class="navigation_page">{l s='My information'  mod='facebookpsconnect'}</span>{/capture}


<h1 class="page-heading bottom-indent">
	{l s='My information' mod='facebookpsconnect'}
</h1>

<div class="block-center" id="block-history">

<section id="content" class="page-content">
<form id="login-form" action="{$sFormSubmit|escape:'htmlall':'UTF-8'}" method="post">

	<input type="hidden" type="text" name="socialNetwork" value="{$sSocial|escape:'htmlall':'UTF-8'}" />

	<div class="form-group row alert alert-info">
		{l s='Thank you for using the' mod='facebookpsconnect'}&nbsp;<b>{$sSocial|ucfirst|escape:'htmlall':'UTF-8'}</b>&nbsp;{l s='login button! Your customer account has been created correctly.' mod='facebookpsconnect'}
		<br />{l s='However, for confidentiality reasons, the social network does not give access to the real e-mail address of its users. You will therefore not be able to receive our e-mails and, in particular, order tracking notifications. To receive our e-mails, please enter your real e-mail address below.' mod='facebookpsconnect'}
		{if $sSocial == 'twitter' || $sSocial == 'instagram'}
			<br />
			<b>{$sSocial|ucfirst|escape:'htmlall':'UTF-8'}</b>&nbsp;{l s='also does not allow the recovery of the first and last names of its users. This data is important especially for the shipment of orders. We recommend that you update them below.' mod='facebookpsconnect'}
		{/if}
	</div>

	<div class="form-group row alert alert-danger" id="emailError" style="display:none">
		{l s='The two e-mail addresses do not match. Please retry.' mod='facebookpsconnect'}
	</div>


	{if !empty($bSuccess)}
		<div class="alert alert-success">
			{l s='Information updated, thank you!' mod='facebookpsconnect'}
		</div>
	{/if}

	<div class="form-group row">
		<label class="col-md-3 form-control-label"><span class="label-tooltip" data-toggle="tooltip"><b>{l s='Enter your e-mail address:' mod='facebookpsconnect'}</b></span></label>
		<div class="col-md-6">
			<input type="email" required="true" class="form-control" id="email" name="email" />
		</div>
	</div>

	<div class="form-group row">
		<label class="col-md-3 form-control-label"><span class="label-tooltip" data-toggle="tooltip"><b>{l s='Confirm this e-mail address:' mod='facebookpsconnect'}</b></span></label>
		<div class="col-md-6">
			<input type="email" required="true" class="form-control" id="email_check" name="email_check" />
		</div>
	</div>

	{if $sSocial == 'twitter' || $sSocial == 'instagram'}
		<div class="form-group row">
			<label class="col-md-3 form-control-label"><span class="label-tooltip" data-toggle="tooltip"><b>{l s='Firstname' mod='facebookpsconnect'}</b></span> :</label>
			<div class="col-md-6">
				<input type="text" required="true" placeholder="{$oCustomer->firstname|escape:'htmlall':'UTF-8'}" class="form-control" id="firstname" name="firstname" value="{$oCustomer->firstname|escape:'htmlall':'UTF-8'}" />
			</div>
		</div>

		<div class="form-group row">
			<label class="col-md-3 form-control-label"><span class="label-tooltip" data-toggle="tooltip"><b>{l s='Lastname' mod='facebookpsconnect'}</b></span> :</label>
			<div class="col-md-6">
				<input type="text" required="true" placeholder="{$oCustomer->lastname|escape:'htmlall':'UTF-8'}" class="form-control" id="lastname" name="lastname" value="{$oCustomer->lastname|escape:'htmlall':'UTF-8'}" />
			</div>
		</div>
	{/if}
	
	<div class="row">
		<div class="col-md-3">
			<a href="{$sMyAccountLink|escape:'htmlall':'UTF-8'}" class="account-link"><i class="icon-home"></i><span>{l s='Back to your account' mod='facebookpsconnect'}</span></a>
		</div>
		<div class="col-md-9">
			<button class="continue btn btn-primary float-xs-left" type="submit" name="updateEmail">{l s='Save' mod='facebookpsconnect'}</button>
			{if !empty($bSuccess)}
				<a href="{$sRedirect|escape:'htmlall':'UTF-8'}" class="continue btn btn-primary float-xs-right">{l s='Continue shopping' mod='facebookpsconnect'}</a>
			{/if}
		</div>
	<div>
</form>
</section>

<script type="text/javascript">
$("form").submit(function(e) {

	let email = $('#email').val();
	let emailCheck = $('#email_check').val();

	// Check if email are different 
	if (email != emailCheck) {

		e.preventDefault();
		// Show error message
		$('#emailError').css('display', 'block');
		$('#email').css('border', '2px solid red');
		$('#email_check').css('border', '2px solid red');
		setTimeout(function() {
			$('#emailError').hide();
			$('#email').css('border', '1px solid rgba(0,0,0,.25)');
			$('#email_check').css('border', '1px solid rgba(0,0,0,.25)');
		}, 3000);
	}
});
</script>

</div>