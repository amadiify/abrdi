<?php

Namespace Exceptions\Database;

class DatabaseException extends \Exception
{
	public function __construct($error)
	{
        $trace = $this->getTrace()[0];

        $this->title = 'Database Exception';
        
		$this->message = $error;

        $this->file = $trace['file'];        
		$this->line = $trace['line'];

	}
}