::===========================================================
:: SimpRead : SimpRead development/publish/server environment
:: HOST     : https://github.com/kenshin/simpread
:: Author   : Kenshin<kenshin@ksria.com>
:: Version  : 0.0.1
::===========================================================

@echo off

::===========================================================
:: Initialize
::===========================================================
if "%1" == "run" (
    if "%2" == "develop" (
         goto develop
    ) else if "%2" == "publish"  (
        goto publish
    ) else (
        @echo npmw noly support command: `npmw run develop` and `npmw run publish`.
        goto quit
    )
) else (
    @echo npmw noly support command: `npmw run develop` and `npmw run publish`.
    goto quit
)

::===========================================================
:: develop : Development environment
::===========================================================
:develop
@echo webpack-dev-server --content-base src --hot --inline --progress --colors --devtool=source-map
set NODE_ENV=development
webpack-dev-server --content-base src --progress --colors --devtool=source-map
goto quit

::===========================================================
:: publish : Production environment
::===========================================================
:publish
@echo webpack -p --progress --colors
set NODE_ENV=production
webpack -p --progress --colors
goto quit

::===========================================================
:: quit : Quit batch script.
::===========================================================
:quit
@echo npmw batch quit.
exit /b 0
