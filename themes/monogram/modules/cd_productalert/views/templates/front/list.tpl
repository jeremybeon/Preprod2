{extends file='customer/page.tpl'}

{$page.body_classes['page-customer-account'] = true}

{block name="page_title"}
    {l s="Mes alertes" d="Modules.Cdproductalert.list"}
{/block}
{block name='page_content'}
    <section class="my-alert">
		<div class="custom_accountpage">
            <div class="account_page">
                <div class="pagetitle">
                    <h1 class="page_title">
                        {l s='Mes alertes' d='Shop.Theme.Customeraccount'}
                    </h1>
                </div>
            </div>
			
			{*<a href="{$add_alert}" title="{l s="Ajouter une nouvelle alerte" d="Modules.Cdproductalert.list"}" class="add-alert">
				<i class="material-icons">add_circle</i>
			</a>*}
			<div class="clearfix"></div>
			{if isset($alerts) && !empty($alerts)}
				<div class="alerts">
					{foreach from=$alerts item=alert}
						<div  class="alert">
							<div class="alert-content">
								<span class="alert_name">{$alert.category} - {$alert.manufacturer} {if !empty($alert.model)}- {$alert.model}{/if}</span>
								<br><strong class="alert_price">{$alert.price}</strong>   
							</div>
							<div class="alert-actions">
								{*<a class="link text-warning" href="{$alert.edit_link}">
									<i class="material-icons">edit</i>
								</a>
								{*<a class="link" href="{$alert.link}">
									<i class="material-icons">visibility</i>
								</a>*}
								<a class="link text-danger" href="{$alert.delete_link}">
									<i class="material-icons">delete</i>
								</a>
							</div>
						</div>
					{/foreach}
				</div>
			{else}
				<p class="alert alert-infos">
					{l s="Vous n'avez pas encore d'alerte produit" d="Modules.Cdproductalert.list"}
				</p>
			{/if}
		</div>
    </section>
{/block}