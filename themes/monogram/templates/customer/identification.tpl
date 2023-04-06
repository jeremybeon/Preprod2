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
{extends 'customer/page.tpl'}

	{*{block name='page_title'}
	  	{l s='Authentication of my identity' d='Shop.Theme.Customeraccount'}
	{/block}*}
	{block name='page_content'}
		<div class="custom_accountpage">
			<div class="pagetitle"> 
            	<h1 class="page_title">
                	{l s='Authentification de mon identité' d='Shop.Theme.Customeraccount'}
                </h1>
            </div>

			<form class="identification_form" method="" action="">

				<div class="photodidentite">
					<p class="ph_identitie_title">{l s='Votre photo d\'identité (optionnel)' d='Shop.Theme.Actions'}</p>
					<div class='form-group formfile'>
						<label class="uploadFile">
							<span class="filename">{l s='Ajouter une photo d\'identité' d='Shop.Theme.Actions'}</span>
							<input type="file" class="inputfile form-control" name="file">
						</label>
					</div>
				</div>

				<div class="identification_fields">
					<div class="form-group row photo_field customfilebox">
						<div class="custom_fileinput displayflex">
							<div class="left displayflex">
								<img src="{$urls.img_url}/identitie.jpg" class="file_preview">
							</div>
							<div class="right">
								<input class="inputfile" type="file" id="identitiefile">
								<label for="identitiefile" class="file_button">{l s='Modify your identification' d='Shop.Theme.Customeraccount'}</label>
							</div>
						</div>
					</div>
					<div class="form-group row customfilebox">
						<p class="sfield_title">{l s='Your signature*' d='Shop.Theme.Customeraccount'}</p>
						<div class="custom_fileinput signature_file displayflex">
							<div class="left displayflex">
								<img src="{$urls.img_url}/signature.jpg" class="file_preview">
							</div>
							<div class="right">
								<input class="inputfile" type="file" id="signature">
								<label for="signature" class="file_button">{l s='Modify your signature' d='Shop.Theme.Customeraccount'}</label>
							</div>
						</div>
					</div>
					<div class="form-group row submit_row">
	        			<button class="submit_my_rib boutonstyle form-control-submit" type="submit">{l s='Enregistrer mon rib' d='Shop.Theme.Actions'}</button>
	        		</div>
        		</div>
			</form>		
		</div>
	{/block}

	<style type="text/css">
		
	</style>
