# $Id: test.pl,v 1.3 2004/01/05 16:49:04 cvspub Exp $
use Test::More qw(no_plan);
ok(1);

BEGIN { use_ok( 'WWW::FindConcept' ); }

use Data::Dumper;
%concept = map{$_=>1} find_concept('perl');
ok($concept{$_}) foreach q/Perl 5/, q/Perl Mongers/, q/Open Source/;
