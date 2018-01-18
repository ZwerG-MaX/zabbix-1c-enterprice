@echo off

::
:: ��������� 1C Enterprise RAS � �������� ������ windows
::

:: ��� 32� ������ ��������� 1� �� 64� ������ windows �������
:: set prefix=%ProgramFiles(x86)%\1cv8\
set prefix=%ProgramFiles%\1cv8\
set suffix=\bin\ras.exe
set ver=8.*.*
set name="1C:Enterprise RAS"

:: ���������� ���� �� ��������� ������ 1� 8.*.*
for /f %%a in ('dir /a:d /o:-n /b "%prefix%%ver%"') do (
	if exist "%prefix%%%a%suffix%" (
        set exec="%prefix%%%a%suffix%"
        goto :break
	) else (
        echo "1C Enterprice RAS not found in %prefix%%%a%suffix%"
	)
)
:break

sc create %name% binPath= "%exec:~1,-1% cluster --service" DisplayName= %name% start= "auto"

pause