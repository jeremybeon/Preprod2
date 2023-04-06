<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class cafe_packshotlibrary extends Module
{
    public function __construct()
    {
        $this->name = 'cafe_packshotlibrary';
        $this->tab = 'others';
        $this->version = '1.0.0';
        $this->author = 'Alexandre Carette';
        $this->need_instance = 0;
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('cafe_packshotlibrary');
        $this->description = $this->l('Bibliothèque gestion des photos packshot');
        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        if (!parent::install()

        || !$this->registerHook([
            'displayBackOfficeHeader',
            //'additionalCustomerFormFields',
        ])
        //|| !CustomerModifier::installSql()
        || !$this->installTab()
        ) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        if (
            !parent::uninstall()
            //|| !CustomerModifier::uninstallSql()
            || !$this->uninstallTab()
        ) {
            return false;
        }
        return true;
    }

    public function installTab()
    {
        // Création du premier onglet (PHOTOS)
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = 'AdminPackShotLibrary';
        $tab->name = array();

        foreach (Language::getLanguages(true) as $lang) {
            $tab->name[$lang['id_lang']] = 'PHOTOS';
        }

        $tab->id_parent = 0; // Ici, vous définissez le menu principal
        $tab->module = $this->name;
        $tab->add();

        // Création du second onglet (Bibliothèque Packshot)
        $tab2 = new Tab();
        $tab2->active = 1;
        $tab2->class_name = 'AdminPackShotLibrary';
        $tab2->name = array();

        foreach (Language::getLanguages(true) as $lang) {
            $tab2->name[$lang['id_lang']] = 'Bibliothèque Packshot';
        }

        $tab2->id_parent = (int)Tab::getIdFromClassName('AdminPackShotLibrary');
        $tab2->module = $this->name;
        return $tab2->add();
    }
    public function uninstallTab()
    {
        $id_tab = (int)Tab::getIdFromClassName('AdminPackShotLibrary');
        if ($id_tab) {
            $tab = new Tab($id_tab);
            return $tab->delete();
        } else {
            return false;
        }
    }


}
