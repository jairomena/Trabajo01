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
@rem  app-authors startup script for Windows
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

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_AUTHORS_OPTS to pass JVM options to this script.
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

set CLASSPATH=%APP_HOME%\lib\app-authors-1.0-SNAPSHOT.jar;%APP_HOME%\lib\quarkus-resteasy-jaxb-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-resteasy-jackson-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-resteasy-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-hibernate-orm-panache-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-jdbc-postgresql-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-vertx-http-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-vertx-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-netty-2.16.0.Final.jar;%APP_HOME%\lib\brotli4j-1.8.0.jar;%APP_HOME%\lib\resteasy-jackson2-provider-4.7.7.Final.jar;%APP_HOME%\lib\quarkus-jackson-2.16.0.Final.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.14.1.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.14.1.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.14.1.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.14.1.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.14.1.jar;%APP_HOME%\lib\smallrye-common-vertx-context-1.13.2.jar;%APP_HOME%\lib\quarkus-vertx-http-dev-console-runtime-spi-2.16.0.Final.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-web-2.30.1.jar;%APP_HOME%\lib\vertx-web-4.3.7.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-uri-template-2.30.1.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-web-common-2.30.1.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-auth-common-2.30.1.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-bridge-common-2.30.1.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-core-2.30.1.jar;%APP_HOME%\lib\vertx-web-common-4.3.7.jar;%APP_HOME%\lib\vertx-auth-common-4.3.7.jar;%APP_HOME%\lib\vertx-bridge-common-4.3.7.jar;%APP_HOME%\lib\vertx-mutiny-generator-2.30.1.jar;%APP_HOME%\lib\smallrye-mutiny-vertx-runtime-2.30.1.jar;%APP_HOME%\lib\vertx-uri-template-4.3.7.jar;%APP_HOME%\lib\vertx-core-4.3.7.jar;%APP_HOME%\lib\vertx-codegen-4.3.7.jar;%APP_HOME%\lib\jackson-core-2.14.1.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.14.1.jar;%APP_HOME%\lib\json-patch-1.13.jar;%APP_HOME%\lib\jackson-coreutils-2.0.jar;%APP_HOME%\lib\jackson-databind-2.14.1.jar;%APP_HOME%\lib\jackson-annotations-2.14.1.jar;%APP_HOME%\lib\quarkus-hibernate-orm-panache-common-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-hibernate-orm-2.16.0.Final.jar;%APP_HOME%\lib\hibernate-core-5.6.14.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\quarkus-caffeine-2.16.0.Final.jar;%APP_HOME%\lib\caffeine-3.1.1.jar;%APP_HOME%\lib\error_prone_annotations-2.17.0.jar;%APP_HOME%\lib\quarkus-jaxb-2.16.0.Final.jar;%APP_HOME%\lib\resteasy-jaxb-provider-4.7.7.Final.jar;%APP_HOME%\lib\jaxb-runtime-2.3.3-b02.jar;%APP_HOME%\lib\quarkus-resteasy-server-common-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-resteasy-common-2.16.0.Final.jar;%APP_HOME%\lib\jakarta.activation-1.2.1.jar;%APP_HOME%\lib\quarkus-agroal-2.16.0.Final.jar;%APP_HOME%\lib\agroal-narayana-1.16.jar;%APP_HOME%\lib\agroal-pool-1.16.jar;%APP_HOME%\lib\agroal-api-1.16.jar;%APP_HOME%\lib\quarkus-panache-hibernate-common-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-panache-common-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-narayana-jta-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-datasource-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-mutiny-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-smallrye-context-propagation-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-arc-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-jaxp-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-security-runtime-spi-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-core-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-bootstrap-runner-2.16.0.Final.jar;%APP_HOME%\lib\org-crac-0.1.3.jar;%APP_HOME%\lib\netty-codec-haproxy-4.1.86.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-http2-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.86.Final.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.86.Final.jar;%APP_HOME%\lib\netty-handler-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-dns-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-4.1.86.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.86.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.86.Final.jar;%APP_HOME%\lib\netty-common-4.1.86.Final.jar;%APP_HOME%\lib\quarkus-credentials-2.16.0.Final.jar;%APP_HOME%\lib\arc-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-security-1.1.4.Final.jar;%APP_HOME%\lib\quarkus-datasource-common-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-development-mode-spi-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-fs-util-0.0.9.jar;%APP_HOME%\lib\quarkus-ide-launcher-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-transaction-annotations-2.16.0.Final.jar;%APP_HOME%\lib\quarkus-vertx-latebound-mdc-provider-2.16.0.Final.jar;%APP_HOME%\lib\smallrye-reactive-converter-mutiny-2.7.0.jar;%APP_HOME%\lib\mutiny-smallrye-context-propagation-1.8.0.jar;%APP_HOME%\lib\mutiny-1.8.0.jar;%APP_HOME%\lib\resteasy-core-4.7.7.Final.jar;%APP_HOME%\lib\smallrye-config-2.13.1.jar;%APP_HOME%\lib\smallrye-config-core-2.13.1.jar;%APP_HOME%\lib\smallrye-common-annotation-1.13.2.jar;%APP_HOME%\lib\smallrye-config-common-2.13.1.jar;%APP_HOME%\lib\smallrye-common-classloader-1.13.2.jar;%APP_HOME%\lib\smallrye-common-expression-1.13.2.jar;%APP_HOME%\lib\smallrye-common-function-1.13.2.jar;%APP_HOME%\lib\smallrye-common-constraint-1.13.2.jar;%APP_HOME%\lib\smallrye-common-io-1.13.2.jar;%APP_HOME%\lib\smallrye-reactive-converter-api-2.7.0.jar;%APP_HOME%\lib\smallrye-context-propagation-1.2.2.jar;%APP_HOME%\lib\smallrye-context-propagation-api-1.2.2.jar;%APP_HOME%\lib\smallrye-context-propagation-jta-1.2.2.jar;%APP_HOME%\lib\smallrye-context-propagation-storage-1.2.2.jar;%APP_HOME%\lib\smallrye-fault-tolerance-vertx-5.6.0.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-2.0.2.jar;%APP_HOME%\lib\jakarta.interceptor-api-1.2.5.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\jakarta.inject-api-1.0.jar;%APP_HOME%\lib\jakarta.persistence-api-2.2.3.jar;%APP_HOME%\lib\jakarta.transaction-api-1.3.3.jar;%APP_HOME%\lib\resteasy-core-spi-4.7.7.Final.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\byte-buddy-1.12.18.jar;%APP_HOME%\lib\microprofile-config-api-2.0.1.jar;%APP_HOME%\lib\microprofile-context-propagation-api-1.2.jar;%APP_HOME%\lib\graal-sdk-22.3.0.jar;%APP_HOME%\lib\hibernate-graalvm-5.6.14.Final.jar;%APP_HOME%\lib\quarkus-local-cache-0.1.1.jar;%APP_HOME%\lib\jboss-logging-annotations-2.2.1.Final.jar;%APP_HOME%\lib\jboss-threads-3.4.3.Final.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.1.2.Final.jar;%APP_HOME%\lib\jboss-logging-3.5.0.Final.jar;%APP_HOME%\lib\jboss-logmanager-embedded-1.0.11.jar;%APP_HOME%\lib\narayana-jta-5.13.1.Final.jar;%APP_HOME%\lib\narayana-jts-integration-5.13.1.Final.jar;%APP_HOME%\lib\slf4j-jboss-logmanager-1.2.0.Final.jar;%APP_HOME%\lib\jboss-jaxrs-api_2.1_spec-2.0.1.Final.jar;%APP_HOME%\lib\jboss-jaxb-api_2.3_spec-2.0.0.Final.jar;%APP_HOME%\lib\jboss-transaction-spi-7.6.0.Final.jar;%APP_HOME%\lib\postgresql-42.5.1.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\wildfly-common-1.5.4.Final-format-001.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\txw2-2.3.3-b02.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.10.jar;%APP_HOME%\lib\msg-simple-1.2.jar;%APP_HOME%\lib\jakarta.el-api-3.0.3.jar;%APP_HOME%\lib\jboss-connector-api_1.7_spec-1.0.0.Final.jar;%APP_HOME%\lib\btf-1.3.jar;%APP_HOME%\lib\asyncutil-0.1.0.jar


@rem Execute app-authors
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_AUTHORS_OPTS%  -classpath "%CLASSPATH%"  %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable APP_AUTHORS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%APP_AUTHORS_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
