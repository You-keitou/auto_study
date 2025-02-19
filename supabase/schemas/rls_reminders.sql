ALTER TABLE public.reminders ENABLE ROW LEVEL SECURITY;

CREATE POLICY "reminders_select_own"
ON public.reminders
FOR SELECT
USING ( user_id = auth.uid() );

CREATE POLICY "reminders_update_own"
ON public.reminders
FOR UPDATE
USING ( user_id = auth.uid() )
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "reminders_insert_own"
ON public.reminders
FOR INSERT
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "reminders_delete_own"
ON public.reminders
FOR DELETE
USING ( user_id = auth.uid() );
