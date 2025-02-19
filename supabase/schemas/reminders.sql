CREATE TABLE IF NOT EXISTS public.reminders (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    document_id uuid,
    scheduled_at timestamp,
    type text,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.reminders
    ADD CONSTRAINT fk_reminders_user
    FOREIGN KEY (user_id) REFERENCES auth.users (id)
    ON DELETE CASCADE;

ALTER TABLE public.reminders
    ADD CONSTRAINT fk_reminders_document
    FOREIGN KEY (document_id) REFERENCES public.documents (id)
    ON DELETE CASCADE;