ALTER TABLE public.qa_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "qa_sessions_select_own"
ON public.qa_sessions
FOR SELECT
USING ( user_id = auth.uid() );

CREATE POLICY "qa_sessions_update_own"
ON public.qa_sessions
FOR UPDATE
USING ( user_id = auth.uid() )
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "qa_sessions_insert_own"
ON public.qa_sessions
FOR INSERT
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "qa_sessions_delete_own"
ON public.qa_sessions
FOR DELETE
USING ( user_id = auth.uid() );
