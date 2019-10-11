<?php
require_once( __DIR__ . '/vendor/autoload.php' );

use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;

$barcode = new BarcodeGenerator();
$barcode->setText("0000001");
$barcode->setType(BarcodeGenerator::Code128);
$barcode->setScale(2);
$barcode->setThickness(25);
$barcode->setFontSize(10);
$code = $barcode->generate();

echo '<img src="data:image/png;base64,'.$code.'" />';

?>