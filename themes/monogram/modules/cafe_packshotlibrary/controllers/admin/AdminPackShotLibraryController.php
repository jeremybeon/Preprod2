<?php

class AdminPackShotLibraryController extends ModuleAdminController
{
    public function __construct()
    {
        $this->bootstrap = true;
        $this->table = 'product';
        $this->className = 'Product';
        $this->deleted = false;
        $this->list_no_link = true;
        $this->addRowAction('view');
        $this->context = Context::getContext();
        $this->required_database = false;
        $this->allow_export = true;
        $this->_use_found_rows = true;
        $this->_orderBy = 'id_product';
        $this->_orderWay = 'DESC';

        $this->_select = ''; // Initialisez _select avant de l'utiliser

        // Jointure avec la table product_lang

        $this->_join .= 'LEFT JOIN `'._DB_PREFIX_.'product_lang` pl ON (a.`id_product` = pl.`id_product` AND pl.`id_lang` = '.(int)$this->context->language->id.')';
        $this->_select .= 'pl.`name`, '; // Ajoutez une virgule pour séparer les champs sélectionnés

        // Jointure avec la table image pour l'image de couverture
        $this->_join .= 'LEFT JOIN `'._DB_PREFIX_.'image` i ON (a.`id_product` = i.`id_product` AND i.`cover` = 1)';
        $this->_select .= 'i.`id_image`, ';

            // Jointure avec la table feature et feature_value pour la caractéristique du modèle
        $feature_id = 1; // Remplacez par l'ID de la caractéristique de modèle que vous souhaitez afficher
        $this->_join .= 'LEFT JOIN `'._DB_PREFIX_.'feature_product` fp ON (a.`id_product` = fp.`id_product` AND fp.`id_feature` = '.(int)$feature_id.') ';
        $this->_join .= 'LEFT JOIN `'._DB_PREFIX_.'feature_value_lang` fvl ON (fp.`id_feature_value` = fvl.`id_feature_value` AND fvl.`id_lang` = '.(int)$this->context->language->id.')';
        $this->_select .= 'fvl.`value` AS model, ';

        // Jointure avec la table manufacturer pour la marque
        $this->_join .= 'LEFT JOIN `'._DB_PREFIX_.'manufacturer` m ON (a.`id_manufacturer` = m.`id_manufacturer`)';
        $this->_select .= 'm.`name` AS manufacturer_name';

       // $this->_where .= 'AND a.active =1 ';

        $this->fields_list = array(
         'id_product' => array('title' => 'ID', 'search' => true, 'class' => 'fixed-width-md'),
         'id_image' => array('title' => 'Image', 'search' => false, 'image_id' => 'id_image', 'class' => 'fixed-width-md modal-action-enable','callback' => 'displayModal'),
         'name' => array('title' => 'Nom du produit', 'search' => true, 'class' => 'fixed-width-md'),
         'reference' => array('title' => 'Ref', 'search' => true, 'class' => 'fixed-width-md'),
         'manufacturer_name' => array('title' => 'Marque', 'search' => true, 'class' => 'fixed-width-md'),
         'model' => array('title' => 'Modèle', 'search' => true, 'class' => 'fixed-width-md'),
        );


        parent::__construct();
    }

    public function initContent()
    {
        parent::initContent();
    }

    public function initToolbarTitle()
    {
        parent::initToolbarTitle();
    }

    public function initPageHeaderToolbar()
    {
        parent::initPageHeaderToolbar();
    }

    public function displayModal($value, $item)
    {
        // Récupérer l'image à partir de son ID
    $image = new Image($value);
$product = new Product($item['id_product'],1,1);
    // Récupérer le lien vers l'image en taille maximale
    $image_url = $this->context->link->getImageLink(
        $product->link_rewrite, 
        $image->id, 
        ImageType::getFormattedName('large')
    );

    $image_url_small = $this->context->link->getImageLink(
        $product->link_rewrite, 
        $image->id, 
        ImageType::getFormattedName('small')
    );

        $modalId = 'imageModal' . $item['id_product'];
        $modalHtml = '
        <div id="' . $modalId . '" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img src="' . $image_url . '" class="img-responsive">
                    </div>
                </div>
            </div>
        </div>';

        return '<img src="' . $image_url_small . '" style="cursor:pointer;" class="img-responsive modal-action-enable" data-toggle="modal" data-target="#' . $modalId . '" data-large-image="' . $image_url . '">' . $modalHtml;
    }
}
