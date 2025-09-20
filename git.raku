#!raku

multi sub MAIN(:$init!) {
	my @names = 'object', 'refs', 'refs/heads';
	mkdir "$init" unless $init.IO.d;
	mkdir "$init/.git";
	for @names -> $name {
		mkdir "$init/.git/$name";
	}
	"$init/.git/HEAD".IO.spurt: "ref: refs/heads/master".encode('utf-8');
	say "Initialised empty repository: $init";
};
