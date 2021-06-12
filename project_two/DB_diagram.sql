-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE "well_header" (
    "well_id" INT   NOT NULL,
    "state" varchar   NOT NULL,
    "operator" varchar   NOT NULL,
    "latitude" int   NOT NULL,
    "longitude" int   NOT NULL,
    "rigs" varchar   NOT NULL,
    "ubhi" varchar   NOT NULL,
    CONSTRAINT "pk_well_header" PRIMARY KEY (
        "well_id"
     )
);

CREATE TABLE "well_report" (
    "doc_id" INT   NOT NULL,
    "borehole_id" INT   NOT NULL,
    "document_title" varchar   NOT NULL,
    "document_type" varchar   NOT NULL,
    CONSTRAINT "pk_well_report" PRIMARY KEY (
        "doc_id"
     )
);

CREATE TABLE "basin" (
    "basin_id" INT   NOT NULL,
    "basin" varchar   NOT NULL,
    "sub_basin" varchar   NOT NULL,
    CONSTRAINT "pk_basin" PRIMARY KEY (
        "basin_id"
     )
);

CREATE TABLE "borehole_observation" (
    "observation_id" INT   NOT NULL,
    "borhole_id" INT   NOT NULL,
    "basin_id" INT   NOT NULL,
    "doc_id" INT   NOT NULL,
    "biostrat_id" INT   NOT NULL,
    "elevation_id" INT   NOT NULL,
    "well_id" INT   NOT NULL,
    CONSTRAINT "pk_borehole_observation" PRIMARY KEY (
        "observation_id"
     )
);

CREATE TABLE "elevation" (
    "elevation_id" INT   NOT NULL,
    "sea_floor" varchar   NOT NULL,
    "rotary_table" varchar   NOT NULL,
    CONSTRAINT "pk_elevation" PRIMARY KEY (
        "elevation_id"
     )
);

CREATE TABLE "biostrat" (
    "biostrat_id" INT   NOT NULL,
    "borehole_id" INT   NOT NULL,
    "depth" varchar   NOT NULL,
    "zone" varchar   NOT NULL,
    CONSTRAINT "pk_biostrat" PRIMARY KEY (
        "biostrat_id"
     )
);

CREATE TABLE "borehole" (
    "borehole_id" INT   NOT NULL,
    "borehole_name" varchar   NOT NULL,
    CONSTRAINT "pk_borehole" PRIMARY KEY (
        "borehole_id"
     )
);

ALTER TABLE "well_report" ADD CONSTRAINT "fk_well_report_borehole_id" FOREIGN KEY("borehole_id")
REFERENCES "borehole" ("borehole_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_borhole_id" FOREIGN KEY("borhole_id")
REFERENCES "borehole" ("borehole_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_basin_id" FOREIGN KEY("basin_id")
REFERENCES "basin" ("basin_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_doc_id" FOREIGN KEY("doc_id")
REFERENCES "well_report" ("doc_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_biostrat_id" FOREIGN KEY("biostrat_id")
REFERENCES "biostrat" ("biostrat_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_elevation_id" FOREIGN KEY("elevation_id")
REFERENCES "elevation" ("elevation_id");

ALTER TABLE "borehole_observation" ADD CONSTRAINT "fk_borehole_observation_well_id" FOREIGN KEY("well_id")
REFERENCES "well_header" ("well_id");

ALTER TABLE "biostrat" ADD CONSTRAINT "fk_biostrat_borehole_id" FOREIGN KEY("borehole_id")
REFERENCES "borehole" ("borehole_id");

