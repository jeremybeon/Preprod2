{*
* 2007-2017 IQIT-COMMERCE.COM
*
* NOTICE OF LICENSE
*
*  @author    IQIT-COMMERCE.COM <support@iqit-commerce.com>
*  @copyright 2007-2017 IQIT-COMMERCE.COM
*  @license   GNU General Public License version 2
*
* You can not resell or redistribute this software.
*
*}

{function name="categories_links" nodes=[] level=1}
    {strip}
        <ul class="{if $level==1}cbp-links cbp-category-tree{elseif $level==2}cbp-hrsub-level2{elseif $level==3}cbp-hrsub-level2 cbp-hrsub-level3{/if}">
            {foreach $categories as $category}
                {if isset($category.title)}
                    <li {if isset($category.children)} class="{if $level==1}cbp-hrsub-haslevel2{else}cbp-hrsub-haslevel3{/if}" {/if}>
                        <div class="cbp-category-link-w">
                            <a href="{$category.href}">{$category.title}</a>
                            {if isset($category.children)}
                                {categories_links categories=$category.children level=$level+1}
                            {/if}
                        </div>
                    </li>
                {/if}

                <pre>{$categories|@var_dump}</pre>

            {/foreach}
        </ul>
    {/strip}
{/function}



{if $node.type==1}
<div class="row menu_row menu-element {if $node.depth==0} first_rows{/if} menu-element-id-{$node.elementId}">
    {elseif $node.type==2}
    <div class="col-xs-{$node.width} cbp-menu-column cbp-menu-element menu-element-id-{$node.elementId} {if $node.contentType==0}cbp-empty-column{/if}{if $node.contentType == 6 && isset($node.content.absolute)} cbp-absolute-column{/if}">
        <div class="cbp-menu-column-inner">
            {/if}
            {if $node.type==2}

                {if isset($node.content_s.title)}
                    {if isset($node.content_s.href)}
                        <a href="{$node.content_s.href}"
                           class="cbp-column-title{if  isset($node.content.view) && $node.content.view==2 && $node.contentType==3} cbp-column-title-inline{/if}">{$node.content_s.title} {if isset($node.content_s.legend)}
                                <span class="label cbp-legend cbp-legend-inner">{$node.content_s.legend}
                                <span class="cbp-legend-arrow"></span>
                                </span>{/if}</a>
                    {else}
                        <span class="cbp-column-title{if isset($node.content.view) && $node.content.view==2 && $node.contentType==3} cbp-column-title-inline{/if} transition-300">{$node.content_s.title} {if isset($node.content_s.legend)}
                                <span class="label cbp-legend cbp-legend-inner">{$node.content_s.legend}
                                <span class="cbp-legend-arrow"></span>
                                </span>{/if}</span>
                    {/if}
                {/if}

                {if $node.contentType==1}

                    {if isset($node.content.ids) && $node.content.ids}
                        {*HTML CONTENT*} {$node.content.ids nofilter}
                    {/if}

                {elseif $node.contentType==2}

                    {if isset($node.content.ids)}

                        {if $node.content.treep}
                            <div class="row cbp-categories-row">
                                {foreach from=$node.content.ids item=category}
                                    {if isset($category.title)}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                            <a href="{$category.href}" class="cbp-column-title cbp-category-title">{$category.title}</a>
                                                {if isset($category.thumb) && $category.thumb != ''}<a
                                                    href="{$category.href}" class="cbp-category-thumb"><img
                                                            class="replace-2x img-fluid" src="{$category.thumb}"
                                                            alt="{$category.title}"/></a>{/if}
                                                {if isset($category.children)}
                                                    {categories_links categories=$category.children level=1}
                                                {/if}
                                            </div>

                                           


                                        </div>
                                    {/if}
                                {/foreach}

                                 {** Modif du menu par ALexandre CARETTE 19/03/2023**}
                                 {if $node.content_s.title == "Designers"}
                                    <div class="col-xs-{$node.content.line}">
                                        <div class="cbp-category-link-w">
                                            <a href="https://www.monogramparis.com/fr/brands" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                        </div>
                                    </div>
                               
                                {/if}
                                {foreach from=$node.content.ids item=category}
                                    {if isset($category.title) && $category.title =='Sacs à main'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                               <a href="https://www.monogramparis.com/fr/10-sacs" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                            </div>
                                        </div>
                                    {elseif isset($category.title) && $category.title =='Chapeaux'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                               <a href="https://www.monogramparis.com/fr/11-accessoires" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                            </div>
                                        </div>
                                    
                                    {elseif isset($category.title) && $category.title =='Bagues'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                                <a href="https://www.monogramparis.com/fr/13-bijoux" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                            </div>
                                        </div>
                                    {elseif isset($category.title) && $category.title =='Bottines'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                                <a href="https://www.monogramparis.com/fr/12-chaussures" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                            </div>
                                        </div>
                                    
                                    {elseif isset($category.title) && $category.title =='Manteaux'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                                <a href="https://www.monogramparis.com/fr/14-pret-a-porter" class="cbp-column-title cbp-category-title"><strong>Voir tout</strong></a>
                                            </div>
                                        </div>
                                    
                                    {elseif isset($category.title) && $category.title =='Crèmes visage'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                                <a href="https://www.monogramparis.com/fr/1023-cosmetiques" class="cbp-column-title cbp-category-title"><small><strong>Voir tout...</strong></small></a>
                                            </div>
                                        </div>

                                    {elseif isset($category.title) && $category.title =='Décoration'}
                                        <div class="col-xs-{$node.content.line}">
                                            <div class="cbp-category-link-w">
                                                <a href="https://www.monogramparis.com/fr/20-lifestyle" class="cbp-column-title cbp-category-title"><small><strong>Voir tout...</strong></small></a>
                                            </div>
                                        </div>

                              
                                    {/if}
                                {/foreach}

                              
                                
                            </div>
                        {else}
                            <ul class="cbp-links cbp-category-tree">
                                {foreach from=$node.content.ids item=category}
                                    {if isset($category.title)}
                                        <li {if isset($category.children)}class="cbp-hrsub-haslevel2"{/if}>
                                            <div class="cbp-category-link-w">
                                            
                                                <a href="{$category.href}">{$category.title}</a>

                                                {if isset($category.children)}
                                                    {categories_links categories=$category.children level=2}
                                                {/if}
                                            </div>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>

                          
                        {/if}
                    {/if}

                {elseif $node.contentType==3}

                    {if isset($node.content.ids)}
                        <ul class="cbp-links cbp-valinks{if !$node.content.view} cbp-valinks-vertical{/if}{if $node.content.view==2} cbp-valinks-vertical cbp-valinks-vertical2{/if}">
                            {foreach from=$node.content.ids item=va_link}
                                {if isset($va_link.href) && isset($va_link.title) && $va_link.href != '' && $va_link.title != ''}
                                    {if $va_link.href == 'https://www.monogramparis.com/fr/1234-monogramme'}
                                    <li><a href="https://www.monogramparis.com/fr/1234-monogramme?q=Type+de+produit-Sacs ">Monogrammé</a>
                                        </li>
                                       
                                        {else}
                                    <li><a href="{$va_link.href}" {if isset($va_link.new_window) && $va_link.new_window}target="_blank"{/if}>{$va_link.title}</a>
                                    </li>
                                    {/if}
                                {/if}
                            {/foreach}

                        </ul>
                    {/if}

                {elseif $node.contentType==4}

                    {if isset($node.content.ids)}
                        {if $node.content.view}
                            {include file="module:iqitmegamenu/views/templates/hook/_partials/products_grid.tpl" products=$node.content.ids perline=$node.content.line}
                        {else}
                            {include file="module:iqitmegamenu/views/templates/hook/_partials/products_list.tpl" products=$node.content.ids perline=$node.content.line}
                        {/if}
                    {/if}

                {elseif $node.contentType==5}
                    <ul class="cbp-manufacturers row">
                        {foreach from=$node.content.ids item=manufacturer}
                            {assign var="myfile" value="img/m/{$manufacturer}-small_default.jpg"}
                            {if file_exists($myfile)}
                                <li class="col-xs-{$node.content.line} transition-opacity-300">
                                    <a href="{$link->getmanufacturerLink($manufacturer)}"
                                       title="Manufacturer - {Manufacturer::getNameById($manufacturer)}">
                                        <img src="{$urls.img_manu_url}{$manufacturer}-small_default.jpg"
                                             class="img-fluid logo_manufacturer " {if isset($manufacturerSize)} width="{$manufacturerSize.width}" height="{$manufacturerSize.height}"{/if}
                                             alt="Manufacturer - {Manufacturer::getNameById($manufacturer)}"/>
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {elseif $node.contentType==6}

                    {if isset($node.content.source)}
                        {if isset($node.content.href)}<a href="{$node.content.href}">{/if}
                        <img src="{$node.content.source}" class="img-fluid cbp-banner-image"
                             {if isset($node.content.alt)}alt="{$node.content.alt}"{/if} />
                        {if isset($node.content.href)}</a>{/if}
                    {/if}

                {elseif $node.contentType==7}
                    <ul class="cbp-manufacturers cbp-suppliers row">
                        {foreach from=$node.content.ids item=supplier}
                            {assign var="myfile" value="img/su/{$supplier}-small_default.jpg"}
                            {if file_exists($myfile)}
                                <li class="col-xs-{$node.content.line} transition-opacity-300">
                                    <a href="{$link->getsupplierLink($supplier)}"
                                       title="supplier - {supplier::getNameById($supplier)}">
                                        <img src="{$urls.img_sup_url}{$supplier}-small_default.jpg"
                                             class="img-fluid logo_manufacturer logo_supplier" {if isset($manufacturerSize)} width="{$manufacturerSize.width}" height="{$manufacturerSize.height}"{/if}
                                             alt="supplier - {supplier::getNameById($supplier)}"/>
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}

            {/if}


            {if isset($node.children) && $node.children|@count > 0}
                {foreach from=$node.children item=child name=categoryTreeBranch}
                    {include file="module:iqitmegamenu/views/templates/hook/_partials/submenu_content.tpl" node=$child}
                {/foreach}
            {/if}

            {if $node.type==2}</div>{/if}
    </div>
