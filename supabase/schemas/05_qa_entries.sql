CREATE TABLE IF NOT EXISTS public.qa_entries (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL,
    question text,
    answer text,
    created_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.qa_entries
    ADD CONSTRAINT fk_qa_entries_session
    FOREIGN KEY (session_id) REFERENCES public.qa_sessions (id)
    ON DELETE CASCADE;