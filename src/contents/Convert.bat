@ECHO
SETLOCAL
SET "sourcedir=C:\Users\aglad\foliant\src\contents"
PUSHD "%sourcedir%"
FOR /f "delims=" %%a IN (
 'dir /b /s /a-d *.md *.html '
 ) DO (
 IF /i "%%~xa"==".md" (
  IF NOT EXIST "%%~dpna.html" ECHO pandoc "%%a" -f markdown -t html -o "%%~dpna.html"
 ) ELSE (
  IF NOT EXIST "%%~dpna.MD" ECHO pandoc "%%a" -f html -t markdown -o "%%~dpna.MD"
 )
)
popd
TIMEOUT /T 50
GOTO :EOF