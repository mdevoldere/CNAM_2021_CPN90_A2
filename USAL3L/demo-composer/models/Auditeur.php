<?php 
// Cnam\Auditeur
namespace Cnam;

class Auditeur 
{
    public $name;

    public function __construct(string $name) 
    {
        $this->name = $name;
    }
}