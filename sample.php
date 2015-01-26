<?php 
include 'header.php';
?>
<div class="content">
<?php
/***
 * Without Error Handling
 */

//$xsldoc= new DOMDocument();
//$xsldoc->load("cdcatelogue.xsl");
//
//$xmldoc=new DOMDocument();
//$xmldoc->load("cdcatelogue.xml");
//
//$proc=new XSLTProcessor();
//$proc->importStylesheet($xsldoc);
//echo $proc->transformToXML($xmldoc);

/***
 * With Error Handling
 */
/**load xsl file **/
$xsldoc=new DOMDocument();
$xsldoc->load("cityres.xsl");
/** load xml file **/
$xmldoc=new DOMDocument();
$xmldoc->load("CityWiseResponse.xml");
/** initialize xslt processor*/
$proc=new XSLTProcessor();

libxml_use_internal_errors(TRUE);
$result=$proc->importStylesheet($xsldoc);
if(!$result){
    foreach (libxml_get_errors() as $error){
        echo "Libxml error {$error->message}\n";
    }
}
else{
    echo $proc->transformToXml($xmldoc);
}

?>
</div>
<script>
    $('.carousel').carousel({
        interval: 3000
    })
</script>
<?php
include 'footer.php';
?>
