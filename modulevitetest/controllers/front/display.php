<?php
class ModuleViteTestDisplayModuleFrontController extends \ModuleFrontController
{
  public function initContent()
  {
    ModuleViteTest::$render_vite_import=true;
    parent::initContent();

    $this->context->smarty->addTemplateDir(_PS_MODULE_DIR_ . 'modulevitetest/views/templates');
    $this->template = "front/display.tpl";
  }
}
