#! /usr/bin/env perl -w

use strict;
use utf8;
use Daemon::Generic;
use File::Basename;

sub gd_run {
	while(1){
   		sleep(10);
		system('/usr/bin/notify-send', 'DaemonTest', 'Epocime in seconds from 1970/1/1: ' . time);
	}
}

my $prg;
($prg) = fileparse($0);

my $pidfile = $ENV{HOME} . "/." . $prg . "_pid";

newdaemon(pidfile => $pidfile);
