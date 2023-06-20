<?php

if (!defined('_PS_VERSION_')) {
  exit;
}

include_once('assets.include.php');

class ModuleViteTest extends Module
{
  public static $render_vite_import = false;

  public function __construct()
  {
    $this->name = 'modulevitetest';
    $this->tab = 'front_office_features';
    $this->version = '0.1.0';
    $this->author = 'Manu';
    $this->need_instance = 0;
    $this->ps_versions_compliancy = [
      'min' => '1.7',
      'max' => _PS_VERSION_
    ];
    $this->bootstrap = true;

    parent::__construct();

    $this->displayName = $this->l('Module Vite Test');
    $this->description = $this->l('Vite integration test');
  }

  public function install()
  {
    //parent install module with overrides

    return parent::install()
      && $this->registerHook('displayHeader')
    ;
  }

  public function hookDisplayHeader()
  {
    if(ModuleViteTest::$render_vite_import) {

      if(defined("MODULEVITETEST_DEV_SERVER_URL")) {
        return $this->display(__FILE__, 'vite/dev.tpl');
      }
      else {
        return $this->display(__FILE__, 'vite/prod.tpl');
      }
    }
  }
}

