#!/usr/local/bin/perl

use WWW::FindConcept;
use Getopt::Std;

if(!@ARGV){
  print <<".";
 $0 queries              find concepts
 $0 -u queries           update concepts in cache
 $0 -r                   remove cache
.
}
getopt('ur', \%opts);


if(exists $opts{r}){
    print "Cache is removed.\n" if remove_cache;
    exit;
}

unshift @ARGV, $opts{u} if defined $opts{u};
foreach my $query (@ARGV){
    print "<$query>\n";
    print
      map{"  $_\n"}
      sort(
	   exists ($opts{u}) ?
	   update_concept($query) : find_concept($query)
	  );
}
