<?php
namespace Installations\Plugins\Events;
use Moorexa\Directive;

class Directives
{
    // directive used
	public static function directives(Directive $injector)
	{
		$injector->set('hello', 'helloDirective');
    }
    
    public static function helloDirective()
    {
        return 'Hello chris';
    }
}