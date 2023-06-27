@echo off
set gen=%cd%\lib\gen\protobuf

set shared=%cd%\lib\data\protocol\define\shared\

cd %shared%
protoc --dart_out=%gen% *.proto