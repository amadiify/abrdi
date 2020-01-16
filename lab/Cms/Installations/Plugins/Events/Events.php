<?php

namespace Installations\Plugins\Events;

class Events
{
    public static function init()
    {
        // application entry
        // inject directives
        boot()->get(\Moorexa\Directive::class)->inject(Directives::class);
    }
}