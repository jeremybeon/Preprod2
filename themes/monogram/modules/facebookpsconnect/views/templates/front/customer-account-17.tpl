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

{extends file='page.tpl'}
{block name='page_content'}
	<h1 class="page-subheading">
		{l s='Connection with Social Networks' mod='facebookpsconnect'}
	</h1>

	<table class="table table-striped" id="fbpsc">
		<thead>
			{*<th>{l s='Social Network' mod='facebookpsconnect'}</th>*}
			{*<th>{l s='Action' mod='facebookpsconnect'}</th>*} 
			<th></th>
		</thead>
		<tbody>
			{foreach from=$aConnectorsList key=cName item=cValue}
				{if !empty($cValue.data)}
					{if !empty($cValue.data.activeConnector)}
					<tr>
						<td class="center">
							<a class="btn-connect btn-block-connect btn-social bt-btn-sl {$bBtnRounded|escape:'htmlall':'UTF-8'} {$bBtnShadow|escape:'htmlall':'UTF-8'} btn-{$cName|escape:'htmlall':'UTF-8'}" >
								<span class="fa fa-bt-{$cName|escape:'htmlall':'UTF-8'}"></span>
								&nbsp;
								{if isset($cValue.label.$sCurrentIso)}
									<span class='btn-title-connect'>{$cValue.label.$sCurrentIso|escape:'htmlall':'UTF-8'|ucfirst|escape:'htmlall':'UTF-8'}</span>
								{else}
									<span class='btn-title-connect'>{l s='Connect with' mod='facebookpsconnect'}&nbsp{$cName|escape:'htmlall':'UTF-8'|ucfirst|escape:'htmlall':'UTF-8'}</span>
								{/if}
							</a>
						</td>
						<td class="center">
							{* Use case for social network linked *}
							{if !empty($aLinkedSocial)}
								{if in_array($cName,$aLinkedSocial)}
									<a class="btn btn-primary float-right text-white btn-type-{$cName|escape:'htmlall':'UTF-8'}" data-network="{$cName|escape:'htmlall':'UTF-8'}" id="btSlUnlink"><i class="fa fa-unlink"></i> {l s='Unlink' mod='facebookpsconnect'}</a>
									<div class="inProgress-{$cName|escape:'htmlall':'UTF-8'} alert alert-info row" style="display: none;">
										<div class="col-xs-2">
											<img src="{$sLoadingImg|escape:'htmlall':'UTF-8'}" width="30px" height="30px" class="img-responsive" alt="Loading" />
										</div>
										<div class="col-xs-10">
											<p class="text-info">{l s='Your configuration update is in progress...' mod='facebookpsconnect'}</p>
										</div>
									</div>
								
								{else}
									<a class="btn btn-secondary float-right disabled"><i class="fa fa-disable"></i> {l s='No link' mod='facebookpsconnect'}</a>
								{/if}
							{else}
								<a class="btn btn-secondary float-right disabled">{l s='No link' mod='facebookpsconnect'}</a>
							{/if}
						</td>
						<td id="unLinkError-{$cName|escape:'htmlall':'UTF-8'}"></td>
					</tr>
					{/if}
				{/if}
			{/foreach}	
		</tbody>
	</table>

	
	<div id="unLinkInProgress"></div>
	<footer class="page-footer">
		<a href="{$sMyAccountLink|escape:'htmlall':'UTF-8'}" class="account-link">
			<i class="material-icons">&#xE5CB;</i>
			<span>{l s='Back to your account' mod='facebookpsconnect'}</span>
		</a>
		<a href="{$sIndex|escape:'htmlall':'UTF-8'}" class="account-link">
			<i class="material-icons">&#xE88A;</i>
			<span>{l s='Home' mod='facebookpsconnect'}</span>
		</a>
	</footer>

	<script type="text/javascript">
	$(document).ready(function() {
		$("a#btSlUnlink").each(function(index) {
			$(this).click(function() {
				var network = $(this).data('network');
				var url = "{$link->getModuleLink('facebookpsconnect', 'ajax', array())|escape:'html':'UTF-8'}";

				$.ajax({
					type: 'POST',
					url: url,
					dataType:'json',
					data: {
						ajax:1,
						action: 'unlinkSocial',
						network:network,
						token: '{$sToken}',
					},
					success: function(jsonData, textStatus, jqXHR) {
						$('a.btn-type-' + network ).hide();
						$('.inProgress-' +  network).show();
						setTimeout(function () {
							$('.inProgress-' +  network).hide();
							window.location.reload();
						}, 2000);	
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						$('a.btn-type-' + network ).removeClass('btn-primary').addClass('btn-danger');
						$('#unLinkError-' + network).html('<p class="alert alert-danger">' + errorThrown + '</p>');
						setTimeout(function () {
							$('#unLinkError-' + network).html('');
							$('a.btn-type-' + network ).removeClass('btn-danger').addClass('btn-primary');
						}, 3000);
					}
				});
			});
		});
	});	
	</script>
{/block}
