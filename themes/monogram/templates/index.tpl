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

{block name='page_content_container'}
    <section id="content" class="page-home">
        {block name='page_content_top'}{/block}
        {block name='page_content'}
            {block name='hook_home'}
				{$HOOK_HOME nofilter}
                {*{hook h='ouiDisplayNewProducts'}*}
				{hook h='displayHomeFeat1'}

                {hook h='ouiDisplayHomeText1'}
                {hook h='monEventHome'}
                
                {hook h='ouiDisplaySelection'}
				
				{hook h='displayHomeFeat2'}
                {* On enleve sac iconique Alexandre CARETTE 27/02/2021 {hook h='ouiDisplayTopCategory'}*}
                {hook h='ouiDisplayHomeShowroom'}
                {hook h='ouiDisplayTopCategories'} 
                {hook h='displayInstagram'} 
                {hook h='ouiDisplayHomeText2'}
            {/block}
        {/block}
    </section>
{/block}


<!--<section id="instagrambloc" class="instagrambloc homebloc">
	<div class="container">
		<div class="row">
			<div class="instagram_cover">
				<h2 class="titleh2 h2">{l s='@MONOGRAM OFFICIEL' d='Shop.Theme.Global'}</h2>
				<div class="desc_instagram">
					PARTAGEZ VOS PLUS BELLES PIÈCES MONOGRAM,<br>
					ET DEVENEZ NOTRE ÉGÉRIE EN MENTIONNANT @MONOGRAMOFFICIEL
				</div>
				<div class="instagramlist slickinstagram displayflex">
					<div class="insta_item">
						<div class="insta_img"><a href="" title=""><img src="{$urls.img_url}/update/lydia.jpg" alt=""></a></div>
						<h3 class="insta_name"><a href="" title="">@lydiafreyssinet</a></h3>
					</div>
					<div class="insta_item">
						<div class="insta_img"><a href="" title=""><img src="{$urls.img_url}/update/nayla.jpg" alt=""></a></div>
						<h3 class="insta_name"><a href="" title="">@pauline.schel</a></h3>
					</div>
					<div class="insta_item">
						<div class="insta_img"><a href="" title=""><img src="{$urls.img_url}/update/pauline.jpg" alt=""></a></div>
						<h3 class="insta_name"><a href="" title="@pauline.schel">@pauline.schel</a></h3>
					</div>
					<div class="insta_item">
						<div class="insta_img"><a href="" title="@pauline.schel"><img src="{$urls.img_url}/update/pauline1.jpg" alt=""></a></div>
						<h3 class="insta_name"><a href="" title="@pauline.schel">@pauline.schel</a></h3>
					</div>
					<div class="insta_item">
						<div class="insta_img"><a href="" title=""><img src="{$urls.img_url}/update/pauline2.jpg" alt=""></a></div>
						<h3 class="insta_name"><a href="" title="@pauline.schel">@pauline.schel</a></h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="fashionforgood" class="fashionforgood homebloc">
	<div class="container">
		<div class="row">
			<div class="fashionforgood_cover displayflex">
				<div class="fashiontext col-xs-12 col-md-6">
					<h2>Fashion<br> For Good</h2>
					<div class="fashiontext_desc">
						<h3>VENDRE CHEZ MONOGRAM C’EST :</h3>
						<ul class="displayflex">
							<li class="displayflex">
								<div class="fashion_img hidden-md-up">
									<img src="{$urls.img_url}heart.svg" alt="">
								</div>
								Participer à un nouveau mode de consommation responsable et bon pour la planète !
							</li>
							<li class="displayflex">
								<div class="fashion_img hidden-md-up">
									<img src="{$urls.img_url}bag.svg" alt="">
								</div>
								Augmenter son pouvoir d’achat en gagnant de l’argent simplement
							</li>
							<li class="displayflex">
								<div class="fashion_img hidden-md-up">
									<img src="{$urls.img_url}fashion_phone.svg" alt="">
								</div>
								Un service de vente clé en main du shooting à la mise en ligne
							</li>
							<li class="displayflex">
								<div class="fashion_img hidden-md-up">
									<img src="{$urls.img_url}financer.svg" alt="">
								</div>
								Financer son futur achat grâce à une économie circulaire
							</li>
						</ul>
					</div>
				</div>
				<div class="fashionimg col-xs-12 col-md-6">
					<img src="{$urls.img_url}/update/image_e.jpg" alt="">
					<h3 class="fashiontitle displayflex"><a href="" title="">{l s='Vendre vos articles' d='Shop.Theme.Global'}</a></h3>
				</div>
			</div>
		</div>
	</div>
</section>
-->
