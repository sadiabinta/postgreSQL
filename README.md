1. What is the difference between the VARCHAR and CHAR data types?

    VARCHAR এবং CHAR হল PostgreSQL-এ ডেটা টাইপ। মৌলিক পার্থক্য হল যে তারা মেমরিতে স্থান নেয়ার ক্ষেত্রে কেমন আচরণ করে।

    VARCHAR স্থান ভেরিয়েবল হিসেবে নেয়। যদিও এটি varchar(n) হিসেবে সংজ্ঞায়িত করা যেতে পারে তবে এটি ডেটার আকার অনুযায়ী স্থান নেবে। এখানে মেমোরির বরাদ্দ সঠিকভাবে করা হয়।

    CHAR(n) হল একটি স্থির স্টোরেজ, এটি ডেটার আকারের সাথে পরিবর্তিত হয় না। কখনও কখনও এটি স্টোরেজের অপচয় হতে পারে।

2. Explain the purpose of the WHERE clause in a SELECT statement.

    SELECT বিবৃতিতে WHERE ক্লজ ডেটা ফিল্টার করার জন্য ব্যবহৃত হয়। এটি সেই সারিগুলি ফেরত দেয় যা শর্তগুলির সাথে মেলে। প্রাযুক্তিকভাবে এটি করে-

    *তুলনা যেমন </>/<=... 
    *LIKE/ILIKE *NULL/NOT NULL 
    *IN/NOT IN... 

    SELECT age FROM Students
    WHERE age>18;

3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

    ফরেন কি এবং প্রাইমারি কি সম্পর্কযুক্ত ডেটাবেস মডেলের একটি খুব গুরুত্বপূর্ণ অংশ। তারা ডেটার অখণ্ডতা এবং টেবিলগুলির মধ্যে সম্পর্ক নিশ্চিত করে কোন পূর্ব ধারণা ছাড়াই। 
    
    প্রাইমারি কি অনন্য, প্রতিটি টেবিলের জন্য একটি এবং এটি নাল হতে পারে না। 
    
    ফরেন কি হল একটি কলাম যা দুটি টেবিলের মধ্যে সম্পর্ক প্রতিষ্ঠা করে। ফরেন কি সাধারণত অন্য টেবিলের প্রাইমারি কি।
    
    CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id),
    location TEXT
);
    CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100)
);

