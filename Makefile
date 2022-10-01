postgres:
	docker run --name postgresql -p 6500:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=12345678 -d postgres

createdb:
	docker exec -it postgresql createdb --username=root --owner=root bank_db

dropdb:
	docker exec -it postgresql dropdb bank_db

migrateup:
	migrate -path db/migration -database "postgresql://root:12345678@localhost:6500/bank_db?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:12345678@localhost:6500/bank_db?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migration migrateup migratedown