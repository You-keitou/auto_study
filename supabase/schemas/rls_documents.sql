ALTER TABLE public.documents ENABLE ROW LEVEL SECURITY;

CREATE POLICY "documents_select_own"
ON public.documents
FOR SELECT
USING ( user_id = auth.uid() );

CREATE POLICY "documents_update_own"
ON public.documents
FOR UPDATE
USING ( user_id = auth.uid() )
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "documents_insert_own"
ON public.documents
FOR INSERT
WITH CHECK ( user_id = auth.uid() );

CREATE POLICY "documents_delete_own"
ON public.documents
FOR DELETE
USING ( user_id = auth.uid() );
