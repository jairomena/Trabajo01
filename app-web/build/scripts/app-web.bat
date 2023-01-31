@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  app-web startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_WEB_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\app-web.jar;%APP_HOME%\lib\spark-template-thymeleaf-2.7.1.jar;%APP_HOME%\lib\spark-core-2.9.3.jar;%APP_HOME%\lib\thymeleaf-extras-java8time-3.0.0.RELEASE.jar;%APP_HOME%\lib\thymeleaf-3.0.15.RELEASE.jar;%APP_HOME%\lib\resteasy-jackson2-provider-6.2.2.Final.jar;%APP_HOME%\lib\weld-se-core-5.0.0.SP1.jar;%APP_HOME%\lib\slf4j-simple-1.7.21.jar;%APP_HOME%\lib\resteasy-client-6.1.0.Final.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\jetty-webapp-9.4.31.v20200723.jar;%APP_HOME%\lib\websocket-server-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-servlet-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-security-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-server-9.4.31.v20200723.jar;%APP_HOME%\lib\websocket-servlet-9.4.31.v20200723.jar;%APP_HOME%\lib\ognl-3.1.26.jar;%APP_HOME%\lib\attoparser-2.0.5.RELEASE.jar;%APP_HOME%\lib\unbescape-1.1.6.RELEASE.jar;%APP_HOME%\lib\jackson-module-jakarta-xmlbind-annotations-2.13.4.jar;%APP_HOME%\lib\jackson-annotations-2.13.4.jar;%APP_HOME%\lib\jackson-jakarta-rs-json-provider-2.13.4.jar;%APP_HOME%\lib\jackson-jakarta-rs-base-2.13.4.jar;%APP_HOME%\lib\json-patch-1.13.jar;%APP_HOME%\lib\jackson-coreutils-2.0.jar;%APP_HOME%\lib\jackson-databind-2.13.4.2.jar;%APP_HOME%\lib\jackson-core-2.13.4.jar;%APP_HOME%\lib\resteasy-client-api-6.1.0.Final.jar;%APP_HOME%\lib\resteasy-core-6.1.0.Final.jar;%APP_HOME%\lib\resteasy-core-spi-6.1.0.Final.jar;%APP_HOME%\lib\weld-environment-common-5.0.0.SP1.jar;%APP_HOME%\lib\weld-lite-extension-translator-5.0.0.SP1.jar;%APP_HOME%\lib\weld-probe-core-5.0.0.SP1.jar;%APP_HOME%\lib\weld-core-impl-5.0.0.SP1.jar;%APP_HOME%\lib\jboss-logging-3.5.0.Final.jar;%APP_HOME%\lib\weld-spi-5.0.Final.jar;%APP_HOME%\lib\weld-api-5.0.Final.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-4.0.0.jar;%APP_HOME%\lib\jboss-classfilewriter-1.2.5.Final.jar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\jakarta.ws.rs-api-3.1.0.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\websocket-client-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-client-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-http-9.4.31.v20200723.jar;%APP_HOME%\lib\websocket-common-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-io-9.4.31.v20200723.jar;%APP_HOME%\lib\jetty-xml-9.4.31.v20200723.jar;%APP_HOME%\lib\websocket-api-9.4.31.v20200723.jar;%APP_HOME%\lib\javassist-3.20.0-GA.jar;%APP_HOME%\lib\jakarta.xml.bind-api-3.0.1.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.0.jar;%APP_HOME%\lib\msg-simple-1.2.jar;%APP_HOME%\lib\jakarta.interceptor-api-2.1.0.jar;%APP_HOME%\lib\jboss-logging-processor-2.2.1.Final.jar;%APP_HOME%\lib\jakarta.enterprise.lang-model-4.0.0.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.0.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\jakarta.validation-api-3.0.0.jar;%APP_HOME%\lib\jandex-2.4.2.Final.jar;%APP_HOME%\lib\angus-activation-1.0.0.jar;%APP_HOME%\lib\asyncutil-0.1.0.jar;%APP_HOME%\lib\httpcore-4.4.13.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\jetty-util-9.4.31.v20200723.jar;%APP_HOME%\lib\jakarta.activation-2.0.1.jar;%APP_HOME%\lib\btf-1.3.jar;%APP_HOME%\lib\jakarta.el-api-4.0.0.jar;%APP_HOME%\lib\jboss-logging-annotations-2.2.1.Final.jar;%APP_HOME%\lib\jdeparser-2.0.3.Final.jar


@rem Execute app-web
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_WEB_OPTS%  -classpath "%CLASSPATH%" com.distribuida.Main %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable APP_WEB_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%APP_WEB_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
