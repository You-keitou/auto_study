CREATE TABLE IF NOT EXISTS public.lectures (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    document_id uuid NOT NULL,
    content text,
    created_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.lectures
    ADD CONSTRAINT fk_lectures_user
    FOREIGN KEY (user_id) REFERENCES auth.users (id)
    ON DELETE CASCADE;

ALTER TABLE public.lectures
    ADD CONSTRAINT fk_lectures_document
    FOREIGN KEY (document_id) REFERENCES public.documents (id)
    ON DELETE CASCADE;