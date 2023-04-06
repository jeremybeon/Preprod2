var _query_ = {
    exec: async function (url, data = null, params = {}) {
        params = {
            ...{
                method: 'GET',
                headers: {
                    "Accept": "application/json, text/javascript, */*; q=0.01",
                    "X-Requested-With": "XMLHttpRequest"
                }
            },
            ...params
        }
        if (data) {
            params = {
                ...params,
                ...{
                    body: data
                }
            }
        }

        const response = await fetch(url, params);
        return response.json();
    },
    get: async function (url, params = {}) {
        return this.exec(url, null, params)
    },
    post: async function (url, data = null, params = {}) {
        params = {
            ...params,
            ...{
                method: "POST"
            }
        }
        return this.exec(url, data, params)
    },
}


var _monograme_ = {
    facetSearch: {
        colors: null,
        color_list: null,
        lists: null,
        listsSlider: null,
        price_slices: [{
            min: 100,
            max: 500,
            value: "100€ à 500€"
        }, {
            min: 500,
            max: 1000,
            value: "500€ à 1000€"
        }, {
            min: 1000,
            max: 2000,
            value: "1000€ à 2000€"
        }, {
            min: 2000,
            max: 3000,
            value: "2000€ à 3000€"
        }, {
            min: 3000,
            max: null,
            value: "3000€ et plus"
        }],
        init: async function (init = true) {
            await this.getLists()
            this.attachEvent()
            if (init) {
                prestashop.on('updateProductList', event => {
                    _monograme_.facetSearch.init(false)
                    setTimeout(() => _monograme_.facetSearch.init(false), 2000)
                    setTimeout(() => _monograme_.facetSearch.init(false), 4000)
                    setTimeout(() => _monograme_.facetSearch.init(false), 6000)
                })
            }
        },
        getLists: async function () {
            if (this.colors == null) {
                let a = await getColors();
                this.colors = a.colors
            }

            this.color_list = document.querySelectorAll('#search_filters .facet_color')
            this.lists = document.querySelectorAll('#search_filters .facetlist:not(.faceted-slider,.labelfacet_color)')
            this.listsSlider = document.querySelector('#search_filters .faceted-slider.facetlist ')

            if (this.color_list && this.colors) {
                this.color_list.forEach(elt => {
                    let k = elt.dataset.filterColor
                    let c = typeof this.colors[k] !== undefined ? this.colors[k] : '';
                    let span = elt.querySelector('.custom-checkbox span')
                    if (span) {
                        span.style.backgroundColor = c
                    }
                })
            }
            return true;
        },
        attachEvent: function () {

            if (this.lists && this.lists.length) {
                this.lists.forEach(ele => {
                    let input = null,
                        li = null;
                    if (ele.querySelector('.filter-list')) {
                        input = ele.querySelector('.filter-list input')
                        li = ele.querySelector('.filter-list')
                    } else {
                        input = document.createElement('input')
                        li = document.createElement('li')

                        li.classList.add('filter-list')
                        li.appendChild(input)
                    }

                    if (input) {
                        if (ele.firstElementChild)
                            ele.insertBefore(li, ele.firstElementChild)

                        input.addEventListener('keyup', ev => {
                            this.filterList(ele, input.value)
                        })
                    }

                })
            }

            if (this.listsSlider) {
                if (!this.listsSlider.querySelector('.wrap-min-max')) {
                    let wrapminmax = document.createElement('li'),
                        wrapmin = document.createElement('div'),
                        min = document.createElement('input'),
                        wrapmax = document.createElement('div'),
                        max = document.createElement('input'),
                        where = document.createElement('li'),
                        selectedValues = JSON.parse(this.listsSlider.dataset['sliderValues']);

                    min.placeholder = "Min"
                    max.placeholder = "Max"

                    // Ajoutez la valeur par défaut souhaitée ici
                    const defaultValue = 1;

                    if (selectedValues && typeof selectedValues[0] !== "undefined") {
                        min.value = selectedValues[0]
                    } else {
                        // Si aucune valeur sélectionnée n'est disponible, utilisez la valeur par défaut
                        min.value = defaultValue;
                    }

                    if (selectedValues && typeof selectedValues[1] !== "undefined") {
                        max.value = selectedValues[1]
                    }

                    const runlink = (event) => {
                        let min_val = parseInt(min.value),
                            max_val = parseInt(max.value);

                        if (event.keyCode == 13 && min_val && max_val) {
                            let url = this.buildPriceLink($(this.listsSlider), min_val, max_val)

                            prestashop.emit(
                                'updateFacets',
                                url,
                            );
                        }
                    }

                    min.addEventListener('keyup', runlink)
                    max.addEventListener('keyup', runlink)

                    wrapmin.appendChild(min)
                    wrapmax.appendChild(max)

                    wrapminmax.appendChild(wrapmin)
                    wrapminmax.appendChild(wrapmax)
                    wrapminmax.classList.add('wrap-min-max')

                    where.classList.add('where-min-max')
                    where.innerText = "OU"
                    this.listsSlider.appendChild(wrapminmax)
                    this.listsSlider.appendChild(where)


                    this.price_slices.forEach(r => {
                        let li = document.createElement('li'),
                            span = document.createElement('span'),
                            input = document.createElement('input'),
                            a = document.createElement('a'),
                            url = this.buildPriceLink($(this.listsSlider), r.min, r.max);

                        span.classList.add('custom-checkbox')
                        input.type = "checkbox"

                        input.setAttribute('data-search-url', url)

                        if (selectedValues &&
                            typeof selectedValues[0] !== "undefined" &&
                            (typeof selectedValues[1] !== "undefined" || !r.max) &&
                            selectedValues[0] == r.min &&
                            ((r.max && selectedValues[1] == r.max) || !r.max)
                        ) {
                            input.checked = true;
                        }

                        span.appendChild(input)
                        li.appendChild(span)
                        li.appendChild(a)
                        a.innerText = r.value
                        a.setAttribute('min', r.min)
                        a.setAttribute('max', r.max)
                        this.listsSlider.appendChild(li)
                    })
                }

            }
        },

        buildPriceLink: function ($el, min, max) {
            const values = $el.data('slider-values');
            const specifications = $el.data('slider-specifications');

            const nextEncodedFacetsURL = $el.data('slider-encoded-url');
            const urlsSplitted = nextEncodedFacetsURL.split('?');
            let queryParams = [];

            if (urlsSplitted.length > 1) {
                queryParams = this.getQueryParameters(urlsSplitted[1]);
            }

            let found = false;
            queryParams.forEach((query) => {
                if (query.name === 'q') {
                    found = true;
                }
            });
            if (!found) {
                queryParams.push({
                    name: 'q',
                    value: ''
                });
            }
            max = !max ? min * 33 : max
            queryParams.forEach((query) => {
                if (query.name === 'q') {
                    // eslint-disable-next-line
                    query.value += [
                        query.value.length > 0 ? '/' : '',
                        $el.data('slider-label'),
                        '-',
                        $el.data('slider-unit'),
                        '-',
                        min,
                        '-',
                        max,
                    ].join('');
                }
            });

            const requestUrl = [
                urlsSplitted[0],
                '?',
                $.param(queryParams),
            ].join('');

            return requestUrl;
        },
        getQueryParameters: (params) => params.split('&').map((str) => {
            const [key, val] = str.split('=');

            return {
                name: key,
                value: decodeURIComponent(val).replace(/\+/g, ' '),
            };
        }),
        /**
         *
         * @param {HTMLUlElement} ele
         * @param {Strin} value
         */
        filterList: function (ele, value) {
            ele.querySelectorAll("li:not(.filter-list)").forEach(li => {
                let text = li.innerText.toLowerCase(),
                    searchText = value.toLowerCase()
                let pos = text.search(searchText)

                if (pos > -1 || searchText == "") {
                    li.style.display = "initial"
                } else {
                    li.style.display = "none"
                }
            })
        }
    },
    manufacturer: {
        search: null,
        items: [],
        links: [],
        init: function () {
            this.search = document.querySelector('#brand-serch')
            this.links = document.querySelectorAll('.brand_top a')
            let items = document.querySelectorAll('.brand_listing .list-group li a')

            items.forEach(elt => {
                let k = elt.innerText.toLowerCase()
                this.items = [...this.items, {
                    'text': k,
                    'elt': elt
                }]
            })

            this.links.forEach(elt => {
                elt.addEventListener('click', event => {
                    event.preventDefault()
                    let a = document.querySelector(elt.getAttribute('href'))

                    if (a)
                        a.scrollIntoView({
                            behavior: "smooth",
                            block: "end",
                            inline: "nearest"
                        });
                })
            })

            if (this.search) {
                this.search.addEventListener('keyup', event => {
                    this.findBrand(this.search.value.toLowerCase())
                })
            }
        },
        findBrand: function (brand) {
            document.querySelectorAll('.brand_listing .brand_group_byletter').forEach(parent => {
                let found = false,
                    items = parent.querySelectorAll('.list-group li a');
                items.forEach(a => {
                    brand = brand.normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                    let text = a.innerText.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                    let post = text.indexOf(brand)
                    if (post > -1) {
                        found = true
                    }
                })
                if (found) {
                    parent.style.display = "initial"
                } else {
                    parent.style.display = "none"
                }
            })
        }
    },
    wishlist: {
        my_wl: null,
        wl_count: null,
        init: function (clone_button = true) {

            if (this.my_wl == null) {
                this.my_wl = document.querySelector(".monogram_wishlist a")
                this.initMyWl()
            }
            if (clone_button) {
                document.querySelectorAll('.wishlist-button-add:not(.cloned,.is_clone)').forEach(item => {
                    let clone = item.cloneNode(true)
                    item.parentElement.insertBefore(clone, item)
                    item.style.display = "none"
                    item.classList.add('cloned')
                    clone.classList.add('is_clone')
                    clone.addEventListener('click', event => {
                        event.preventDefault()
                        this.addToWishList(clone)
                    })
                })
            }

        },
        initMyWl: function () {
            let span = document.createElement('span')
            span.classList.add('wishlist_count')
            let value = this.getTotalProductInWl()
            span.innerText = value
            this.wl_count = span
            this.my_wl.appendChild(this.wl_count)
        },
        updateMyWl: function () {
            this.wl_count.innerText = this.getTotalProductInWl()
        },
        getTotalProductInWl: () => productsAlreadyTagged.reduce((cm, a) => cm + parseInt(a.quantity), 0),
        addToWishList: async function (item) {
            if (
                typeof wishlistAddProductToCartUrl !== 'undefined' &&
                typeof customerWishlist !== 'undefined'
            ) {
                let d = {
                        'params[quantity]': 0,
                        'params[idWishList]': customerWishlist.id_wishlist,
                        'action': "addProductToWishlist",
                    },
                    idProduct = 0,
                    idProductAttribute = 0
                if (prestashop.page.page_name == "product") {
                    let product = document.querySelector('#product_page_product_id'),
                        productAttribute = document.querySelector('#product_page_product_attribute_id')
                    idProduct = product ? product.value : 0;
                    idProductAttribute = productAttribute ? productAttribute.value : 0;

                } else {
                    let data = $(item).parents('.product-miniature').data()
                    idProduct = data.idProduct ? data.idProduct : 0;
                    idProductAttribute = data.idProductAttribute ? data.idProductAttribute : 0;
                }

                d = {
                    ...d,
                    'params[id_product]': idProduct,
                    'params[id_product_attribute]': idProductAttribute,
                };

                if (item.innerText == 'favorite') {
                    d = {
                        ...d,
                        action: 'deleteProductFromWishlist'
                    }
                }

                let a = await _query_.post(wishlistAddProductToCartUrl, new URLSearchParams(d))

                if (a.success) {
                    if (item.innerText == 'favorite') {
                        item.querySelector('i').innerText = 'favorite_border'
                        this.removeProductTagged(idProduct, idProductAttribute)
                    } else {
                        item.querySelector('i').innerText = 'favorite'
                        this.addProductTagged({
                            id_product: idProduct,
                            id_product_attribute: idProductAttribute,
                            quantity: "1",
                            id_wishlist: customerWishlist.id_wishlist,
                        })
                    }
                    this.updateMyWl()
                    this.createTost({
                        type: "success",
                        text: a.message
                    })
                } else {
                    item.querySelector('i').innerText = 'favorite_border'
                    this.createTost({
                        type: "error",
                        text: a.message
                    })
                }
            }
        },
        /**
         *
         * @param {{type: "error|success", text: string}} data
         */
        createTost: function (data) {
            let toast = document.createElement('div'),
                toast_text = document.createElement('p')

            toast.classList.add('wishlist-toast')
            toast.classList.add(data.type)
            toast.style.zIndex = "1000000";
            toast_text.classList.add('wishlist-toast-text')
            toast_text.innerText = data.text
            toast.appendChild(toast_text)

            document.body.appendChild(toast)
            toast.classList.add('isActive')
            setTimeout(() => toast.classList.remove('isActive'), 5000)
            setTimeout(() => toast.remove(), 7000)
        },
        /**
         *
         * @param {{id_product: string, id_product_attribute: string, id_wishlist: string, quantity: string}} data
         */
        addProductTagged: function (data) {
            let exist_product = productsAlreadyTagged.find(a => (a.id_product == data.id_product && a.id_product_attribute == data.id_product_attribute))

            if (exist_product) {
                let qty = parseInt(exist_product.quantity) + parseInt(data.quantity)
                productsAlreadyTagged.map(a => {
                    if (a.id_product == data.id_product && a.id_product_attribute == data.id_product_attribute) {
                        a.quantity = String(qty)
                    }
                    return a;
                })
            } else {
                productsAlreadyTagged = [...productsAlreadyTagged, data]
            }

        },
        removeProductTagged: function (id_product, id_product_attribute) {
            productsAlreadyTagged = productsAlreadyTagged.filter(a => !(a.id_product == id_product && a.id_product_attribute == id_product_attribute))
        }
    }
}

const replaceProductListClass = () => {
    let products = document.querySelectorAll('.products .js-product');

    if (products.length == 0) {
        let ps = document.querySelectorAll('#js-product-list .products > div');
        ps.forEach(p => {
            p.classList.add('product_item', 'js-product', 'product', 'col-xs-6', 'col-xl-3');
        })
        products = document.querySelectorAll('.products .js-product')
    }

    let next_right = 7,
        next_left;

    products.forEach((product, index) => {
        next_left = next_right + 5
        if (next_right == (index + 1)) {
            product.classList.remove('col-xl-3');
            product.classList.add('pdl_large');
        } else if (next_left == (index + 1)) {
            product.classList.remove('col-xl-3');
            product.classList.add('pdl_large');
            next_right += 14
        }
    })
}
var productsWishlist = null;
var product_title_wishlist = [];

const getColors = async () => {
    return await _query_.get(get_colors_link)
}

const getProductWishlists = async (titles) => {
    let d = {}
    for (let i = 0; i < titles.length; i++) {
        d['titles[' + i + ']'] = titles[i]
    }
    params = new URLSearchParams(d)
    return await _query_.post(get_wishlist_product_link, params)
}

window.addEventListener('DOMContentLoaded', (event) => {

    _monograme_.facetSearch.init()
    if (prestashop.page.page_name == "manufacturer") {
        _monograme_.manufacturer.init()
    }
    let clone_add_wislist = prestashop.page.page_name != "view"
    _monograme_.wishlist.init(clone_add_wislist)
    setTimeout(() => {
        _monograme_.wishlist.init(clone_add_wislist)
    }, 2000)

    // prestashop.on('updateProductList', event => {
    //     //console.log(event, 'send replaceProductListClass()')
    //     replaceProductListClass();
    //     $('button.add-to-cart').removeAttr('disabled');
    // }

    //         } else {
    //             _monograme_.wishlist.createTost({type: "error", text: "Cette alerte existe déjà dans votre compte"})
    //         }
    //     }
    //
    //     if (urlParams.has('ask_infos')) {
    //         if (urlParams.has('success')) {
    //             _monograme_.wishlist.createTost({type: "success", text: "Votre demande à été envoyée"})
    //         } else {
    //             _monograme_.wishlist.createTost({type: "error", text: "Erreur lors de l'envoie de votre demande"})
    //         }
    //     }
    // }

    const config = {
        attributes: true,
        childList: true,
        subtree: true
    };
    const callbackNode = function (mutationlist) {
        for (var mutation of mutationlist) {
            //console.log(mutation.type, 'mutation')
            if (mutation.type == "childList") {
                addProductSelled()
            } else if (mutation.type == "attributes") {
                //console.log("l'attribut "+mutation.attributeName+" a été modifié")
            }
        }
    }

    const addProductSelled = async function () {
        document.querySelectorAll('.wishlist-products-list .wishlist-products-item:not(.js-verified)').forEach(item => {
            let right = item.querySelector('.wishlist-product-right'),
                button = item.querySelector('.wishlist-product-addtocart'),
                price = item.querySelector('.wishlist-product-price'),
                buttonContainer = item.querySelector('.wishlist-product-bottom'),
                title = item.querySelector('.wishlist-product-title');

            /*if(title){
                title.setAttribute('data-title', title.innerText)
                product_title_wishlist.push(title.innerText)
                let ctext = title.innerText;
                let sizeWant = 27;
                if(ctext.length > sizeWant) {
                    let artext = ctext.split(''), newtext = ""

                    for(let a of artext) {
                        if(newtext.length == sizeWant){
                            break;
                        }
                        newtext += a
                    }

                    newtext = newtext.trim() + '...';
                    title.innerText = newtext
                }
            }*/

            if (right && button && button.disabled) {
                /*let p = document.createElement('p')
                p.classList.add('vendu')
                p.innerHTML = `<span>Vendu</span>`;
                right.insertBefore(p, price)*/

                /*let createAlert = document.createElement('a')
                createAlert.classList.add('btn')
                createAlert.classList.add('btn-primary')
                createAlert.href = create_alert_link
                createAlert.innerText = 'Créer une alerte';
                buttonContainer.insertBefore(createAlert, button)
                button.style.display = 'none'*/
            }

            item.classList.add('js-verified')
        })

        /*if(product_title_wishlist.length > 0 && !productsWishlist){
            productsWishlist = true
            productsWishlist = await getProductWishlists(product_title_wishlist);
            console.log(productsWishlist)
        }*/
    }

    if (prestashop.page.page_name == "view") {
        let targetNode = document.querySelector('.wishlist-products-container')
        let observer = new MutationObserver(callbackNode)
        observer.observe(targetNode, config)

        setTimeout(() => addProductSelled(), 1000)
        setTimeout(() => addProductSelled(), 5000)
        setTimeout(() => addProductSelled(), 10000)
        setTimeout(() => addProductSelled(), 20000)
    }


});

$(window).on('load', function () {
    $.ready.then(function () {
        $('input:-webkit-autofill').each(function () {
            $(this).parents('.customfield').find('.label_field').addClass('effect2 effect');
        });
    });

    // contact form modal notification
    if ($('#contactFormNotif').length > 0) {
        $('#nousecrire').modal();
    }
});


function setGooglePlace(prefix) {
    var autocomplete = new google.maps.places.Autocomplete(
        (document.getElementById(prefix + '-address1')), {
            types: ['geocode']
        }
    );
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        // get the data from google
        var place = autocomplete.getPlace();

        var components = {};
        jQuery.each(place.address_components, function (k, v1) {
            jQuery.each(v1.types, function (k2, v2) {
                components[v2] = v1.long_name
            });
        });

        var list = {
            'locality': 'city',
            'route': 'route',
            'street_number': 'street_number',
            'country': 'id_country',
            'postal_code': 'postcode'
        };
        jQuery.each(list, function (key, fieldName) {
            var value = typeof components[key] !== 'undefined' ? components[key] : '';
            jQuery('#' + prefix + '-' + fieldName).val(value);
            customPlaceHolder();
        });

        //jQuery("#lat").val(place.geometry.location.lat());
        //jQuery("#lng").val(place.geometry.location.lng());

        // populate the fields
        // pretty address for the user
        var fullAddressStr = '';
        if (typeof components.locality !== 'undefined' && typeof components.route !== 'undefined' && typeof components.street_number !== 'undefined' && typeof components.country !== 'undefined') {
            fullAddressStr = components.street_number + ', ' + components.route + ' ' + components.locality + ', ' + components.country;
        } else if (typeof components.locality !== 'undefined' && typeof components.route !== 'undefined' && typeof components.street_number !== 'undefined') {
            fullAddressStr = components.street_number + ', ' + components.route + ' ' + components.locality;
        } else if (typeof components.locality !== 'undefined' && typeof components.route !== 'undefined') {
            fullAddressStr = components.route + ', ' + components.locality;
        } else if (typeof components.locality !== 'undefined') {
            fullAddressStr = components.locality;
        }
        jQuery('#' + prefix + '-address1').val(fullAddressStr);
    });
    $('#' + prefix + '-address1').removeAttr('placeholder');
}

function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};

function manageLogin() {
    if ($('#persoMobileInfo.has_err_0').length > 0) {
        $('#persoMobileInfoCust #login-form .form-group.password').hide();
        $('#persoMobileInfoCust #login-form .forgot-password').hide();
        $('#persoMobileInfoCust #login-form button.continue').addClass('disabled').attr('disabled', 'disabled');
    }

    $('#persoMobileInfoCust #reg2-email, #persoMobileInfoCust #field-email').on('keyup', function () {
        var email = $(this).val();
        if (isEmail(email)) { // Email valide
            $.ajax({
                dataType: 'json',
                method: "POST",
                url: prestashop.urls.pages.product,
                data: {
                    email: email,
                    ajax: 1,
                    action: 'getCustomerByEmail'
                }
            }).done(function (msg) {
                if (msg > 0) { // login
                    $('#persoMobileInfoCust .login_tab').click();
                    $('#persoMobileInfoCust #field-email').val(email);
                    $('#persoMobileInfoCust #login-form .form-group.password').show();
                    $('#persoMobileInfoCust #login-form .forgot-password, #persoMobileInfoCust .login_tab').show();
                    $('#persoMobileInfoCust .separator, #persoMobileInfoCust .register_tab').hide();
                    $('#persoMobileInfoCust #login-form button.continue').removeClass('disabled').removeAttr('disabled');
                } else { // Inscription
                    $('#persoMobileInfoCust #reg2-email').val(email);
                    $('#persoMobileInfoCust #login-form .form-group.password').hide();
                    $('#persoMobileInfoCust #login-form .forgot-password').hide();
                    $('#persoMobileInfoCust .register_tab').click();
                    $('#persoMobileInfoCust .register_tab').show();
                    $('#persoMobileInfoCust .separator, #persoMobileInfoCust .login_tab').hide();
                    $('#persoMobileInfoCust #login-form button.continue').addClass('disabled').attr('disabled', 'disabled');
                    customPlaceHolder();
                }
            }).fail(function (jqXHR, textStatus) {
                //$('#persoMobileInfoCust #login-form .form-group.password').hide();
            }).always(function () {
                //$('#persoMobileInfoCust #login-form .form-group.password').hide();
            });
        } else {
            $('#persoMobileInfoCust #login-form .form-group.password').hide();
            $('#persoMobileInfoCust #login-form .forgot-password').hide();
            $('#persoMobileInfoCust #login-form button.continue').addClass('disabled').attr('disabled', 'disabled');
        }
    });
}

$(document).ready(function () {
    if ($('#reg1-address1').length > 0) {
        setGooglePlace('guest');
        setGooglePlace('reg1');
        setGooglePlace('reg2');
        customPlaceHolder();
    }

    if ($('#persoMobileInfoCust').length > 0) {
        manageLogin();
    }

    // $('#checkout-payment-step .ps-shown-by-js:checked').parents('.payment_option').addClass('checked_option');
    // $('#checkout-payment-step .payment-options .ps-shown-by-js').on('click', function () {
    //     $('.payment_option').removeClass('checked_option');
    //     $(this).parents('.payment_option').addClass('checked_option');
    // });


    $('.hidden-sm-down.custom-radio #payment-option-1, .hidden-md-up.custom-radio #payment-option-1').prop('checked', true).parents('.payment_option').addClass('checked_option');
    $('#checkout-payment-step .payment-options .ps-shown-by-js').on('click', function () {
        $('.payment_option').removeClass('checked_option');
        $(this).parents('.payment_option').addClass('checked_option');
    });


    $('#checkout-delivery-step .delivery-option input:checked').parents('.delivery-option').addClass('checked_option');
    $('#checkout-delivery-step .delivery-option input').on('click', function () {
        $('.delivery-option').removeClass('checked_option');
        $(this).parents('.delivery-option').addClass('checked_option');
    });

    /*if ($('body#product').length > 0) {
        $('#zoomimg').ezPlus({
            zoomType: 'lens',
            lensShape: 'round',
            lensSize: 280,
            gallery: 'demogallery',
            cursor: 'pointer',
            galleryActiveClass: 'active'
        });
    }*/

    // document.addEventListener('touchmove', function (event) {
    // 	if (event.scale !== 1) { event.preventDefault(); }
    // }, { passive: false });

    // add to cart after loading page

    // Alexandre Carette pb de bouton disable ajout au panier sur mobile
    /*$('button.add-to-cart').attr('disabled', 'disabled');
    document.onreadystatechange = function () {
        if (document.readyState !== "complete") {
            $('button.add-to-cart').attr('disabled', 'disabled');
        } else {
            $('button.add-to-cart').removeAttr('disabled');
        }
    };

    document.addEventListener("DOMContentLoaded", () => {
        $('button.add-to-cart').removeAttr('disabled');
    });*/

    //end

    window.onload = function () {
        $('button.add-to-cart').removeAttr('disabled');
        /*if(getUrlParameter('modalCart') == 1){
            $('.get_modal_cart').click();
        }*/
    };

    $(window).load(function () {
        $('button.add-to-cart').removeAttr('disabled');
        if (getUrlParameter('modalCart') == 1) {
            $('.get_modal_cart').click();
        }
    });

    // touchSpin on quantity modal
    prestashop.on('updatedCart', () => {
        setTimeout(() => {
            if ($('.button_qty.box_onmobile').length) {
                $('.js-cart-line-product-quantity').TouchSpin({
                    verticalbuttons: true,
                    buttondown_class: "btn btn-touchspin js-touchspin js-increase-product-quantity",
                    buttonup_class: "btn btn-touchspin js-touchspin js-decrease-product-quantity"
                });
                //$('.js-cart-line-product-quantity').val(1);
                //$('.js-cart-line-product-quantity').change();
            }
        }, 500)
    });

    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        setTimeout(function () {
            $('button.add-to-cart').removeAttr('disabled');
        }, 3000);
    }

    $("#mobile_top_menu_wrapper a, #menu_mobile a").on('tap', function () {
        window.location.href = $(this).attr('href');
    });
    $("#mobile_top_menu_wrapper a, #menu_mobile a").on('click', function () {
        window.location.href = $(this).attr('href');
    });


    if ($('#manufacturer').length) {
        sliderbrands();
    }

    /*$("#menu_mobile a").swipe({
        tap: function(event, target) { alert(3);
            window.location.href = $(this).attr('href');
        },
        swipe:function(event, direction, distance, duration, fingerCount){
            alert(4);
            event.preventDefault();
        }
    });*/

    $('#mobile_top_menu_wrapper a').on('touchstart', function (e) {
        //window.location.href = $(this).attr('href');
    });

    /* Gestion demande produit */
    $('.product_ask_elt').click(function () {
        var dataid = $(this).attr('data-id');
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        } else {
            $('.product_ask_elt').removeClass('active');
            $(this).addClass('active');
            $(".demandeinfos_body button.close span").removeClass('active');
            $(".demandeinfos_body").find(" button.close span#" + dataid).addClass('active');
        }

        $("#ask_mode").val($(".demandeinfos_body .demande_title.active").text());
    });

    $('.moyen_cov').click(function () {
        var id = $(this).parent().attr('data-id');

        $('#ask_type').val($(this).data('type'));

        $(".demandeinfos_body .moyen_cov").removeClass('active');
        $(this).addClass('active');
        $(".demandeinfos_body").find(".form-group").hide();
        $(".demandeinfos_body").find(".form-group#" + id).show();
    });

    $('#submitAskPdInfos').click(function (event) {

        var type = $('#ask_type').val();
        var phone = $('#ask_phone').val();
        var email = $('#ask_email').val();

        if (type != '') {
            if (type == 'email') {
                if (email == '' || !isEmail(email)) {
                    alert('Veuillez renseigner une adresse email valide');
                } else {
                    return true;
                }
            } else if (phone == '') {
                alert('Veuillez renseigner un numéro de téléphone  valide');
            } else {
                return true;
            }
        }
        return false;
    });


    /**
     * Gestion des input
     */
    customPlaceHolder();

    // gestion page contact
    contactFormControl();
    $('#contact .form-control').keyup(function () {
        contactFormControl();
    });
    $('#contact .form-control').change(function () {
        contactFormControl();
    });

    // identity
    if ($('#identity').length) {
        $('input[name="customer_privacy"], input[name="psgdpr"]').prop("checked", true).attr('disabled', 'disabled').attr('readonly', 'readonly');
    }

    if ($('#checkout').length) {
        $('.user_logged_1 input[name="customer_privacy"], .user_logged_1 input[name="psgdpr"]').prop("checked", true).attr('disabled', 'disabled').attr('readonly', 'readonly');
    }

    // supprimer cela pour le guest
    $('#checkout-guest-form input[name="customer_privacy"], #checkout-guest-form input[name="psgdpr"]').removeAttr('disabled').removeAttr('readonly').removeAttr('required');
    $('#checkout-guest-form input[name="customer_privacy"], #checkout-guest-form input[name="psgdpr"]').prop("checked", true).attr('checked', true);;
    $('#checkout-guest-form .form-group.customer_privacy, #checkout-guest-form .form-group.psgdpr').hide();

    /* Slide reassurance */
    $('.slicksliderrce').slick({
        dots: false,
        arrows: false,
        infinite: false,
        variableWidth: true,
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
    });

    /* Slide menu on mobile*/
    $('#menu_mobile #cbp-hrmenu>ul').slick({
        arrows: false,
        dots: false,
        swipeToSlide: true,
        infinite: false,
        speed: 500,
        slidesToShow: 5,
        slidesToScroll: 1,
        variableWidth: true,
        responsive: [{
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
    });

    $('.menumobileicon').click(function () {
        $(this).next('#menusearchcover').slideToggle();
        $('body').addClass('showmobilebox');

        $('#nosselections .sliderselections').get(0).slick.setPosition();

    });

    $('#menusearchcover .closebox').click(function () {
        $(this).parents('#menusearchcover').slideToggle();
        $('body').removeClass('showmobilebox');
    });

    $('#menu_on_mobile .cbp-hrmenu .cbp-submenu-aindicator').click(function () {
        $(this).next('.cbp-hrsub').slideToggle();
    });

    $('.cbp-triangle-top').click(function () {
        $(this).parents('.cbp-hrsub').slideUp();
    });

    $('.cbp-triangle-top-back').click(function () {
        $(this).parents('#menusearchcover').slideToggle();
        $(this).parents('.cbp-hrsub').slideUp();
    });

    /* scroll menu on mobile */
    var salemobile = $('#menusearchcover .salemobile').outerHeight();
    $('#menusearchcover').css("padding-bottom", salemobile);

    $(window).resize(function () {
        var salemobile = $('#menusearchcover .salemobile').outerHeight();
        $('#menusearchcover').css("padding-bottom", salemobile);
    });
});

function customPlaceHolder() {
    if ($('.form-control').length > 0) {
        $('.form-control').each(function () {
            if ($(this).val() != "") { //$(this).val().length > 0 ||
                $(this).parents('.customfield').find('.label_field').addClass('effect2 effect');
            }
        });

        $("form .form-control").focusout(function () {
            if ($(this).val() != "") {
                $(this).parents('.customfield').find('.label_field').addClass('effect2');
            } else {
                $(this).parents('.customfield').find('.label_field').removeClass('effect2');
            }
        });

        /*$("form .form-control").focusout(function () {
            if ($(this).val() != "") {
                $(this).parents('.customfield').find('.label_field').addClass('effect2');
            } else {
                $(this).parents('.customfield').find('.label_field').removeClass('effect2');
            }
        });*/

        $('.customfield .label_field').click(function () {
            $(this).addClass('effect');
            $(this).parents('.customfield').find('.form-control').focus();
        });

        $('.customfield .form-control').focus(function () {
            $(this).parents('.customfield').find('.label_field').addClass('effect');
        });
        $('.customfield .form-control').blur(function () {
            $(this).parents('.customfield').find('.label_field').removeClass('effect');
        });
    }
}

function isEmail(email) {
    var EmailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return EmailRegex.test(email);
}

function contactFormControl() {
    if ($('#contact .form-control').length > 0) {
        var err = false;
        $('#contact .form-control').each(function () {
            if ($(this).val().length = 0 || $(this).val() == "") {
                err = true;
            }
        });

        if (err) {
            $("#submitMessage").attr('disabled', 'disabled');
        } else {
            $("#submitMessage").removeAttr('disabled');
        }
    }
}

function sliderbrands() {
    $('.sliderbrands').slick({
        draggable: true,
        variableWidth: true,
        arrows: false,
        dots: false,
        infinite: false,
        slidesToScroll: 5,
        responsive: [{
                breakpoint: 767,
                settings: {
                    slidesToShow: 20
                }
            },
            {
                breakpoint: 680,
                settings: {
                    slidesToShow: 15
                }
            },
            {
                breakpoint: 575,
                settings: {
                    slidesToShow: 10
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 5
                }
            }
        ]
    });

}

$('#demogallery').slick({
    infinite: false,
    dots: false,
    arrows: true,
    speed: 500,
    slidesToShow: 6,
    slidesToScroll: 6,
    prevArrow: '<button class="material-icons left slick-arrow slick-prev">Next</button>',
    nextArrow: '<button class="material-icons right slick-arrow slick-next">Next</button>',
    responsive: [{
            breakpoint: 1199,
            settings: {
                slidesToShow: 5,
                slidesToScroll: 5,
            }
        },
        {
            breakpoint: 991,
            settings: {
                slidesToShow: 4,
                slidesToScroll: 4
            }
        },
        {
            breakpoint: 860,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },
        {
            breakpoint: 767,
            settings: {
                slidesToShow: 6,
                slidesToScroll: 6
            }
        },
        {
            breakpoint: 680,
            settings: {
                slidesToShow: 5,
                slidesToScroll: 5
            }
        },
        {
            breakpoint: 575,
            settings: {
                slidesToShow: 4,
                slidesToScroll: 4
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },
        {
            breakpoint: 320,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        }
    ]
});


// test pop up jerem //
$(document).ready(function(){
    function showPopup() {
        // Vérifier si le formulaire a déjà été soumis
        if (localStorage.getItem('formSubmitted')) {
            return;
        }

        // Créer la div de la pop-up
        const popup = document.createElement('div');
        popup.id = 'popup';
        popup.style.position = 'fixed';
        popup.style.bottom = '20px';
        popup.style.right = '20px';
        popup.style.backgroundColor = '#ffffff';
        popup.style.borderRadius = '3px';
        popup.style.border = '1px solid #ffffff';
        popup.style.maxWidth = '540px';
        popup.style.textAlign = 'right';
        popup.style.padding = '20px';

        // Ajouter le contenu de la pop-up
        let test = document.getElementsByClassName('sib-form');
        popup.innerHTML = test[0].innerHTML

        // Ajouter la pop-up au corps de la page
        document.body.appendChild(popup);

        // Définir le délai d'affichage de la pop-up
        const delay = 5000;

        // Masquer la pop-up lorsqu'elle est fermée
        const closePopup = () => {
            localStorage.setItem('formSubmitted', 'true');
            popup.remove();
        };

        // Fermer la pop-up lorsqu'on clique en dehors
        document.addEventListener('click', (event) => {
            if (!popup.contains(event.target)) {
                closePopup();
            }
        });

        // Fermer la pop-up après un délai
        setTimeout(closePopup, delay);
    }

// Appeler la fonction showPopup après 5 secondes
    setTimeout(showPopup, 5000);
})
