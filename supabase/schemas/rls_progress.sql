ALTER TABLE public.progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "progress_select_own"
ON public.progress
FOR SELECT
USING ( user_id = auth.uid() );

CREATE POLICY "progress_update_own"
ON public.progress
FOR UPDATE
USING ( user_id = auth.uid() )
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "progress_insert_own"
ON public.progress
FOR INSERT
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "progress_delete_own"
ON public.progress
FOR DELETE
USING ( user_id = auth.uid() );