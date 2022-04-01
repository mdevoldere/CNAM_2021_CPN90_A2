<?php 
require 'vendor/autoload.php';

use Cocur\Slugify\Slugify;

$slugify = new Slugify();

echo '<h1>Bonjour</h1>';
echo '<p>Mon super Article qui mèle tout !!!</p>';
echo $slugify->slugify('Mon ??? -\'"-56\'7y98shrs _è;n(mrxoiàusuper Article qui mèle tout !!!');


$auditeur = new Cnam\Auditeur('Mike');

echo $auditeur->name;


