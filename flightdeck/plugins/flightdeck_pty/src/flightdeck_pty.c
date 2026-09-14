#include "flightdeck_pty.h"

#include "include/dart_api_dl.c"

#if _WIN32
#include "flightdeck_pty_win.c"
#else
#include "forkpty.c"
#include "flightdeck_pty_unix.c"
#endif
