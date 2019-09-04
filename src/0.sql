.echo on
-- 任意の１文字
select 'A' like '_';
select '' like '_';
select 'AA' like '_';

-- 任意の0文字以上
select 'abc123' like 'abc%';
select '123abc' like '%abc';
select '123abc456' like '%abc%';

-- メタ文字のエスケープ
select '0_A' like '_\_A' escape '\';
select '100%' like '%\%' escape '\';
select '-2.5%' like '%\%' escape '\';

-- 大文字・小文字の区別
--   ASCII文字は区別しない
select '1a' like '_A';
select '1A' like '_A';
--     `collate binary`句を使っても区別不可
select '1a' collate binary like '_A';
select '1a' like '_A' collate binary;
select '1a' like collate binary '_A';
--   ASCII文字以外は区別する
select '1ｱ' like '_ア';
select '12' like '_２';
-- ASCII文字を区別するよう設定する
PRAGMA case_sensitive_like = true;
select '1a' like '_A';
select '1A' like '_A';
PRAGMA case_sensitive_like = false;

-- like()関数
select like('_A', '1A');
select like('_A', '11A');
select like('%A', '11A');
select like('%\%', '100%', '\');

-- NOT
select '1A' not like '_A';
select not like('_A', '1A');

