1. What is the difference between the VARCHAR and CHAR data types?
VARCHAR and char are data type in postgresql. Basic differences lies in the space they take to create memory.
    VARCHAR take space variably. though it can be defined as varchar(n) but it will take space according to the size of the data. memory allocation is done in proper way here.
    CHAR(n) is a fixed storage, it does not change with the data size.it can be a wastage of storage sometimes.