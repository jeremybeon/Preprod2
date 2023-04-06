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

{if !empty($bPS17)}
	<script type="text/javascript" src="{$PathJsJquery|escape:'htmlall':'UTF-8'}"></script>
	<script type="text/javascript" src="{$PathJsModule|escape:'htmlall':'UTF-8'}"></script>
{/if}

<script type="text/javascript">
	// instantiate object
	var {$sModuleName|escape:'htmlall':'UTF-8'} = {$sModuleName|escape:'htmlall':'UTF-8'} || new FpcModule('{$sModuleName|escape:'htmlall':'UTF-8'}');
	// get errors translation
	{if !empty($oJsTranslatedMsg)}
	{$sModuleName|escape:'htmlall':'UTF-8'}.msgs = {$oJsTranslatedMsg nofilter};
	{/if}

	{if isset($iCompare) && $iCompare == -1}{$sModuleName|escape:'htmlall':'UTF-8'}.oldVersion = true;{/if}

	// set URL of admin img
	{$sModuleName|escape:'htmlall':'UTF-8'}.sImgUrl = '{$smarty.const._FPC_URL_IMG|escape:'htmlall'}';

	// set URL of admin img
	{$sModuleName|escape:'htmlall':'UTF-8'}.sAdminImgUrl = '{$smarty.const._PS_ADMIN_IMG_|escape:'htmlall'}';

	// set URL of module's web service
	{if !empty($sModuleURI)}
	{$sModuleName|escape:'htmlall':'UTF-8'}.sWebService = '{$sModuleURI|escape:'htmlall':'UTF-8'}';
	{$sModuleName|escape:'htmlall':'UTF-8'}.sShortCodeUrl = '{$sShortCodeUrl|escape:'htmlall':'UTF-8'}';
	{/if}


</script>
