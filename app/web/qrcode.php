<?php
require_once( __DIR__ . '/vendor/autoload.php' );

use CodeItNow\BarcodeBundle\Utils\QrCode;

$qrCode = new QrCode();
$qrCode
    ->setText('https://mantisbt.app.cloud.gov/app/web/view.php?id=1')
    ->setSize(300)
    ->setPadding(10)
    ->setErrorCorrection('high')
    ->setForegroundColor(array('r' => 0, 'g' => 0, 'b' => 0, 'a' => 0))
    ->setBackgroundColor(array('r' => 255, 'g' => 255, 'b' => 255, 'a' => 0))
    ->setLabel('Request #0000001')
    ->setLabelFontSize(16)
    ->setImageType(QrCode::IMAGE_TYPE_PNG)
;
echo '<img src="data:'.$qrCode->getContentType().';base64,'.$qrCode->generate().'" />';

?>