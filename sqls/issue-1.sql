-- https://github.com/stephane-klein/PLpgSQL-by-example/issues/1

CREATE OR REPLACE FUNCTION foobar()
RETURNS VOID AS $$
BEGIN
    RAISE NOTICE 'hello';
    RAISE EXCEPTION 'error';
END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
    PERFORM foobar();
END $$;
