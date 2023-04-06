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

{include file='_partials/helpers.tpl'}

<!doctype html>
<html lang="{$language.locale}">

<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

  {block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
  {/block}

  <main class="site_main_content">
    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header">
      {block name='header'}
        {include file='_partials/header.tpl'}
      {/block}
    </header>

    <section id="wrapper">
      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      {hook h="displayWrapperTop"}
      {if $page.page_name != 'index'}
        <div class="container">
        {/if}
        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}

        {block name="left_column"}
          <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
            {if $page.page_name == 'product'}
              {hook h='displayLeftColumnProduct'}
            {else}
              {hook h="displayLeftColumn"}
            {/if}
          </div>
        {/block}

        {block name="content_wrapper"}
          <div id="content-wrapper" class="js-content-wrapper left-column right-column col-sm-4 col-md-6">
            {hook h="displayContentWrapperTop"}
            {block name="content"}
              <p>Hello world! This is HTML5 Boilerplate.</p>
            {/block}
            {hook h="displayContentWrapperBottom"}
          </div>
        {/block}

        {block name="right_column"}
          <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
            {if $page.page_name == 'product'}
              {hook h='displayRightColumnProduct'}
            {else}
              {hook h="displayRightColumn"}
            {/if}
          </div>
        {/block}
        {if $page.page_name != 'index'}
        </div>
      {/if}
      {hook h="displayWrapperBottom"}
      <!-- Description de la catégorie -->
      {if $page.page_name == 'category'}
        <div class="category_desc">
          <div class="container">
            <div class="row">
              <div class="category_desc_cnt align_center">
                {if $category.description}
                <div class="category-description">
                  <p>{$category.description nofilter}</p>
                  
                </div>
                <div style="text-align:center">
                <a style="cursor:pointer" class="show-more-btn" onclick="showMore()">Lire plus...</a>
                </div>
                {/if}
              </div>
            </div>
          </div>
        </div>

        <style>
        .category-description {
          height: 95px;
          overflow: hidden;
        }
      
        .show-more-btn {
          display: block;
          margin-top: 10px;
        }
      </style>
      
      <script>
        function showMore() {
          const desc = document.querySelector('.category-description');
          desc.style.height = 'auto';
          document.querySelector('.show-more-btn').style.display = 'none';
        }
      </script>
      

    {hook h='ouiDisplaySelection'}
      {/if}
    </section>

    <footer id="footer" class="js-footer">
      {block name="footer"}
        {include file="_partials/footer.tpl"}
      {/block}
    </footer>

  </main>

  {block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}

    {* Bug JS detecté erreur $ jquery Alexandre Carette 21/02/2023*}
    {* je transfere ce block source modal du module blocklayered *}
    <script type="text/javascript">
      $(document).ready(function() {
        prestashop.on(
          'updateCart',
          function(event) {}
        );
      });
    </script>
    {*fin*}


    {*   MODIFENPROD   <script type="text/javascript" src="{$urls.js_url}slick.min.js"></script>*}
    {*		  <script type="text/javascript" src="https://cdn.rawgit.com/igorlino/elevatezoom-plus/1.1.6/src/jquery.ez-plus.js"></script>*}
    {*      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>*}
    <script type="text/javascript" src="{$urls.js_url}customselect.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {

        show_facetfilter();
        sliderfacetcolor();

        prestashop.on('updateProductList', function(event) {
          show_facetfilter();
          sliderfacetcolor();
        });
        prestashop.on('updatedProduct', function(event) {
          show_facetfilter();
          sliderfacetcolor();
        });
        prestashop.on('updateProduct', function(event) {
          show_facetfilter();
          sliderfacetcolor();
        });

        var header = $('#header').outerHeight();
        brandtop = $('body#manufacturer #wrapper .brand_top').outerHeight();

        if (brandtop) {
          brandwrapper = header + brandtop;
        } else {
          brandwrapper = header;
        }

        var w = jQuery(window).width();

        if (w < 768) {
          $('body#manufacturer #wrapper').css("padding-top", header + 100);
          $('body#manufacturer #wrapper .brand_top').css("top", header);
          $('#manufacturer .brands_container .brand_search').css("top", header - 20);
        } else {
          $('body#manufacturer #wrapper').css("padding-top", 20 + brandwrapper);
          $('body#manufacturer #wrapper .brand_top').css("top", header);
        }


        $(window).scroll(function() {
          var header = $('#header').outerHeight();
          brandtop = $('body#manufacturer #wrapper .brand_top').outerHeight();

          if (brandtop) {
            brandwrapper = header + brandtop;
          } else {
            brandwrapper = header;
          }

          //TODO
          if ($(this).scrollTop() > header) {
            $('body').addClass('sticky');
            $('body #wrapper').css("padding-top", header);
          } else {
            $('body').removeClass('sticky');
            $('body #wrapper').css('padding-top', '0');
          }

          var w = jQuery(window).width();

          if (w < 768) {
            $('body#manufacturer #wrapper').css("padding-top", header + 100);
            $('body#manufacturer #wrapper .brand_top').css("top", header);
            $('#manufacturer .brands_container .brand_search').css("top", header - 20);
          } else {
            $('body#manufacturer #wrapper').css("padding-top", 20 + brandwrapper);
            $('body#manufacturer #wrapper .brand_top').css("top", header);
          }

          var brandlist = $('body#manufacturer #wrapper .brand_listing').outerHeight();
          $('#manufacturer .brands_container .brand_search').css("min-height", brandlist);
          if ($(this).scrollTop() > brandlist) {
            $('#wrapper .brand_search form').css("position", 'absolute');
            $('#wrapper .brand_search form').css("bottom", '0');
            $('#wrapper .brand_search form').css("max-width", '100%');
          } else {
            $('#wrapper .brand_search form').css("position", 'fixed');
            $('#wrapper .brand_search form').css("bottom", 'auto');
            $('#wrapper .brand_search form').css("max-width", '25%');
          }
        });

        $('.brand_top a').click(function(evt) {
          evt.preventDefault();
          $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top - 20 - brandwrapper }, 500,
            'linear');
        });


        var prodleft = $('#product .product_left').outerHeight();
        prodright = $('#product .product_right').outerHeight();

        if (prodleft > prodright) {
          $('#product .product_right').addClass('stickyposition displayflex');
        } else if (prodright > prodleft) {
          $('#product .product_left').addClass('stickyposition displayflex');
          $('#product .product-container').addClass('displayflex');
        }

        $('#my-account .my_account_menu_title').addClass('active');
        $('#my-account .my_account_menu_cover').slideDown();
        $('#my-account .my_account_main').slideUp();

        $('.my_account_menu_title').click(function() {
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $('.my_account_menu_cover').slideUp();
          } else {
            $(this).addClass('active');
            $('.my_account_menu_cover').slideDown();
            $('.my_account_main').slideUp();
          }
        });

        $('#product .title_elt').click(function() {
          if ($(this).hasClass('active')) {
            $(this).removeClass('active').next('#product .content_elt').slideUp();
          } else {
            $('#product .title_elt').removeClass('active').next('#product .content_elt').slideUp();
            $(this).addClass('active').next('#product .content_elt').slideDown();
          }
        });

        $('#identity #field-password').removeAttr('required');
        $('.my_pswfiled').click(function() {
          $('.page-customer-account').find('.pswfiled').slideToggle();
          if ($('#field-password').attr('required')) {
            $('#field-password').removeAttr('required');
          } else {
            $('#field-password').attr('required', 'required');
          }
        });


        /*var w = jQuery(window).width();
      if(w < 768) {
        $('.product-add-to-cart').insertAfter('.product_leftcover #content');
      }else{
        $('.product-add-to-cart').appendTo('.product_add_to_cart_box');
      }
      jQuery(window).resize(function(){
        var w = jQuery(window).width();
        if(w < 768) {
          $('.product-add-to-cart').insertAfter('.product_leftcover #content');
        }else{
          $('.product-add-to-cart').appendTo('.product_add_to_cart_box');
        }
      });*/


        jQuery(window).resize(function() {
          var header = $('#header').outerHeight();

          brandtop = $('body#manufacturer #wrapper .brand_top').outerHeight();

          if (brandtop) {
            brandwrapper = header + brandtop;
          } else {
            brandwrapper = header;
          }

          var w = jQuery(window).width();

          if (w < 768) {
            $('body#manufacturer #wrapper').css("padding-top", header + 100);
            $('body#manufacturer #wrapper .brand_top').css("top", header);
            $('#manufacturer .brands_container .brand_search').css("top", header - 20);
          } else {
            $('body#manufacturer #wrapper').css("padding-top", 20 + brandwrapper);
            $('body#manufacturer #wrapper .brand_top').css("top", header);
          }


          $(window).scroll(function() {
            if ($(this).scrollTop() > header) {
              $('body #wrapper').css("padding-top", header);
            } else {
              $('body #wrapper').css('padding-top', '0');
            }

            var w = jQuery(window).width();

            if (w < 768) {
              $('body#manufacturer #wrapper').css("padding-top", header + 100);
              $('body#manufacturer #wrapper .brand_top').css("top", header);
              $('#manufacturer .brands_container .brand_search').css("top", header - 20);
            } else {
              $('body#manufacturer #wrapper').css("padding-top", 20 + brandwrapper);
              $('body#manufacturer #wrapper .brand_top').css("top", header);
            }

          });

          $('.brand_top a').click(function(evt) {
            evt.preventDefault();
            $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top - 40 - brandwrapper },
              100, 'linear');
          });

          sliderbrands();
        });

        /*$('.offredeprix .submitoffredeprix').click(function(){
        $('.alert_offredeprix').slideToggle();
        $(this).parent('.offredeprix').slideUp();
      });*/

        $('#askquestion .askbtn').click(function() {
          // $('#header .header-top').slideUp();
          $('.askquestionbox').slideToggle();
        });

        $('.review_yourorder').click(function() {
          $('.order_contentbox').slideToggle();
        });

        /*$('.menumobileicon').click(function(){
        $(this).next('#menusearchcover').slideToggle();
        $('body').addClass('showmobilebox');
      });

      $('#menusearchcover .closebox').click(function(){
        $(this).parents('#menusearchcover').slideToggle();
        $('body').removeClass('showmobilebox');
      });

      $('#menu_on_mobile .cbp-hrmenu .cbp-submenu-aindicator').click(function(){
        $(this).next('.cbp-hrsub').slideToggle();
      });

      $('.cbp-triangle-top').click(function(){
        $(this).parents('.cbp-hrsub').slideUp();
      });

      $('.cbp-triangle-top-back').click(function(){
        $(this).parents('#menusearchcover').slideToggle();
        $(this).parents('.cbp-hrsub').slideUp();
      });*/

        $('#showmenu').click(function() {
          $('.askquestionbox').slideUp();
          // $('#header .header-top').slideToggle();
        });

        $('.clickbtn').click(function() {
          $('.clickbtn').parent('.left_elt').removeClass('active');
          $(this).parent('.left_elt').toggleClass('active');
        });

        $('.offrefield .input_offerprice').on('click', function(e) {
          $(this).parents('.offredeprix').addClass('focus');
        });

        $('body').on('click', function(e) {
          $('body .offredeprix').removeClass('focus');
        });

        $('.offrefield').on('click', function(e) {
          e.stopPropagation();
        });

        function show_facetfilter() {
          $('.facettitle').on('click', function(e) {
            if ($(this).hasClass('active')) {
              $(this).removeClass('active').next('.facetlist').slideUp();
            } else {
              $('.facet .facettitle').removeClass('active').next('.facetlist').slideUp();
              $(this).addClass('active').next('.facetlist').slideToggle();
            }
            e.preventDefault();
          });
          $('#search_filter_toggler, .filter_header .closebox').click(function() {
            $('body').toggleClass('filtermobile');
            $('body').find('.products-selection,#search_filters_wrapper').toggleClass('hidden-sm-down');
          });
          $('#search_filter_controls .ok,.filter_header .closebox').click(function() {
            $('body').removeClass('filtermobile');
            $('body').find('#search_filters_wrapper').addClass('hidden-sm-down');
          });
        }

        /* Animation form fields */
        /*$("form .form-control").val("");
      $("form .form-control").focusout(function(){
        if($(this).val() != ""){
          $(this).addClass("has_value");
        }else{
          $(this).removeClass("has_value");
        }
      })*/

        /* Animation form fields */
        $('.customfield .label_field').click(function() {
          $(this).addClass('effect');
          $(this).parents('.customfield').find('.form-control').focus();
        });
        $('.customfield .form-control').focus(function() {
          $(this).parents('.customfield').find('.label_field').addClass('effect');
        });
        $('.customfield .form-control').blur(function() {
          $(this).parents('.customfield').find('.label_field').removeClass('effect');
        });
        $("form .form-control").focusout(function() {
          if ($(this).val() != "") {
            $(this).parents('.customfield').find('.label_field').addClass('effect2');
          } else {
            $(this).parents('.customfield').find('.label_field').removeClass('effect2');
          }
        })

        $('.faqliste .paneltitle').click(function() {

          var tab_id = $(this).attr('data-tab');

          if ($(this).hasClass('active')) {

          } else {
            $('.faqliste .panel').removeClass('current');
            $('.faqliste .paneltitle').removeClass('active');
            $('.faqliste .panelcontent').slideUp();
            $(this).addClass('active').parent('.panel').addClass('current').find('.panelcontent').slideDown();

            $('.fcnt_right .fcnt_img').slideUp();
            $(".fcnt_right #" + tab_id).slideToggle();
          }

        });

        $('.tabsale_transferts .tabs_links li a').click(function() {

          var tab_id = $(this).attr('href');
          $('.tabsale_transferts .tabs_links li a').removeClass('active');

          $('.tabsale_transferts .tab-pane').removeClass('active');
          $(this).parents('.tabsale_transferts').find(".tab-pane" + tab_id).addClass('active');

        });

        $('.sliderselections').slick({
          infinite: true,
          swipeToSlide: true,
          touchMove: true,
          slidesToShow: 3,
          slidesToScroll: 3,
          responsive: [{
              breakpoint: 1300,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3
              }
            },
            {
              breakpoint: 991,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2
              }
            },
            {
              breakpoint: 575,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1
              }
            }
          ]
        });

        $('.custom_text').slick({
          dots: false,
          arrows: false,
          speed: 500,
          slidesToShow: 3,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 767,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '80px',
                slidesToShow: 2
              }
            },
            {
              breakpoint: 575,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '60px',
                slidesToShow: 1
              }
            }
          ]
        });

        $('.slickslider3').slick({
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 3,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 767,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '100px',
                slidesToShow: 2
              }
            },
            {
              breakpoint: 575,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '60px',
                slidesToShow: 1
              }
            }
          ]
        });

        $('.recents_viewsprod').slick({
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 3,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 767,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '100px',
                slidesToShow: 2
              }
            },
            {
              breakpoint: 575,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '60px',
                slidesToShow: 2
              }
            }
          ]
        });

        $('.shopthelook_slide').slick({
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 3,
          slidesToScroll: 1,
          infinite: false,
          responsive: [{
              breakpoint: 1199,
              settings: {
                slidesToShow: 2
              }
            },
            {
              breakpoint: 767,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '100px',
                arrows: false,
                slidesToShow: 2
              }
            },
            {
              breakpoint: 480,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '60px',
                arrows: false,
                slidesToShow: 2
              }
            }
          ]
        });

        $('.slickslider4').slick({
          centerMode: true,
          infinite: true,
          centerPadding: '100px',
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 3,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 991,
              settings: {
                slidesToShow: 2
              }
            },
            {
              breakpoint: 767,
              settings: {
                centerPadding: '100px',
                arrows: false,
                slidesToShow: 2
              }
            },
            {
              breakpoint: 480,
              settings: {
                centerPadding: '60px',
                arrows: false,
                slidesToShow: 2
              }
            }
          ]
        });

        $('.slickslider5').slick({
          dots: false,
          arrows: true,
          infinite: false,
          speed: 500,
          slidesToShow: 5,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 1199,
              settings: {
                slidesToShow: 5
              }
            },
            {
              breakpoint: 991,
              settings: {
                slidesToShow: 4
              }
            },
            {
              breakpoint: 767,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '100px',
                arrows: false,
                slidesToShow: 2
              }
            },
            {
              breakpoint: 480,
              settings: {
                centerMode: true,
                infinite: true,
                centerPadding: '60px',
                arrows: false,
                slidesToShow: 2
              }
            }
          ]
        });

        $('.slickinstagram').slick({
          centerMode: true,
          infinite: true,
          centerPadding: '80px',
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 4,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 1199,
              settings: {
                slidesToShow: 4
              }
            },
            {
              breakpoint: 767,
              settings: {
                arrows: false,
                centerPadding: '60px',
                slidesToShow: 2
              }
            }
          ]
        });

        /*$('.slicksliderrce').slick({
        dots: false,
        arrows: false,
        infinite: false,
        variableWidth: true,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
          {
            breakpoint: 1199,
            settings: {
              slidesToShow: 4
            }
          },
          {
            breakpoint: 767,
            settings: {
              dots: true,
              variableWidth: false,
              slidesToShow: 3
            }
          },
          {
            breakpoint: 575,
            settings: {
              dots: true,
              variableWidth: false,
              slidesToShow: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              dots: true,
              variableWidth: false,
              slidesToShow: 1
            }
          }
        ]
      });*/


        $('.subcatslider').slick({
          dots: false,
          swipeToSlide: true,
          arrows: true,
          infinite: false,
          speed: 500,
          slidesToShow: 7,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 1199,
              settings: {
                slidesToShow: 6
              }
            },
            {
              breakpoint: 991,
              settings: {
                slidesToShow: 5
              }
            },
            {
              breakpoint: 767,
              settings: {
                slidesToShow: 4
              }
            },
            {
              breakpoint: 680,
              settings: {
                slidesToShow: 3
              }
            },
            {
              breakpoint: 575,
              settings: {
                slidesToShow: 3
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2
              }
            },
            {
              breakpoint: 340,
              settings: {
                slidesToShow: 1
              }
            }
          ]
        });


        function sliderfacetcolor() {
          $('.slidercolor').slick({
            dots: false,
            arrows: true,
            infinite: false,
            speed: 500,
            slidesToShow: 5,
            slidesToScroll: 1,
            variableWidth: true,
            responsive: [{
                breakpoint: 767,
                settings: {
                  centerMode: true,
                  infinite: true,
                  centerPadding: '40px',
                  slidesToShow: 5
                }
              },
              {
                breakpoint: 675,
                settings: {
                  centerMode: true,
                  infinite: true,
                  centerPadding: '30px',
                  slidesToShow: 4
                }
              },
              {
                breakpoint: 575,
                settings: {
                  centerMode: true,
                  infinite: true,
                  centerPadding: '30px',
                  slidesToShow: 3
                }
              }
            ]
          });
        }

        //$('body#checkout section.checkout-step.-current .continue').appendTo('body#checkout .cart_grid_right_cover');


        /*$('#menu_mobile #cbp-hrmenu>ul').slick({
        arrows: false,
        dots: false,
        swipeToSlide: true,
        infinite: false,
        speed: 500,
        slidesToShow: 5,
        slidesToScroll: 1,
        variableWidth: true,
        responsive: [
          {
            breakpoint: 767,
            settings: {
              slidesToShow: 5
            }
          },
          {
            breakpoint: 675,
            settings: {
              slidesToShow: 4
            }
          },
          {
            breakpoint: 575,
            settings: {
              slidesToShow: 3
            }
          }
        ]
      });*/

        $('.list_bestbands').slick({
          centerMode: true,
          infinite: true,
          centerPadding: '100px',
          dots: false,
          arrows: true,
          speed: 500,
          slidesToShow: 4,
          slidesToScroll: 1,
          responsive: [{
              breakpoint: 767,
              settings: {
                slidesToShow: 3,
                centerPadding: '50px',
              }
            },
            {
              breakpoint: 575,
              settings: {
                slidesToShow: 1,
                centerPadding: '30px'
              }
            }
          ]
        });

        $(".formfile input[type=file]").change(function(e) {
          $(this).parents(".uploadFile").find(".filename").text(e.target.files[0].name);
        });

        $('.inputfile').on('change', function() {
          $input = $(this);
          if ($input.val().length > 0) {
            fileReader = new FileReader();
            fileReader.onload = function(data) {
              $input.parents('.custom_fileinput').find('.file_preview').attr('src', data.target.result);
            }
            fileReader.readAsDataURL($input.prop('files')[0]);
          }
        });

        $('.show_subpage').on('click', function() {
          $('body').find('.account_page').slideUp();
          $('body').find('.list_demesdepots').slideUp();
          $('body').find('.account_subpage').slideDown();
        });

        /*$('.sub_page_title').on('click', function() {
        $('body').find('.account_subpage').slideUp();
        $('body').find('.account_page').slideDown();
        $('body').find('.list_demesdepots').slideDown();
      });*/

        $('.boxtab_title').click(function() {
          if ($(this).hasClass('active')) {
            $(this).removeClass('active').next('.boxtab_content').slideUp();
          } else {
            $('.boxtab_title').removeClass('active').next('.boxtab_content').slideUp();
            $(this).addClass('active').next('.boxtab_content').slideToggle();
          }
        });

        $('.add_your_article span').click(function() {
          $('body').find('.contre_proposal_notification,.response_proposition').slideUp();
          $('body').find('.depot_and_response').slideDown();
          $('body').find('.depot_and_response .box_envoiearticle').show();
        });

        $('.response_label').click(function() {
          $(this).toggleClass('active').next('.list_reponse').slideToggle();
        });

        $('.list_reponse li label').click(function() {
          var choix = $(this).find('.option').text();
          $(this).parents('.list_reponse').slideUp();
          $(this).parents('.list_reponse').prev('.response_label').text(choix);
          //$(this).parents('.response_form').find('.prixnetsouhaite').slideDown();
          $(this).parents('.response_form').find('.response_row').slideDown();
        });

        /*$('.depot_control').focus(function() {
        $(this).parents('.response_form').find('.response_row').hide();
        $(this).parents('.response_form').find('.submit_row').show();
      });*/

        $(".depot_control").keyup(function() {
          if ($(this).val() == "") {
            $(this).parents('.response_form').find('.submit_row').show();
            $(this).parents('.response_form').find('.response_row').hide();
          } else {
            $(this).parents('.response_form').find('.submit_row').hide();
            $(this).parents('.response_form').find('.response_row').show();
          }
        })

        $(".button_contre").click(function() {
          $(this).parents('.depot_and_response').prev('.contre_proposal_notification').slideDown();
          $(this).parents('.depot_and_response').slideUp();
        })

        $(".box_envoiearticle .button_contre").click(function() {
          $('body').find('.alertexpedition').slideDown();
          $('body').find('.contre_proposal_notification').hide();
          $('body').find('.depot_and_response').hide();
          setTimeout(function() {
            $('body').find('.merci_expedition').hide();
            $('body').find('.return_expedition').show();
          }, 5000);
          setTimeout(function() {
            $('body').find('.return_expedition').hide();
            $('body').find('.depot_inline').show();
          }, 10000);
          setTimeout(function() {
            $('body').find('.depot_inline').hide();
            $('body').find('.depot_echec').show();
          }, 15000);
        })

        $(".next_step .next").click(function() {
          $('.personnalisation').find('.step').remove('current').hide();
          $(this).parents('.step').next('.step').addClass('current').show();
        })

        $('.brand_top a').click(function() {
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
          } else {
            $('.brand_top a').removeClass('active');
            $(this).addClass('active');
          }
        });

        /*$('#checkout-personal-information-step .nav-item a').click(function() {
          $(this).removeClass('active');
          $('#checkout-personal-information-step .nav-item').show();
          $(this).parent('.nav-item').hide();
      });*/

        /* Gestion formulaire sur mobile*/
        $('.modify_qty').click(function() {
          $('body#checkout .cart-item').removeClass('showqtyfield');
          $('body#checkout .modify_qty').removeClass('active');
          if ($(this).hasClass('active')) {
            $(this).removeClass('active').parents('.cart-item').removeClass('showqtyfield');
          } else {
            $(this).addClass('active').parents('.cart-item').addClass('showqtyfield');
          }
        });

        $('.mono_user_account_mobile .user_tabtitle').click(function() {
          var usermode = $(this).attr('data-tab');
          $('.user_tabtitle').removeClass('active');
          $('.mobiletab_content').removeClass('open');
          if ($(this).hasClass('active')) {
            $(this).parents('.mono_user_account_mobile').find('.mobiletab_content').removeClass('open');
            $(this).removeClass('active');
          } else {
            $(this).parents('.mono_user_account_mobile').find(usermode + '.mobiletab_content').addClass('open');
            $(this).addClass('active');
          }

          if ($('.step_guest').hasClass('active')) {
            $(this).parents('.mono_user_account_mobile').addClass('step_guest_open');
          } else {
            $(this).parents('.mono_user_account_mobile').removeClass('step_guest_open');
          }
        });

        if ($('#checkout-delivery-step,#checkout-payment-step').hasClass('js-current-step')) {
          $('.checkout_btn').removeClass('active');
          $('body#checkout').find('.infos_paiement').addClass('active');
        }

        $('body#checkout .step-edit').click(function() {
          if ($('#checkout-delivery-step,#checkout-payment-step').hasClass('js-current-step')) {
            $('.checkout_btn').removeClass('active');
            $('body#checkout').find('.infos_paiement').addClass('active');
          } else {
            $('.checkout_btn').removeClass('active');
            $('body#checkout').find('.infos_cart').addClass('active');
          }
        });

        $('body#checkout #checkout-delivery-step.-complete').next('.checkout-step').addClass(
          '-current -reachable js-current-step -clickable');

      });
    </script>
  {/block}

  {block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
  {/block}
</body>

</html>