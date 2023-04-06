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
<div id="_desktop_user_info" class="monogram_login rightnavtem">
  <div class="user-info hidden-sm-down">
    {if $logged}
      {*<a
        class="logout hidden-sm-down"
        href="{$urls.actions.logout}"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>*}
      <a
        href="{$urls.pages.my_account}"
        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons iconelt"></i>
        {*<span class="hidden-sm-down">{$customerName}</span>*}
      </a>
    {else}
      <a
        href="{$urls.pages.my_account}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons iconelt"></i>
      </a>
    {/if}
  </div>
  <div class="user-info hidden-md-up">
    <div class="onmobile displayflex">
      {if $logged}
        <a
           class="user_is_logged"
          href="{$urls.pages.my_account}"
          title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
          rel="nofollow"
        >
          {l s='Mon compte' d='Shop.Theme.Actions'}
        </a>
      {else}
        <a
          href="{$urls.pages.my_account}"
          title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
          rel="nofollow"
        >
          {l s='Se connecter' d='Shop.Theme.Actions'}
        </a>
        <a
          href="{$urls.pages.register}"
          title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
          rel="nofollow"
        >
          {l s='S\'inscrire' d='Shop.Theme.Actions'}
        </a>
      {/if}
    </div>
  </div>
</div>
