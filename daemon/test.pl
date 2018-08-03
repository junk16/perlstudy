#! /usr/bin/env perl

#use strict;
use warnings;
use Data::Dumper;
use POSIX qw(setsid);

my $WORKER_MAX = 3;
my @pids;
for(1 .. $WORKER_MAX){
	my $pid = fork();
	
	if($pid != 0){
		print "create daemon process\n";
		push(@pids, $pid);
		next
	}else{
		umask 0;
		chdir '/';
		open STDIN, '/dev/null';
		open STDERR, '>/dev/null';
	 
		setsid;
	
		while(1){
			print "hello : $pid\n";
			sleep 5;
		}
	
	}

}

while(sclalar(@pids)){
	my $child = shift(@pids);
	if(waitpid($child, WNOHANG)){
		print "finish child : $child\n";
	}else{
		push(@pids, $child);
	}
}

print "Finish parent : $$\n";
