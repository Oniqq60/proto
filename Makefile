PROTOS := auth/auth.proto \
          channels/channels.proto \
          common/types.proto \
          events/events.proto \
          messages/messages.proto \
          users/users.proto
OUT_DIR := ./gen

generate:
	@echo "Generating Go code from .proto files..."
	protoc \
		--go_out=$(OUT_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative \
		$(PROTOS)

clean:
	@del /Q /S "*.pb.go" >nul 2>&1 || exit 0