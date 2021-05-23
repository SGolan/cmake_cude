
pushd %cd%

if exist ".\build" (
    @echo deleting build dir
    rmdir /S /Q build
)
@echo making build dir anew
mkdir build
cd build

cmake -G"Visual Studio 16 2019" ..

popd

@echo PRESS ANY KEY TO EXIT
@pause > null.txt