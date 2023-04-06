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

{block name='page_header_container'}{/block}

{if $layout === 'layouts/layout-left-column.tpl'}
    {block name="left_column"}
        <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
            {widget name="ps_contactinfo" hook='displayLeftColumn'}
        </div>
    {/block}
{elseif $layout === 'layouts/layout-right-column.tpl'}
    {block name="right_column"}
        <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
            {widget name="ps_contactinfo" hook='displayRightColumn'}
        </div>
    {/block}
{/if}

{block name='page_content'}
	{assign var='contact' value=Configuration::get('OUI_M_phone')}
	{assign var='wha' value=Configuration::get('OUI_M_whatsapp')}
    <div class="conatct_page_content">
        <div class="intro_contact">
            <h1 class="titleh1">{l s='Aide & contact' d='Shop.Theme.Global'}</h1>
            <p>
                {l s='Une question ?' d='Shop.Theme.Global'} <br>
                {l s='Choisissez la rubrique que vous recherchez ou contactez-nous via' d='Shop.Theme.Global'} : <br>
                {l s='Téléphone' d='Shop.Theme.Global'} : <a target="_blank" href="tel:{$contact}">{$contact}</a>
                -
                {l s='Whats’app' d='Shop.Theme.Global'} : <a target="_blank" href="tel:https://api.whatsapp.com/send?phone={$wha|replace:'+':''|replace:' ':''}">{$wha}</a>
            </p>
        </div>

        <div class="actions_rapides">
            <h2 class="title_cat">{l s='Actions rapides' d='Shop.Theme.Global'}</h2>
            <div class="list_actions displayflex shopthelook_slide">
                <div class="action_nous_ecrire action_item col-xs-12 col-sm-4 col-md-4">
                    <div class="action_item_cover" type="button" data-toggle="modal" data-target="#nousecrire"
                         style="cursor: pointer;">
                        <div class="act_icon"><img src="{$urls.img_url}nous_ecrire.svg" alt=""></div>
                        <div class="act_title">{l s='Écrivez-nous' d='Shop.Theme.Global'}</div>
                        <div class="act_desc">{l s='Nous traiterons votre demande sous 24h.' d='Shop.Theme.Global'}</div>
                    </div>
                </div>
                <div class="action_item col-xs-12 col-sm-4 col-md-4">
                    <a href="{url entity='module' name='oui_deposit' controller='description'}">
                        <div class="action_item_cover">
                            <div class="act_icon"><img src="{$urls.img_url}deposez.svg" alt=""></div>
                            <div class="act_title">{l s='Déposez un article à la vente' d='Shop.Theme.Global'}</div>
                            <div class="act_desc">{l s='Remplissez notre formulaire et recevez une offre de prix en 24h' d='Shop.Theme.Global'}</div>
                        </div>
                    </a>
                </div>
                <div class="action_item col-xs-12 col-sm-4 col-md-4">
                    <a href="{$urls.pages.history}">
                        <div class="action_item_cover">
                            <div class="act_icon"><img src="{$urls.img_url}trackorder.svg" alt=""></div>
                            <div class="act_title">{l s='Suivre une commande' d='Shop.Theme.Global'}</div>
                            <div class="act_desc">{l s='Connectez-vous à votre compte client pour suivre vos achats et vos ventes' d='Shop.Theme.Global'}</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
		 


        <div class="faq_rapides">
			{hook h='ouiDisplayContactFaq'}
            
		
        </div>
    </div>
    <div id="nousecrire" class="nousecrire modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                <div class="modal-body">
                    {widget name="contactform"}
                </div>
            </div>
        </div>
    </div>
{/block}
