CREATE TABLE IF NOT EXISTS "name" (
	"fips" varchar(4) NOT NULL,
	"state_name" varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ("fips")
);

CREATE TABLE IF NOT EXISTS "income" (
	"fips" varchar(4) NOT NULL,
	"income" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);

CREATE TABLE IF NOT EXISTS "population" (
	"fips" varchar(255) NOT NULL DEFAULT '4',
	"pop" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);


ALTER TABLE "income" ADD CONSTRAINT "income_fk0" FOREIGN KEY ("fips") REFERENCES "name"("fips");
ALTER TABLE "population" ADD CONSTRAINT "population_fk0" FOREIGN KEY ("fips") REFERENCES "name"("fips");
