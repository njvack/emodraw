# EmoDraw

EmoDraw is a little HTML-based app for drawing where on the body you're feeling a particular emotion. Ultimately, it's for generating body maps
like in [Nummenmaa et al](http://www.pnas.org/content/111/2/646.abstract), though the [NPR article](http://www.npr.org/blogs/health/2013/12/30/258313116/mapping-emotions-on-the-body-love-makes-us-warm-all-over) will be less paywalled.

The backend of this is a little Rails app.

There'll need to be some kind of admin interface, too, to allow researchers to set up what labels people will be drawing, and what avatars people will be able to choose from.

This will be (at least at first) a single-tenant system — if you want to collect your own dataset, you'll need to deploy it to your own App Engine instance. Username and password will be hardcoded for your instance.

