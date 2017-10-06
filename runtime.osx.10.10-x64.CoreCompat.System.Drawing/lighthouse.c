#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>

__attribute__((visibility("default"))) size_t get_moduleFileName(char* moduleFileName, size_t moduleFileNameLength)
{
    Dl_info dl_info;
    dladdr(get_moduleFileName, &dl_info);

    if (strlen(dl_info.dli_fname) > moduleFileNameLength)
    {
        return strlen(dl_info.dli_fname);
    }

    strcpy(moduleFileName, dl_info.dli_fname);
    return 0;
}

