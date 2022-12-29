Dans une fonction, je peux pas lancer un select.

Ce que je voulais, c'est afficher le résultat d'un select.

Comment faire ça ?

```
psql:tests/test-logistic-management-workflow-actions-with-sscc.sql:306: NOTICE:  Avant 1
psql:tests/test-logistic-management-workflow-actions-with-sscc.sql:306: ERROR:  query has no destination for result data
HINT:  If you want to discard the results of a SELECT, use PERFORM instead.
```

               RAISE NOTICE 'ici 222 %', (
                    SELECT 
                        jsonb_pretty(json_agg(row_to_json(t))::jsonb)
                    FROM
                        (
                            SELECT
                                ssccs.id AS sscc_id,
                                (oij->>'has_been_received_or_sent')::BOOLEAN AS has_been_received_or_sent,
                                (oij->>'metadata')::JSONB AS metadata
                            FROM
                                jsonb_array_elements((order_item_jsonb->>'ssccs')::JSONB) oij
                            LEFT JOIN
                                logistic_management.ssccs
                            ON
                                (oij->>'serial_shipping_container_code')::VARCHAR = ssccs.serial_shipping_container_code
                            LEFT JOIN
                                logistic_management.order_items
                            ON
                                order_items.master_item_id=ssccs.master_item_id
                            WHERE
                                order_items.id=(order_item_jsonb->>'id')::UUID
                        ) as t
              );
