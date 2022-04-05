```sql
foo = '{"bar": "baz", "balance": 7.77, "active":false}'::json;
NOTICE "foo: %", foo->'bar';
```
