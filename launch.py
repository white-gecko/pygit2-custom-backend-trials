
import _memcached
_memcached.say_hello()

backend = _memcached._Backend("localhost", 5000, "/tmp/hallo")
