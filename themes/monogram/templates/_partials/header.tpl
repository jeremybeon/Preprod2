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

{block name='header_banner'}
	<div class="header-banner hidden-md-up_old">
	  {hook h='displayBanner'}
	</div>
{/block} 

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container">
      <div class="row">
        <div class="header_nav_cover displayflex">
          <div class="header_nav_left col-xs-3 col-md-4">
            {hook h='displayNav1'}
            <div class="nav_monogram displayflex">

              <div id="menusearch" class="left_elt menusearch hidden-md-up">
                <span class="menumobileicon"></span>
                <div id="menusearchcover" class="menusearchcover" style="display:none;">
                  
                  <div class="logobox displayflex">
                    <div class="logomonoram">
                      {if $shop.logo_details}
                        {if $page.page_name == 'index'}
                          <h1>
                            {*{renderLogo}*}
                            <a href="{$urls.base_url}fr/"><img src="{$urls.img_url}monogram_logo.svg" alt="Dépôt Vente Luxe"></a>
                          </h1>
                        {else}
                          <p><a href="{$urls.base_url}fr/"><img src="{$urls.img_url}monogram_logo.svg" alt=""></a></p>
                        {/if}
                      {/if}
                    </div>
                    <div class="closebox"></div>
                  </div>

                  {hook h='displaySearch'}

                  <div class="mobile_user_info" id="_mobile_user_info"></div>

                  <div class="mobile_left_icon displayflex">
                    <div class="left_elt showmenu active">
                      <div id="menu-icon" class="">{l s='Acheter' d='Shop.Theme.Global'}</div>
                    </div>
                    <div class="left_elt vendre"><a href="{$link->getModuleLink('oui_deposit','description')}" title="">{l s='Vendre' d='Shop.Theme.Global'}</a></div>
                    <div class="left_elt wishlist">
	                   {if $customer.is_logged}
	                    <a href="{url entity='module' name='blockwishlist' controller='lists'}" title="">{l s='Ma wishlist' d='Shop.Theme.Global'}</a>
	                   {else}
	                    <a href="{$urls.base_url}fr/connexion" title="">{l s='Ma wishlist' d='Shop.Theme.Global'}</a>
	                   {/if}
	                    </div>

                    <div id="mobile_top_menu_wrapper" class="row hidden-md-up">
                      <div class="menu_on_mobile" id="menu_on_mobile">
                        {hook h='displayTop'}
                      </div>
                      <div class="salemobile displayflex">
                        <div class="salemobile_text displayflex">{l s='Revendez vos articles et financez votre prochain coup de coeur' d='Shop.Theme.Global'}</div>
                        <div class="salelink">
                          <a class="displayflex" href="{$link->getModuleLink('oui_deposit','description')}" title="{l s='Vendre' d='Shop.Theme.Global'}">{l s='Vendre' d='Shop.Theme.Global'}</a>
                        </div>
                      </div>
                    </div>
                    
                  </div>

                  <!-- Nos selections -->
                  {hook h='ouiDisplaySelection'}

                  <!-- Services -->
                  <div class="menu_services">
                    <span class="titleh2">Services</span>
                    <ul class="nostyle">
                      <li><a href="{url entity='contact'}" title="{l s='Aide & Contact' d='Shop.Theme.Global'}">{l s='Aide & Contact' d='Shop.Theme.Global'}</a></li>
                      <li><a href="{$link->getModuleLink('prestablog', 'actualites')}" title="{l s='S’inspirer sur notre blog' d='Shop.Theme.Global'}">{l s='S’inspirer sur notre blog' d='Shop.Theme.Global'}</a></li>
                      
                    {*  <li><a href="{$link->getModuleLink('oui_appointment', 'formulaire')}" title="{l s='Prendre rdv au showroom' d='Shop.Theme.Global'}">{l s='Prendre rdv au showroom' d='Shop.Theme.Global'}</a></li>
                    *}
                    </ul>
                  </div>

                </div>
              </div>

				{assign var='contact' value=Configuration::get('OUI_M_phone')}
				{assign var='wha' value=Configuration::get('OUI_M_whatsapp')}
              <div class="left_elt askquestion hidden-sm-down" id="askquestion">
                <span class="askbtn clickbtn">{l s='?' d='Shop.Theme.Global'}</span>
                <div class="askquestionbox">
                  <label class="ask_title">{l s='Vous avez une question ?' d='Shop.Theme.Global'}</label>
                  <ul>
                    <li class="phone">
                      <a target="_blank" class="displayflex" href="tel:{$contact}" title="">
                        <span class="label">Appelez-nous</span>
                        <span class="value">{$contact}</span>
                      </a>
                    </li>
                    <li class="chat">
                      <a class="displayflex oui_liveChat" href="#" title="Live Chat">
                        <span class="label">Live Chat</span>
{*                         <span class="value" style="text-decoration: underline;">Démarrer</span> *}
                        <button class="crispBtn" onclick="$crisp.push(['do', 'chat:open'])">Démarrer</button>
                      </a>
                    </li>
                    <li class="Whatsapp">
                      <a target="_blank" class="displayflex" href="https://api.whatsapp.com/send?phone={$wha|replace:'+':''|replace:' ':''}" title="">
                        <span class="label">WhatsApp</span>
                        <span class="value">{$wha}</span>
                      </a>
                    </li>
                    <li class="email">
                      <a class="displayflex" href="{url entity='contact'}" title="">
                        <span class="label">Email</span>
                        <span class="value" style="text-decoration: underline;">Écrivez-nous</span>
                      </a>
                    </li>
                    {*<li class="rdv">
                      <a class="displayflex" href="{url entity='module' name='oui_appointment' controller='formulaire'}" title="">
                        <span class="label"></span>
                        <span class="value" style="text-decoration: underline;">Prendre RDV au Showroom</span>
                      </a>
                    </li>*}
                  </ul>
                </div>
              </div>

              <div class="left_elt showmenu hidden-sm-down" id="showmenu"><a class="clickbtn" href="{$link->getCategoryLink(1332)}" title="{l s='Nouveauté sac' d='Shop.Theme.Global'}">{l s='ACHETER' d='Shop.Theme.Global'}</a></div>

              <div class="left_elt vendre hidden-sm-down" id="vendre"><a class="clickbtn" href="{$link->getModuleLink('oui_deposit','description')}" title="{l s='VENDRE' d='Shop.Theme.Global'}">{l s='VENDRE' d='Shop.Theme.Global'}</a></div>

              <div class="left_elt hidden-sm-down"><a class="clickbtn" href="{url entity='cms' id=4}" title="{l s='À PROPOS' d='Shop.Theme.Global'}">{l s='À PROPOS' d='Shop.Theme.Global'}</a></div>

            </div>
          </div>
          <div class="logosite col-xs-6 col-md-4" id="desktop_logo">
            {if $shop.logo_details}
              {if $page.page_name == 'index'}
                <p>
                  {*{renderLogo}*}
                  <a href="{$urls.base_url}fr/"><img src="{$urls.img_url}monogram_logo.svg" alt=""></a>
                </p>
              {else}
                {*{renderLogo}*}
                <p><a href="{$urls.base_url}fr/"><img src="{$urls.img_url}monogram_logo.svg" alt=""></a></p>
              {/if}
            {/if}
          </div>
          <div class="header_nav_right right-nav col-xs-3 col-md-4">
            {hook h='displayNav2'}
          </div>
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container">
      <div class="row">
        <div class="header-top-right col-sm-12">
          {hook h='displayTop'}
          <div id="menu_mobile" class="menu_mobile hidden-md-up">
            {widget name="iqitmegamenu" hook='displayTop'}
          </div>
        </div>
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}
