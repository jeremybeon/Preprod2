{*
 * 2008 - 2020 (c) Prestablog
 *
 * MODULE PrestaBlog
 *
 * @author    Prestablog
 * @copyright Copyright (c) permanent, Prestablog
 * @license   Commercial
 *}

<!-- Module Presta Blog -->
{if isset($in_front) && !empty($in_front)}
    <div class="article-in-front blogtopbanner">
    <div class="container">
      <div class="blogtopcover displayflex">
        <div class="blogbanner_texte col-xs-12 col-sm-4 col-md-5">
          <h1 class="banner_title in_front_title">{$in_front.title|escape:'htmlall':'UTF-8'}</h1>
          <div class="desc_banner in_front_description">
            {$in_front.resume} 
          </div>
          <div class="a_link">
            <a href="{PrestaBlogUrl id=$in_front.id seo=$in_front.link_rewrite titre=$in_front.title}" title="" tabindex="0">{l s='En savoir plus' mod='prestablog'}</a>
          </div>
        </div>
        <div class="blogtopbanner_image col-xs-12 col-sm-8 col-md-7">
          <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}{$in_front.id|intval}_couverture.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$in_front.title|escape:'htmlall':'UTF-8'}" />
        </div>
      </div>           
    </div>
  </div>
{else}
    {hook h='displaySlider'}
{/if}
    
{*<h1 class="blog-title-all">
    {if isset($prestablog_title_h1)}
		{$prestablog_title_h1|escape:'htmlall':'UTF-8'}<br>
    {/if}
	
    {if $prestablog_config.prestablog_catnews_shownbnews==1}

    <span>{$NbNews|intval}
    {if $NbNews <> 1}
        {l s='articles' mod='prestablog'}
    {else}
        {l s='article' mod='prestablog'}
    {/if}
    {if isset($prestablog_categorie_obj)}
        {l s='in the category' mod='prestablog'}&nbsp;{$prestablog_categorie_obj->title|escape:'htmlall':'UTF-8'}
    {/if}
    </span>
  {/if}
</h1>*}
{*<div class="blogtopbanner">
    <div class="container">
        <div class="blogtopcover displayflex">
            <div class="blogbanner_texte col-xs-12 col-sm-4 col-md-5">
                <h1 class="banner_title">MONOGRAM S’INSTALLE AUX GALERIES LAFAYETTE</h1>
                <div class="desc_banner">
                    Une excellente nouvelle pour toutes les addicts de la seconde main. Monogram prend ses quartiers au 6ème étage des Galeries avec 200 mètres carrés de pièces exceptionnelles sélectionnées pour l’occasion.
                </div>
                <div class="a_link">
                    <a href="" title="">{l s='En savoir plus' mod='prestablog'}</a>
                </div>
            </div>
            <div class="blogtopbanner_image col-xs-12 col-sm-8 col-md-7">
                <img src="{$urls.img_url}update/blog.jpg" alt="">
            </div>
        </div>
    </div>
</div>*}
<div class="blogcontain">
    <div class="container">
        {if sizeof($news)}
            {include file="$prestablog_pagination"}
         {if $prestablog_config.prestablog_article_page==1}
            <ul id="blog_list_1-7" class="one_article">
                {else if $prestablog_config.prestablog_article_page==2}
                <ul id="blog_list_1-7" class="two_article">
                {else if $prestablog_config.prestablog_article_page==3}
                <ul id="blog_list_1-7" class="three_article">
                  {/if}
            {foreach from=$news item=news_item name=NewsName}
                
                <li class="blog-grid col-xs-12 col-sm-4 col-md-4">
                    <div class="block_cont">
                        <div class="block_top">
                            <div class="catofpost">
                                {if sizeof($news_item.categories)}
                                    {foreach from=$news_item.categories item=categorie key=key name=current}
                                        <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}" class="categorie_blog">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
                                     {/foreach}
                                {/if}
                            </div>

                        {if isset($news_item.image_presente)}
                            <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">
                                <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$news_item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$news_item.title|escape:'htmlall':'UTF-8'}" />
                            </a>
                        {/if}
                        </div>
                        <div class="block_bas">
                            <h3>
                                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">{$news_item.title|escape:'htmlall':'UTF-8'}</a>
                            <br /><span class="date_blog-cat">{l s='Published :' mod='prestablog'}
                                    {dateFormat date=$news_item.date full=0}
                        {if $prestablog_config.prestablog_author_actif}
                        {if $prestablog_config.prestablog_author_cate_actif}

                        {foreach from=$news_item.authors item=author key=key name=current}
                                        {if $key=="firstname"}
                                            {$firstname = $author}
                                        {/if}
                                        {if $key=="pseudo"}
                                            {$pseudo = $author}
                                        {/if}

                                    {/foreach}
                                    {if $firstname}
                                                            -
                                {l s='By' mod='prestablog'}
        {/if}
                            <a href="{PrestaBlogUrl au=$news_item.author_id titre={$firstname|escape:'htmlall':'UTF-8'}}">{$firstname|escape:'htmlall':'UTF-8'}</a>


                        {/if}
                        {/if}

                                    {if sizeof($news_item.categories)} | {l s='Categories :' mod='prestablog'}
                                        {foreach from=$news_item.categories item=categorie key=key name=current}
                                            <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}" class="categorie_blog">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
                                            {if !$smarty.foreach.current.last},{/if}
                                        {/foreach}
                                    {/if}</span>


        {if $prestablog_config.prestablog_rating_actif}
                                     <div class="star_content">
        {section name="i" start=0 loop=5 step=1}
            {if $smarty.section.i.index lt $news_item.average_rating}
                            <div class="material-icons checked">star</div>
                                {elseif $news_item.average_rating == 5}
                                <div class="material-icons checked">star</div>
            {else}
                <div class="material-icons">star</div>
            {/if}
        {/section}
        </div>
        {/if}

                            </h3>
                             {if $news_item.paragraph_crop!=''}
                                 <p class="prestablog_desc">
                                        {$news_item.paragraph_crop|escape:'htmlall':'UTF-8'}
                                </p>
                             {/if}

                            <div class="prestablog_more">
                                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="blog_link"><i class="material-icons">search</i> {l s='Read more' mod='prestablog'}</a>
                                    {if $prestablog_config.prestablog_comment_actif==1}
                                        <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment" class="comments"><i class="material-icons">comment</i>  {$news_item.count_comments|intval}</a>
                                    {/if}
                                    {if $prestablog_config.prestablog_read_actif}
                                            <span><i class="material-icons">remove_red_eye</i> {$news_item.read}</span>
                                    {/if}
                                    {if $prestablog_config.prestablog_commentfb_actif==1}
                                        <a
                                            href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment"
                                            id="showcomments{$news_item.id_prestablog_news|intval}"
                                            class="comments"
                                            data-commentsurl="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                                            data-commentsidnews="{$news_item.id_prestablog_news|intval}"
                                            ><i class="material-icons">comment</i> {$news_item.count_comments|intval}
                                        </a>
                                    {/if}
                            </div>
                        </div>
                           
                                  
                            
                      </div>
                </li>
            {/foreach}
            </ul>
            {include file="$prestablog_pagination"}
        {else}
            <p class="warning">{l s='Empty' mod='prestablog'}</p>

        {/if}
    </div>
</div>
<!-- /Module Presta Blog -->
