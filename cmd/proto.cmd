@echo off
set gen=%cd%\lib\gen\protobuf

set shared=%cd%\lib\data\protocol\define\shared\
set internal=%cd%\lib\data\protocol\define\internal\

cd %shared%
protoc --dart_out=%gen% *.proto

cd %internal%
protoc --dart_out=%gen% -I %shared% --proto_path %internal% *.proto