
cdef extern from 'git2/repository.h':
    ctypedef struct git_repository
    int git_repository_open(git_repository** repo_out, const char* path)
    void git_repository_free(git_repository* repo)

cdef extern from 'memcached_backend_adapter.h':
    int attach_memcached_to_repo(git_repository* repo, const char *host, int port)
    int give_me_five()

def say_hello():
    print "Hello World!"

    cdef int hand = give_me_five()


class _Backend:
    def __init__(self,
                 str host: str,
                 int port: int,
                 str str_path: str) -> None:
        """
        Create a backend object

        :param host: The memcached host to connect to
        :type host: str
        :param port: The port on the host where memcached is running
        :type port: int
        :param str_path: path to the refs for this git repo
        :type str_path: str
        """

        # Convert python string to ctype const char*
        py_byte_string = str_path.encode('UTF-8')
        cdef const char* path = py_byte_string

        print "repo path is at " + str_path

        print "init NULL repo object"
        cdef git_repository *repository = NULL;


        print "open repo object at " + str_path
        cdef int err = git_repository_open(&repository, path)

        if err < 0:
            print "error free"
            git_repository_free(repository)
            raise Exception("could not open the repo error {}".format(err))

        print "attach backend"
        cdef int backend_err = attach_memcached_to_repo(repository, "localhost", 5000)

        if backend_err < 0:
            print "error free"
            git_repository_free(repository)
            raise Exception("got {}".format(backend_err))
