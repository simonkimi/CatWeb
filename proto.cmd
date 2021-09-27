cd .\lib\data\protocol\define
protoc --dart_out=../../../gen/protobuf selector.proto
protoc --dart_out=../../../gen/protobuf parser.proto