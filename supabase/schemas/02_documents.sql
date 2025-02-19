CREATE TABLE IF NOT EXISTS public.documents (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    title text,
    description text,
    file_url text,
    category text,
    status text,
    uploaded_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.documents
    ADD CONSTRAINT fk_documents_user
    FOREIGN KEY (user_id) REFERENCES auth.users (id)
    ON DELETE CASCADE;