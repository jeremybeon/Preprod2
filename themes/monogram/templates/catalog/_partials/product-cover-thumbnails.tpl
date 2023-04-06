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

 {** Alexandre Carette je met un row pour contenir l image en mobile**}
<div class="row images-container js-images-container">
  {block name='product_cover'}
    <div class="product-cover">
      {if $product.default_image}
        
        
 {** Alexandre Carette image en double voir code commenté plus bas **}

        <img
          
          class="js-qv-product-cover img-fluid"
          src="{$product.default_image.bySize.medium_default.url}"
          {if !empty($product.default_image.legend)}
            alt="{$product.default_image.legend}"
            title="{$product.default_image.legend}"
          {else}
            alt="{$product.name}"
          {/if}
         
        >
        
        {*<img
          id="zoomimg"
          data-zoom-image="{$product.default_image.bySize.large_zoom.url}"
          class="js-qv-product-cover img-fluid hidden-sm-down"
          src="{$product.default_image.bySize.medium_default.url}"
          {if !empty($product.default_image.legend)}
            alt="{$product.default_image.legend}"
            title="{$product.default_image.legend}"
          {else}
            alt="{$product.name}"
          {/if}
          loading="lazy"
          width="{$product.default_image.bySize.medium_default.width}"
          height="{$product.default_image.bySize.medium_default.height}"
        >*}

        {** affichage pour mobile **}

      {*<img
          data-zoom-image="{$product.default_image.bySize.large_zoom.url}"
          class="js-qv-product-cover img-fluid hidden-md-up"
          src="{$product.default_image.bySize.medium_default.url}"
          {if !empty($product.default_image.legend)}
            alt="{$product.default_image.legend}"
            title="{$product.default_image.legend}"
          {else}
            alt="{$product.name}"
          {/if}
          loading="lazy"
          width="{$product.default_image.bySize.medium_default.width}"
          height="{$product.default_image.bySize.medium_default.height}"
        >*}


        {*<div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
          <i class="material-icons zoom-in">search</i>
        </div>*}
      {else}
        <img
          id="zoomimg"
          data-zoom-image="{$urls.no_picture_image.bySize.large_zoom.url}"
          class="img-fluid"
          src="{$urls.no_picture_image.bySize.medium_default.url}"
          loading="lazy"
          width="{$urls.no_picture_image.bySize.medium_default.width}"
          height="{$urls.no_picture_image.bySize.medium_default.height}"
        >
       
      {/if}
      <div class="sticker_elements">
		<ul class="displayflex">
		{if !empty($product.stickers)} 
			{foreach from=$product.stickers item='sticker'}
				<li>{$sticker}</li>
			{/foreach} 
		{/if}
		{if $product.quantity < 1 && !$product.inMyCart}
			<li class="st_vendu">{l s='Vendu' d='Shop.Theme.Catalog'}</li>
		{/if}
		</ul>
      </div>
      <div class="productactions hidden-md-up">
        {hook h='displayProductActions' product=$product}
      </div>
    </div>
  {/block}

  {block name='product_images'}
    <div class="js-qv-mask mask">
      <ul id="demogallery" class="product-images js-qv-product-images">
	  {**Alexandre Carette oui_custom_field **} {*{hook h='displayAnotherProductThumbs' product=$product type="simple"}*}
        {foreach from=$product.images item=image}
          <li class="thumb-container js-thumb-container">
            <a href="#" data-image="{$image.bySize.large_default.url}" data-zoom-image="{$image.bySize.large_zoom.url}">
              <img
                id="zoomimg"
                class="thumb js-thumb {if $image.id_image == $product.default_image.id_image} selected js-thumb-selected {/if}"
                data-image-medium-src="{$image.bySize.medium_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}"
                src="{$image.bySize.small_default.url}"
                {if !empty($image.legend)}
                  alt="{$image.legend}"
                  title="{$image.legend}"
                {else}
                  alt="{$product.name}"
                {/if}
                loading="lazy"
                width="{$product.default_image.bySize.small_default.width}"
                height="{$product.default_image.bySize.small_default.height}"
              >
            </a>
          </li>
        {/foreach} 
      </ul>
    </div>
  {/block}
{hook h='displayAfterProductThumbs' product=$product}
</div>
