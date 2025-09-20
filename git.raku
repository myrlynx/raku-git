#!raku

multi sub MAIN(:$init!) {
	my @names = 'object', 'refs', 'refs/heads';
	if $init.IO.d {
		say "A directory with the name $init exists";
		} else {
			mkdir "$init";
			mkdir "$init/.git";
			for @names -> $name {
				mkdir "$init/.git/$name";
			}
			"$init/.git/HEAD".IO.spurt: "ref: refs/heads/master".encode('utf-8');
			
			say "Initialised empty repository: $init";
		};
	};
