@echo ON
cd win
python %RECIPE_DIR%\fix_openssl_win.py Makefile.msc
if errorlevel 1 exit 1
nmake /f Makefile.msc ^
  FOSSIL_DYNAMIC_BUILD=1 ^
  FOSSIL_ENABLE_SSL=1 ^
  FOSSIL_ENABLE_JSON=1 ^
  FOSSIL_ENABLE_TCL=1 ^
  FOSSIL_BUILD_ZLIB=0 ^
  PERLDIR=%PREFIX%\Library\bin
if errorlevel 1 exit 1
md %SCRIPTS% | echo "%SCRIPTS% already exists"
dir
copy fossil.exe %SCRIPTS%\fossil.exe
if errorlevel 1 exit 1
