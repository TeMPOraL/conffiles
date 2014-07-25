//some webjumps stolen from http://retroj.net/git/conkerorrc/webjumps.js ;)

define_webjump("wa", "http://www.wolframalpha.com/input/?i=%s",
               $alternative = "http://www.wolframalpha.com/");
define_webjump("wolframalpha", "http://www.wolframalpha.com/input/?i=%s",
               $alternative = "http://www.wolframalpha.com/");

define_webjump("hn", "http://searchyc.com/%s",
               $alternative = "http://news.ycombinator.com/");
define_webjump("hackernews", "http://searchyc.com/%s",
               $alternative = "http://news.ycombinator.com/");

/* entertainment */

define_webjump("imdb", "http://imdb.com/find?q=%s");
define_webjump("memory-alpha", "http://memory-alpha.org/en/wiki/Special:Search/?search=%s");
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("youtube-user", "http://youtube.com/profile_videos?user=%s");
define_webjump("lurkersguide",
    "http://www.google.com/search?q=site%3Ahttp%3A%2F%2Fwww.midwinter.com%2Flurk%2F+%s",
    $alternative = "http://www.midwinter.com/lurk/");


//other
define_webjump("down", "http://www.downforeveryoneorjustme.com/%s");

