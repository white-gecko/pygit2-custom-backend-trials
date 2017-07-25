from distutils.core import setup, Extension
from Cython.Build import cythonize

memcached = Extension('_memcached',
                    include_dirs = ["/tmp/libgit2-backends.git/memcached/"],
                    libraries= ["git2-memcached"],
                    sources = ["./src/_memcached.pyx"])

setup(name = 'Hello world app',
      ext_modules = cythonize(memcached))
