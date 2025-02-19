ALTER TABLE public.lectures ENABLE ROW LEVEL SECURITY;

CREATE POLICY "lectures_select_own"
ON public.lectures
FOR SELECT
USING ( user_id = auth.uid() );

CREATE POLICY "lectures_update_own"
ON public.lectures
FOR UPDATE
USING ( user_id = auth.uid() )
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "lectures_insert_own"
ON public.lectures
FOR INSERT
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "lectures_delete_own"
ON public.lectures
FOR DELETE
USING ( user_id = auth.uid() );
