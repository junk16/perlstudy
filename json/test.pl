use utf8;
use JSON;

my $output_data = {
	number => 1,
	list => [1, 2 ,3],
	text => 'hello!',
};

my $json_text = encode_json($output_data);

print "$json_text\n";

$json_text=~s/%([0-9A-Fa-f][0-9A-Fa-f])/pack('H2', $1)/eg;

print "$json_text\n";
