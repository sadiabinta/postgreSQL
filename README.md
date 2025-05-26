1. What is the difference between the VARCHAR and CHAR data types?

    VARCHAR এবং CHAR হল PostgreSQL-এ ডেটা টাইপ। মৌলিক পার্থক্য হল যে তারা মেমরিতে স্থান নেয়ার ক্ষেত্রে কেমন আচরণ করে।
    VARCHAR স্থান ভেরিয়েবল হিসেবে নেয়। যদিও এটি varchar(n) হিসেবে সংজ্ঞায়িত করা যেতে পারে তবে এটি ডেটার আকার অনুযায়ী স্থান নেবে। এখানে মেমোরির বরাদ্দ সঠিকভাবে করা হয়।
    CHAR(n) হল একটি স্থির স্টোরেজ, এটি ডেটার আকারের সাথে পরিবর্তিত হয় না। কখনও কখনও এটি স্টোরেজের অপচয় হতে পারে।

2. Explain the purpose of the WHERE clause in a SELECT statement.

    In SELECT statement WHERE clause is used for filtering data. it return rows which match with the conditions.
    Basically it does-
        *comparison like </>/<=...
        *LIKE/ILIKE
        *NULL/NOT NULL
        * IN/NOT IN...
    SELECT age FROM Student
    WHERE age>18;