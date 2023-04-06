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

<div class="block_newsletter" id="blockEmailSubscription_{$hookName}">
  <div class="container">
    <div class="row">
      <div class="news_cover displayflex">
        <div class="news_left col-md-6">
          <p class="block-newsletter-label hidden-md-up">{l s='Rejoignez-nous !' d='Shop.Theme.Global'}</p>
          <p class="news_label">{l s='Profitez de -5% sur votre première commande' d='Shop.Theme.Global'}</p>
          <p class="hidden-sm-down">
            {l s='Abonnez-nous à notre newsletter et bénéficiez' d='Shop.Theme.Global'}<br>
            {l s='de nombreux avantages et offres exclusives toute l’année.' d='Shop.Theme.Global'}
          </p>
        </div>
        <div class="news_right col-md-6 col-xs-12">
          <div class="news_right_cover">
            <p id="block-newsletter-label" class="block-newsletter-label hidden-sm-down">{l s='Rejoignez-nous !' d='Shop.Theme.Global'}</p>
            <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
              <div class="row">
                <div class="news_input col-xs-12">
                  <div class="input-wrapper displayflex">
                    <input
                      name="email"
                      type="email"
                      value="{$value}"
                      placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                      aria-labelledby="block-newsletter-label"
                      required
                    >
                    <input
                      class="btn btn-primary"
                      name="submitNewsletter"
                      type="submit"
                      value="{l s='Ok' d='Shop.Theme.Actions'}"
                    >
                  </div>
                  <input type="hidden" name="blockHookName" value="{$hookName}" />
                  <input type="hidden" name="action" value="0">
                  <div class="clearfix"></div>
                </div>
                <div class="col-xs-12">
                    {*{if $conditions}
                      <p>{$conditions}</p>
                    {/if}*}
                    {if $msg}
                      <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                        {$msg}
                      </p>
                    {/if}
                    {hook h='displayNewsletterRegistration'}
                    {if isset($id_module)}
                      {hook h='displayGDPRConsent' id_module=$id_module}
                    {/if}
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="emailboxpopup" class="emailboxpopup modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
      <div class="modal-body">
        <div class="block_newsletter">
          <div class="container">
            <div class="row">
              <div class="news_cover displayflex">
                <div class="news_right_cover">
                  <div class="logosite" id="desktop_logo">
                    <a href="{$urls.base_url}"><img src="{$urls.img_url}monogram_logo.svg" alt=""></a>
                  </div>
                  <p class="news_label">{l s='-5% sur votre première commande !' d='Shop.Theme.Global'}</p>
                  <p>
                    {l s='Devenez membre Monogram, et profitez d’avantages et d’offres exclusives.' d='Shop.Theme.Global'}
                  </p>
                  <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
                    <div class="row">
                      <div class="news_input col-xs-12">
                        <div class="input-wrapper displayflex">
                          <input
                            name="email"
                            type="email"
                            value="{$value}"
                            placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                            aria-labelledby="block-newsletter-label"
                            required
                          >
                          <input
                            class="btn btn-primary"
                            name="submitNewsletter"
                            type="submit"
                            value="{l s='Ok' d='Shop.Theme.Actions'}"
                          >
                        </div>
                        <input type="hidden" name="blockHookName" value="{$hookName}" />
                        <input type="hidden" name="action" value="0">
                        <div class="clearfix"></div>
                      </div>
                      <div class="col-xs-12">
                          {*{if $conditions}
                            <p>{$conditions}</p>
                          {/if}*}
                          {if $msg}
                            <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                              {$msg}
                            </p>
                          {/if}
                      </div>
                    </div>
                  </form>
                  <p class="subscribe_modal">
                    {l s='En vous inscrivant, vous acceptez notre' d='Shop.Theme.Global'} 
                    <a href="" title="" style="text-decoration: underline;">{l s='politique de confidentialité.' d='Shop.Theme.Global'}</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
