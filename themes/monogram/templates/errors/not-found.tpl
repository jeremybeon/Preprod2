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
<section id="content" class="page-content page-not-found">
  {block name='page_content'}
    {block name="error_content"}
      {if isset($errorContent)}
        {$errorContent nofilter}
      {else}
        <h1>{l s='La page que vous cherchez n’existe pas, ou une erreur s’est produite !' d='Shop.Theme.Global'}</h1>
  

        <div class="a_link">
          <a href="{$urls.base_url}" title="{l s='Vendre' d='Shop.Theme.Global'}">{l s='RETOURNER À LA PAGE D’ACCUEIL' d='Shop.Theme.Global'}</a>
        </div>
      {/if}
    {/block}

    {hook h='ouiDisplaySelection'}
	
	{hook h='ouiDisplayNewProducts'}
	
    {block name='hook_not_found'}
		{hook h='displayNotFound'}
    {/block}

  {/block}
</section>
