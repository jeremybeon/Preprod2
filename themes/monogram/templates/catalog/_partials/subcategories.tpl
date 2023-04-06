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
{if !empty($subcategories)}
  {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
    <div id="subcategories" class="displayflex">
{*       <div class="current_cat_title subcat_item displayflex">{l s='Tous les' d='Shop.Theme.Category'} <br>{$category.name}</div> *}
      <div class="current_cat_title subcat_item displayflex">{l  d='Shop.Theme.Category' s=''} <br>{$category.name}</div>
      <ul class="subcategories-list displayflex subcatslider">
        {foreach from=$subcategories item=subcategory}
          <li class="subcat_item">
            <div class="subcat_image subcategory-image">
              <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" 
	             title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
                
                <img src="{$urls.base_url}img/c/{$subcategory.id_category}-category_default.jpg"  
                	 alt="{if !empty($subcategory.image.legend)}{$subcategory.image.legend}{else}{$subcategory.name}{/if}"  loading="lazy"/>
              </a>
            </div>

            <span class="subcat_name">
              <a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}"> 
                {$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}
              </a>
            </span>
              {*{if $subcategory.description}
                <div class="cat_desc">{$subcategory.description|unescape:'html' nofilter}</div>
              {/if}*}
          </li>
        {/foreach}
      </ul>
    </div>
  {/if}
{/if}
