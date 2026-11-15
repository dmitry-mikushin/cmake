CMAKE_<LANG>_COMPILE_OBJECT_RESTAT
---------------------------------

Tell the :generator:`Ninja` generators that the compile rule of language
``<LANG>`` leaves an up-to-date object untouched.

When set to true, the rule that compiles ``<LANG>`` sources is marked
``restat``: after the compiler runs, Ninja checks the object's timestamp again
and does not rebuild the archives and links that depend on it if the object
was not rewritten.  This is meant for languages whose "compiler" writes its
output only when the content changed, for example a front end whose object is
a scan record and whose link step is expensive.  Setting it for a compiler
that always rewrites its output has no effect.

The value is read from the directory of the target.  Other generators ignore
the variable.
