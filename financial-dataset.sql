CREATE TABLE IF NOT EXISTS "account" (
	"account_id" int NOT NULL,
	"district_id" int NOT NULL,
	"frequency" text NOT NULL,
	"date" float NOT NULL,
	PRIMARY KEY ("account_id")
);

CREATE TABLE IF NOT EXISTS "client" (
	"client_id" int NOT NULL,
	"birth_number" int NOT NULL,
	"district_id" int NOT NULL,
	PRIMARY KEY ("client_id")
);

CREATE TABLE IF NOT EXISTS "disposition" (
	"disp_id" int NOT NULL,
	"client_id" int NOT NULL,
	"account_id" int NOT NULL,
	"type" text NOT NULL,
	PRIMARY KEY ("disp_id")
);

CREATE TABLE IF NOT EXISTS "permanent_order" (
	"order_id" int NOT NULL,
	"account_id" int NOT NULL,
	"bank_to" text NOT NULL,
	"account_to" int NOT NULL,
	"amount" float NOT NULL,
	"k_symbol" text NOT NULL,
	PRIMARY KEY ("order_id")
);

CREATE TABLE IF NOT EXISTS "Transaction" (
	"trans_id" int NOT NULL,
	"account_id" int NOT NULL,
	"date" float NOT NULL,
	"type" text NOT NULL,
	"operation" text NOT NULL,
	"amount" float NOT NULL,
	"balance" float NOT NULL,
	"k_symbol" text NOT NULL,
	"bank" int NOT NULL,
	"account" int NOT NULL,
	PRIMARY KEY ("trans_id")
);

CREATE TABLE IF NOT EXISTS "loan" (
	"loan_id" int NOT NULL,
	"account_id" int NOT NULL,
	"date" float NOT NULL,
	"amount" int NOT NULL,
	"duration" int NOT NULL,
	"status" text NOT NULL,
	"payments" float NOT NULL,
	PRIMARY KEY ("loan_id")
);

CREATE TABLE IF NOT EXISTS "credit_card" (
	"card_id" int NOT NULL,
	"disp_id" int NOT NULL,
	"type" text NOT NULL,
	"issued" float NOT NULL,
	PRIMARY KEY ("card_id")
);

CREATE TABLE IF NOT EXISTS "demographic_data" (
	"id" int NOT NULL,
	"A1" int NOT NULL,
	"A2" text NOT NULL,
	"A3" text NOT NULL,
	"A4" int NOT NULL,
	"A5" int NOT NULL,
	"A6" int NOT NULL,
	"A7" int NOT NULL,
	"A8" int NOT NULL,
	"A9" int NOT NULL,
	"A10" float NOT NULL,
	"A11" int NOT NULL,
	"A12" float NOT NULL,
	"A13" float NOT NULL,
	"A14" int NOT NULL,
	"A15" int NOT NULL
);



ALTER TABLE "disposition" ADD CONSTRAINT "disposition_fk1" FOREIGN KEY ("client_id") REFERENCES "client"("client_id");

ALTER TABLE "disposition" ADD CONSTRAINT "disposition_fk2" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");
ALTER TABLE "permanent_order" ADD CONSTRAINT "permanent_order_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");
ALTER TABLE "loan" ADD CONSTRAINT "loan_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");
ALTER TABLE "credit_card" ADD CONSTRAINT "credit_card_fk1" FOREIGN KEY ("disp_id") REFERENCES "disposition"("disp_id");
