This is just some not yet working trial to work with the [custom backend feature of pygit2](http://www.pygit2.org/backends.html) which was [introduced in version 0.25.1](https://github.com/libgit2/pygit2/blob/master/CHANGELOG.rst#0251-2017-04-25) of pygit2.
I try to connect the memcached backend of the [libgit2-backends](https://github.com/libgit2/libgit2-backends) which doesn't compile so I did [my own fork and branch](https://github.com/white-gecko/libgit2-backends/tree/feature/FixMemcached), which compiles, but I couldn't verify it so far.

I got some support from [@hishnash](https://github.com/hishnash) who works on [GitPagedArchiveBacken](https://github.com/luckymarmot/GitPagedArchiveBackend)
especially relevant are: [src/_archive.pyx](https://github.com/luckymarmot/GitPagedArchiveBackend/blob/master/src/_archive.pyx) and [src/gitbackend.c](https://github.com/luckymarmot/GitPagedArchiveBackend/blob/master/src/gitbackend.c).

I've also asked the question I try to answer with this repo on [stackoverflow](https://stackoverflow.com/questions/44804653/using-libgit2-memcached-backend-with-pygit2).

See also: http://blog.deveo.com/your-git-repository-in-a-database-pluggable-backends-in-libgit2/
