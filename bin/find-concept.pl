#!/usr/local/bin/perl

use WWW::FindConcept;

foreach my $query (@ARGV){
    print "<$query>\n";
    print map{"  $_\n"} sort(find_concept($query));
}
