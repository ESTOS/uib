SET SQL DIALECT 3; 
 
/* CREATE DATABASE 'blob_filters.fdb' DEFAULT CHARACTER SET NONE */

/*  BLOB Filter declarations */
DECLARE FILTER INVERT_FILTER INPUT_TYPE 1 OUTPUT_TYPE -2
        ENTRY_POINT 'invert_filter' MODULE_NAME 'invf.dll';

DECLARE FILTER UNZIP_FILTER INPUT_TYPE -3 OUTPUT_TYPE 1
        ENTRY_POINT 'unzip_filter' MODULE_NAME 'zipf.dll';

DECLARE FILTER ZIP_FILTER INPUT_TYPE 1 OUTPUT_TYPE -3
        ENTRY_POINT 'zip_filter' MODULE_NAME 'zipf.dll';

/* Table: BLOBS, Owner: SYSDBA */
CREATE TABLE BLOBS (BLOB_ID INTEGER NOT NULL,
        BLOB_TEXT BLOB SUB_TYPE 0 SEGMENT SIZE 80,
        BLOB_INVERTED BLOB SUB_TYPE -2 SEGMENT SIZE 80,
        BLOB_ZIPPED BLOB SUB_TYPE -3 SEGMENT SIZE 80,
CONSTRAINT BLOBS_PK PRIMARY KEY (BLOB_ID));
