CREATE TABLE IF NOT EXISTS public.progress (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    completed_lecture_ids uuid[],
    last_accessed timestamp,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE public.progress
    ADD CONSTRAINT fk_progress_user
    FOREIGN KEY (user_id) REFERENCES auth.users (id)
    ON DELETE CASCADE;
