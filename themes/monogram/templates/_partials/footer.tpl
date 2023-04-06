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

<div class="hook_footer_before">
  {block name='hook_footer_before'}
    {hook h='displayFooterBefore'}
    {hook h='displayHomePress'}
  {/block}
</div>

<div class="footer-container">
  {if $customer.id = "048525"}
      <!-- Begin Sendinblue Form -->
      <!-- START - We recommend to place the below code in head tag of your website html  -->
      <style>
        @font-face {
          font-display: block;
          font-family: Roboto;
          src: url(https://assets.sendinblue.com/font/Roboto/Latin/normal/normal/7529907e9eaf8ebb5220c5f9850e3811.woff2) format("woff2"), url(https://assets.sendinblue.com/font/Roboto/Latin/normal/normal/25c678feafdc175a70922a116c9be3e7.woff) format("woff")
        }

        @font-face {
          font-display: fallback;
          font-family: Roboto;
          font-weight: 600;
          src: url(https://assets.sendinblue.com/font/Roboto/Latin/medium/normal/6e9caeeafb1f3491be3e32744bc30440.woff2) format("woff2"), url(https://assets.sendinblue.com/font/Roboto/Latin/medium/normal/71501f0d8d5aa95960f6475d5487d4c2.woff) format("woff")
        }

        @font-face {
          font-display: fallback;
          font-family: Roboto;
          font-weight: 700;
          src: url(https://assets.sendinblue.com/font/Roboto/Latin/bold/normal/3ef7cf158f310cf752d5ad08cd0e7e60.woff2) format("woff2"), url(https://assets.sendinblue.com/font/Roboto/Latin/bold/normal/ece3a1d82f18b60bcce0211725c476aa.woff) format("woff")
        }

        #sib-container input:-ms-input-placeholder {
          text-align: left;
          font-family: "Helvetica", sans-serif;
          color: #c0ccda;
        }

        #sib-container input::placeholder {
          text-align: left;
          font-family: "Helvetica", sans-serif;
          color: #c0ccda;
        }
      </style>
      <link rel="stylesheet" href="https://sibforms.com/forms/end-form/build/sib-styles.css">
      <!--  END - We recommend to place the above code in head tag of your website html -->

      <!-- START - We recommend to place the below code where you want the form in your website html  -->
      <div class="sib-form" style="text-align: right;
         background-color: #EFF2F7;                                           ">
        <div id="sib-form-container" class="sib-form-container">
            <form id="sib-form" method="POST" action="https://2ea3cacd.sibforms.com/serve/MUIEABreRTvVkDlo_F5k_TOrljPUVscAlCaTDCM3PiMHbsijqO1RYu_GaaUwYCAh2pGz1uFoJhUg3UakflvFq7PZekfBMDFe3Adtjvzb8EgHS8zJFf0Zf8XZM6_6ckcwNvZ5jcXrR_sU4WQrpKsOUfx_L53WiMQgrOb7qOkMJh0_HG2I3zTpIl7HF_CeuF9XpxP8ITyBglGD3pxA">
              <div style="padding: 8px 0;">
                <div class="sib-form-block" style="font-size:16px; text-align:left; font-weight:700; font-family:&quot;Helvetica&quot;, sans-serif; color:#3C4858; background-color:transparent; text-align:left">
                  <p>-5% sur votre première commande</p>
                </div>
              </div>
              <div style="padding: 8px 0;">
                <div class="sib-form-block" style="font-size:14px; text-align:left; font-family:&quot;Helvetica&quot;, sans-serif; color:#3C4858; background-color:transparent; text-align:left">
                  <div class="sib-text-form-block">
                    <p>Devenez membre <strong>MONOGRAM</strong>, et profitez<br>
                      d’avantages et d’offres exclusives.</p>
                  </div>
                </div>
              </div>
              <div style="padding: 8px 0;">
                <div class="sib-input sib-form-block">
                  <div class="form__entry entry_block">
                    <div class="form__label-row ">

                      <div class="entry__field">
                        <input class="input " type="text" id="EMAIL" name="EMAIL" autocomplete="off" placeholder="Votre adresse email*" data-required="true" required />
                      </div>
                    </div>

                    <label class="entry__error entry__error--primary" style="font-size:16px; text-align:left; font-family:&quot;Helvetica&quot;, sans-serif; color:#661d1d; background-color:#ffeded; border-radius:3px; border-color:#ff4949;">
                    </label>
                  </div>
                </div>
              </div>
              <div style="padding: 8px 0;">
                <div class="sib-form-block" style="text-align: left">
                  <button class="sib-form-block__button sib-form-block__button-with-loader" style="font-size:16px; text-align:left; font-weight:700; font-family:&quot;Helvetica&quot;, sans-serif; color:#FFFFFF; background-color:#060606; border-radius:3px; border-width:0px;" form="sib-form" type="submit">
                    <svg class="icon clickable__icon progress-indicator__icon sib-hide-loader-icon" viewBox="0 0 512 512">
                      <path d="M460.116 373.846l-20.823-12.022c-5.541-3.199-7.54-10.159-4.663-15.874 30.137-59.886 28.343-131.652-5.386-189.946-33.641-58.394-94.896-95.833-161.827-99.676C261.028 55.961 256 50.751 256 44.352V20.309c0-6.904 5.808-12.337 12.703-11.982 83.556 4.306 160.163 50.864 202.11 123.677 42.063 72.696 44.079 162.316 6.031 236.832-3.14 6.148-10.75 8.461-16.728 5.01z" />
                    </svg>
                    S&#039;inscrire
                  </button>
                </div>
              </div>
              <input type="text" name="email_address_check" value="" class="input--hidden">
              <input type="hidden" name="locale" value="en">
              <input type="hidden" name="html_type" value="simple">
            </form>
          </div>
      </div>
      <!-- END - We recommend to place the below code where you want the form in your website html  -->
      <!-- End Sendinblue Form -->

  {/if}
  <div class="container">
    <div class="row">
      {block name='hook_footer'}
        <div>test</div>
        <div class="links hidden-md-up footer_item">
          <div class="left_elt askquestion wrapper" id="askquestion">
            <div class="foot_title title clearfix hidden-md-up" data-target="#footer_contact" data-toggle="collapse">
              <span class="h3">{l s='Contact' d='Shop.Theme.Global'}</span>
              <span class="float-xs-right">
                <span class="navbar-toggler collapse-icons">
                  <i class="material-icons add">&#xE313;</i>
                  <i class="material-icons remove">&#xE316;</i>
                </span>
              </span>
            </div>
            <div id="footer_contact" class="askquestionbox collapse">
              <ul>
                <li class="phone">
                  <a class="displayflex" href="tel:+33627353710" title="">
                    <span class="label">Appelez-nous</span>
                    <span class="value">+33 6 27 35 37 10</span>
                  </a>
                </li>
{*
                <li class="chat">
                  <a class="displayflex" href="#" title="">
                    <span class="label">Live Chat</span>
                    <span class="value" style="text-decoration: underline;">Démarrer</span>
                  </a>
*}
                </li>
                <li class="Whatsapp">
                  <a class="displayflex" href="tel:+33627353710" title="">
                    <span class="label">WhatsApp</span>
                    <span class="value">+33 6 27 35 37 10</span>
                  </a>
                </li>
                <li class="email">
                  <a class="displayflex" href="/nous-contacter" title="">
                    <span class="label">Email</span>
                    <span class="value" style="text-decoration: underline;">Écrivez-nous</span>
                  </a>
                </li>
                {*<li class="rdv">
                  <a class="displayflex" href="{url entity='module' name='oui_appointment' controller='formulaire'}" title="">
                    <span class="label">RDV au Showroom</span>
                    <span class="value" style="text-decoration: underline;">Booker une date</span>
                  </a>
                </li>*}
              </ul>
            </div>
          </div>
        </div>
        {hook h='displayFooter'}
      {/block}
      <div class="footer_item monogram_footright col-md-3">
        <div class="monogram_footright_content">
          <img class="hidden-sm-down" src="{$urls.img_url}rond_white.svg" alt="">
          <div class="white_monogram hidden-sm-down">
            <img src="{$urls.img_url}logo_blanc.svg" alt="">
          </div>
          {widget name="ps_socialfollow" hook='displayFooter'}
        </div>
      </div>
    </div>
    <div class="row">
      {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
      {/block}
    </div>
  </div>
  <div class="footerbottom">
    <div class="container">
      <div class="row">
        <div class="fb_cover displayflex">
          <div class="fb_left col-xs-12">
            <ul>
              <li>{l s='%copyright% %year% %prestashop%' sprintf=['%prestashop%' => 'Monogram Paris, all rights reserved', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}</li>
              <li><a href="https://www.monogramparis.com/content/2-mentions-legales" title="">Mentions légales</a></li>
              <li><a href="https://www.monogramparis.com/content/11-conditions-generales-de-vente" title="">Conditions générales</a></li>
            </ul>
          </div>
          <div class="fb_right payment_logo col-xs-12">
            <img src="{$urls.img_url}payment_logo.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

{*<div id="seconnecterpopup" class="seconnecterpopup monogram_modal modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
      <div class="modal-body">
        {block name='login_form_container'}
        {include file='customer/authentication.tpl'}
        {/block}
      </div>
    </div>
  </div>
</div>

<div id="sinscrirepopup" class="sinscrirepopup monogram_modal modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
        <div class="modal-body">
          {block name='register_form_container'}
          {include file='customer/registration.tpl'}
          {/block}
        </div>
      </div>
    </div>
  </div>
</div>*}

{* Alexandre Carette on vire axept.io trop lourd !
<script>
window.axeptioSettings = {
  clientId: "62fb5a32ed5d16b2b9e23f2d",
  cookiesVersion: "https://www.monogramparis.com/fr/-fr",
};
 
(function(d, s) {
  var t = d.getElementsByTagName(s)[0], e = d.createElement(s);
  e.async = true; e.src = "//static.axept.io/sdk.js";
  t.parentNode.insertBefore(e, t);
})(document, "script");
</script>
*}


