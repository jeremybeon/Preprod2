{*
*
* Social Login
*
* @author BusinessTech.fr
* @copyright Business Tech
*
*           ____    _______
*          |  _ \  |__   __|
*          | |_) |    | |
*          |  _ <     | |
*          | |_) |    | |
*          |____/     |_|
*
*}

<br/>
<div class="bootstrap">
	<div class="alert alert-success" id="{$sModuleName|escape:'htmlall':'UTF-8'}Confirm">
		{if !empty($sMsg)}<strong>{$sMsg|escape:'htmlall':'UTF-8'}</strong>{else}{l s='Settings updated' mod='facebookpsconnect'}{/if}
	</div>
</div>