@echo off

::协议文件路径, 最后不要跟“\”符号
set SOURCE_FOLDER=.

::C#编译器路径
set CS_COMPILER_PATH=..\Tools\protoc-3.3.0\protoc.exe
::C#文件生成路径, 最后不要跟“\”符号
set CS_TARGET_PATH=..\Client

::Java编译器路径
set JAVA_COMPILER_PATH=..\Tools\protoc-3.3.0\protoc.exe
::Java文件生成路径, 最后不要跟“\”符号
set JAVA_TARGET_PATH=F:\Projects\XZ-2016-Server\proto\src\main\java

::删除之前创建的文件
del %CS_TARGET_PATH%\*.* /f /s /q
del %JAVA_TARGET_PATH%\*.* /f /s /q

::遍历所有文件
for /f "delims=" %%i in ('dir /b "%SOURCE_FOLDER%\*.proto"') do (
    
    ::生成 C# 代码
    echo --csharp_out=%CS_TARGET_PATH% %%i
    %CS_COMPILER_PATH% -I=./ --csharp_out=%CS_TARGET_PATH% %%i
    
    ::生成 Java 代码
    echo --java_out=%JAVA_TARGET_PATH% %%i
    %JAVA_COMPILER_PATH% -I=./ --java_out=%JAVA_TARGET_PATH% %%i

)

echo protocol generated.

pause