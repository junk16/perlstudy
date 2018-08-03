use strict;

my $pid = fork();

if($pid) {
	print "Parent : $$, child: $pid\n";

}else{
 	 while(1){
  		print "child : $$ \n";

		sleep(5);
  	}
}

print "exit $$\n";
