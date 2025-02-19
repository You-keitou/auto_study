CREATE TABLE IF NOT EXISTS public.qa_sessions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    document_id uuid,
    started_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.qa_sessions
    ADD CONSTRAINT fk_qa_sessions_user
    FOREIGN KEY (user_id) REFERENCES auth.users (id)
    ON DELETE CASCADE;

ALTER TABLE public.qa_sessions
    ADD CONSTRAINT fk_qa_sessions_document
    FOREIGN KEY (document_id) REFERENCES public.documents (id)
    ON DELETE CASCADE;