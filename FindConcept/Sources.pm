# $Id: Sources.pm,v 1.5 2004/01/05 17:09:43 cvspub Exp $
package WWW::FindConcept::Sources;

use strict;

our %source;


@{$source{google_glossary}} = 
    (
     'http://labs.google.com/glossary?q={%query%}&btnG=Google+Glossary+Search',
     ,
     qr'<font size=-1><a href=http:\/\/labs.google.com/glossary\?q=.+?>(.+?)</a>.+?<br>'

    );


@{$source{altavista}} = 
    (
     'http://altavista.com/web/results?q={%query%}&kgs=0&kls=1&avkw=aapt',
     ,
     qr'<A title=".+?" href="\/r\?r=.+?">(.+?)<\/A>.+?<BR>'

    );


@{$source{vivisimo}} = 
    (
     'http://search6.vivisimo.com/search?query={%query%}&v:sources=MSN%2CNetscape%2CLycos%2CLooksmart%2COverture&x=0&y=0&img_base_url=http%3A%2F%2Fvivisimo.com%2Fvivisimo%2Fimages%2F&v:file=viv_5bd43732e3972c898af5adaecba3d999&v:frame=tree&v:state=(root)%7Croot'
     ,
     qr!target="list" onClick="oc\(this,\d+,\d+,'.+?'\)">(.+?)<\/a>!

    );

@{$source{lycos}} = 
    (
     'http://search.lycos.com/default.asp?lpv=1&loc=searchhp&query={%query%}'
     ,
     qr!<nobr><a href="default.asp\?query=.+?>(.+?)<\/a><\/nobr>!

    );


@{$source{search}} = 
    (
     'http://www.search.com/search?q={%query%}',
     ,
     qr!<a href="\/search\/.+?"><b>(.+?)</b></a>!

    );

@{$source{ask}} = 
    (
     'http://web.ask.com/web?q={%query%}&qsrc=1&o=0',
     ,
     qr!<td><a href="http:\/\/tm.wc.ask.com/r.+?".+?class="rollover">(.+?)</a>!
    );



1;
__END__
