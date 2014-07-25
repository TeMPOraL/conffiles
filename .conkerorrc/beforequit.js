/* Stolen from http://babbagefiles.blogspot.com/2011/01/conkeror-browsing-web-emacs-style.html */

 add_hook("before_quit_hook",
           function () {
               var w = get_recent_conkeror_window();
               var result = (w == null) ||
                   "y" == (yield w.minibuffer.read_single_character_option(
                       $prompt = "Quit Conkeror? (y/n)",
                       $options = ["y", "n"]));
               yield co_return(result);
           });