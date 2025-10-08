DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'ganaderia')
  LOOP
    EXECUTE format('TRUNCATE TABLE ganaderia.%I RESTART IDENTITY CASCADE;', r.tablename);
  END LOOP;
END $$;
