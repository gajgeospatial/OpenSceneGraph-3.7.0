#pragma once
#ifdef CDB_GLOBAL_EXPORTS
#define CDBGLOBALLIBRARYAPI __declspec(dllexport)
#else
#define CDBGLOBALLIBRARYAPI __declspec(dllimport)
#endif
