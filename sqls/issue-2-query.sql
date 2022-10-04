-- tips come from https://stackoverflow.com/questions/47596982/postgresql-converting-multiple-rows-to-json-array-in-json-build-object/47597605#47597605
SELECT
    id,
    firstname,
    x.*
FROM
    users
CROSS JOIN LATERAL
    json_to_recordset((users.metadata->>'group')::JSON) AS x(field_a int, field_b int);
