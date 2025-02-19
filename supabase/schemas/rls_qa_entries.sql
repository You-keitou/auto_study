ALTER TABLE public.qa_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "qa_entries_select_own"
ON public.qa_entries
FOR SELECT
USING (
  session_id IN (
    SELECT id FROM public.qa_sessions
    WHERE user_id = auth.uid()
  )
);

CREATE POLICY "qa_entries_update_own"
ON public.qa_entries
FOR UPDATE
USING (
  session_id IN (
    SELECT id FROM public.qa_sessions
    WHERE user_id = auth.uid()
  )
)
WITH CHECK (
  session_id IN (
    SELECT id FROM public.qa_sessions
    WHERE user_id = auth.uid()
  )
);

CREATE POLICY "qa_entries_insert_own"
ON public.qa_entries
FOR INSERT
WITH CHECK (
  session_id IN (
    SELECT id FROM public.qa_sessions
    WHERE user_id = auth.uid()
  )
);

CREATE POLICY "qa_entries_delete_own"
ON public.qa_entries
FOR DELETE
USING (
  session_id IN (
    SELECT id FROM public.qa_sessions
    WHERE user_id = auth.uid()
  )
);
