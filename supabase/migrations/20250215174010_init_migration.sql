create table "public"."documents" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "title" text,
    "description" text,
    "file_url" text,
    "category" text,
    "status" text,
    "uploaded_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."documents" enable row level security;

create table "public"."lectures" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "document_id" uuid not null,
    "content" text,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."lectures" enable row level security;

create table "public"."profiles" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now(),
    "english_level" text,
    "interests" text[]
);


alter table "public"."profiles" enable row level security;

create table "public"."progress" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "completed_lecture_ids" uuid[],
    "last_accessed" timestamp without time zone,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."progress" enable row level security;

create table "public"."qa_entries" (
    "id" uuid not null default gen_random_uuid(),
    "session_id" uuid not null,
    "question" text,
    "answer" text,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."qa_entries" enable row level security;

create table "public"."qa_sessions" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "document_id" uuid,
    "started_at" timestamp without time zone not null default now()
);


alter table "public"."qa_sessions" enable row level security;

create table "public"."reminders" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "document_id" uuid,
    "scheduled_at" timestamp without time zone,
    "type" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."reminders" enable row level security;

CREATE UNIQUE INDEX documents_pkey ON public.documents USING btree (id);

CREATE UNIQUE INDEX lectures_pkey ON public.lectures USING btree (id);

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX progress_pkey ON public.progress USING btree (id);

CREATE UNIQUE INDEX qa_entries_pkey ON public.qa_entries USING btree (id);

CREATE UNIQUE INDEX qa_sessions_pkey ON public.qa_sessions USING btree (id);

CREATE UNIQUE INDEX reminders_pkey ON public.reminders USING btree (id);

alter table "public"."documents" add constraint "documents_pkey" PRIMARY KEY using index "documents_pkey";

alter table "public"."lectures" add constraint "lectures_pkey" PRIMARY KEY using index "lectures_pkey";

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."progress" add constraint "progress_pkey" PRIMARY KEY using index "progress_pkey";

alter table "public"."qa_entries" add constraint "qa_entries_pkey" PRIMARY KEY using index "qa_entries_pkey";

alter table "public"."qa_sessions" add constraint "qa_sessions_pkey" PRIMARY KEY using index "qa_sessions_pkey";

alter table "public"."reminders" add constraint "reminders_pkey" PRIMARY KEY using index "reminders_pkey";

alter table "public"."documents" add constraint "fk_documents_user" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."documents" validate constraint "fk_documents_user";

alter table "public"."lectures" add constraint "fk_lectures_document" FOREIGN KEY (document_id) REFERENCES documents(id) ON DELETE CASCADE not valid;

alter table "public"."lectures" validate constraint "fk_lectures_document";

alter table "public"."lectures" add constraint "fk_lectures_user" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."lectures" validate constraint "fk_lectures_user";

alter table "public"."progress" add constraint "fk_progress_user" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."progress" validate constraint "fk_progress_user";

alter table "public"."qa_entries" add constraint "fk_qa_entries_session" FOREIGN KEY (session_id) REFERENCES qa_sessions(id) ON DELETE CASCADE not valid;

alter table "public"."qa_entries" validate constraint "fk_qa_entries_session";

alter table "public"."qa_sessions" add constraint "fk_qa_sessions_document" FOREIGN KEY (document_id) REFERENCES documents(id) ON DELETE CASCADE not valid;

alter table "public"."qa_sessions" validate constraint "fk_qa_sessions_document";

alter table "public"."qa_sessions" add constraint "fk_qa_sessions_user" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."qa_sessions" validate constraint "fk_qa_sessions_user";

alter table "public"."reminders" add constraint "fk_reminders_document" FOREIGN KEY (document_id) REFERENCES documents(id) ON DELETE CASCADE not valid;

alter table "public"."reminders" validate constraint "fk_reminders_document";

alter table "public"."reminders" add constraint "fk_reminders_user" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."reminders" validate constraint "fk_reminders_user";

grant delete on table "public"."documents" to "anon";

grant insert on table "public"."documents" to "anon";

grant references on table "public"."documents" to "anon";

grant select on table "public"."documents" to "anon";

grant trigger on table "public"."documents" to "anon";

grant truncate on table "public"."documents" to "anon";

grant update on table "public"."documents" to "anon";

grant delete on table "public"."documents" to "authenticated";

grant insert on table "public"."documents" to "authenticated";

grant references on table "public"."documents" to "authenticated";

grant select on table "public"."documents" to "authenticated";

grant trigger on table "public"."documents" to "authenticated";

grant truncate on table "public"."documents" to "authenticated";

grant update on table "public"."documents" to "authenticated";

grant delete on table "public"."documents" to "service_role";

grant insert on table "public"."documents" to "service_role";

grant references on table "public"."documents" to "service_role";

grant select on table "public"."documents" to "service_role";

grant trigger on table "public"."documents" to "service_role";

grant truncate on table "public"."documents" to "service_role";

grant update on table "public"."documents" to "service_role";

grant delete on table "public"."lectures" to "anon";

grant insert on table "public"."lectures" to "anon";

grant references on table "public"."lectures" to "anon";

grant select on table "public"."lectures" to "anon";

grant trigger on table "public"."lectures" to "anon";

grant truncate on table "public"."lectures" to "anon";

grant update on table "public"."lectures" to "anon";

grant delete on table "public"."lectures" to "authenticated";

grant insert on table "public"."lectures" to "authenticated";

grant references on table "public"."lectures" to "authenticated";

grant select on table "public"."lectures" to "authenticated";

grant trigger on table "public"."lectures" to "authenticated";

grant truncate on table "public"."lectures" to "authenticated";

grant update on table "public"."lectures" to "authenticated";

grant delete on table "public"."lectures" to "service_role";

grant insert on table "public"."lectures" to "service_role";

grant references on table "public"."lectures" to "service_role";

grant select on table "public"."lectures" to "service_role";

grant trigger on table "public"."lectures" to "service_role";

grant truncate on table "public"."lectures" to "service_role";

grant update on table "public"."lectures" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."progress" to "anon";

grant insert on table "public"."progress" to "anon";

grant references on table "public"."progress" to "anon";

grant select on table "public"."progress" to "anon";

grant trigger on table "public"."progress" to "anon";

grant truncate on table "public"."progress" to "anon";

grant update on table "public"."progress" to "anon";

grant delete on table "public"."progress" to "authenticated";

grant insert on table "public"."progress" to "authenticated";

grant references on table "public"."progress" to "authenticated";

grant select on table "public"."progress" to "authenticated";

grant trigger on table "public"."progress" to "authenticated";

grant truncate on table "public"."progress" to "authenticated";

grant update on table "public"."progress" to "authenticated";

grant delete on table "public"."progress" to "service_role";

grant insert on table "public"."progress" to "service_role";

grant references on table "public"."progress" to "service_role";

grant select on table "public"."progress" to "service_role";

grant trigger on table "public"."progress" to "service_role";

grant truncate on table "public"."progress" to "service_role";

grant update on table "public"."progress" to "service_role";

grant delete on table "public"."qa_entries" to "anon";

grant insert on table "public"."qa_entries" to "anon";

grant references on table "public"."qa_entries" to "anon";

grant select on table "public"."qa_entries" to "anon";

grant trigger on table "public"."qa_entries" to "anon";

grant truncate on table "public"."qa_entries" to "anon";

grant update on table "public"."qa_entries" to "anon";

grant delete on table "public"."qa_entries" to "authenticated";

grant insert on table "public"."qa_entries" to "authenticated";

grant references on table "public"."qa_entries" to "authenticated";

grant select on table "public"."qa_entries" to "authenticated";

grant trigger on table "public"."qa_entries" to "authenticated";

grant truncate on table "public"."qa_entries" to "authenticated";

grant update on table "public"."qa_entries" to "authenticated";

grant delete on table "public"."qa_entries" to "service_role";

grant insert on table "public"."qa_entries" to "service_role";

grant references on table "public"."qa_entries" to "service_role";

grant select on table "public"."qa_entries" to "service_role";

grant trigger on table "public"."qa_entries" to "service_role";

grant truncate on table "public"."qa_entries" to "service_role";

grant update on table "public"."qa_entries" to "service_role";

grant delete on table "public"."qa_sessions" to "anon";

grant insert on table "public"."qa_sessions" to "anon";

grant references on table "public"."qa_sessions" to "anon";

grant select on table "public"."qa_sessions" to "anon";

grant trigger on table "public"."qa_sessions" to "anon";

grant truncate on table "public"."qa_sessions" to "anon";

grant update on table "public"."qa_sessions" to "anon";

grant delete on table "public"."qa_sessions" to "authenticated";

grant insert on table "public"."qa_sessions" to "authenticated";

grant references on table "public"."qa_sessions" to "authenticated";

grant select on table "public"."qa_sessions" to "authenticated";

grant trigger on table "public"."qa_sessions" to "authenticated";

grant truncate on table "public"."qa_sessions" to "authenticated";

grant update on table "public"."qa_sessions" to "authenticated";

grant delete on table "public"."qa_sessions" to "service_role";

grant insert on table "public"."qa_sessions" to "service_role";

grant references on table "public"."qa_sessions" to "service_role";

grant select on table "public"."qa_sessions" to "service_role";

grant trigger on table "public"."qa_sessions" to "service_role";

grant truncate on table "public"."qa_sessions" to "service_role";

grant update on table "public"."qa_sessions" to "service_role";

grant delete on table "public"."reminders" to "anon";

grant insert on table "public"."reminders" to "anon";

grant references on table "public"."reminders" to "anon";

grant select on table "public"."reminders" to "anon";

grant trigger on table "public"."reminders" to "anon";

grant truncate on table "public"."reminders" to "anon";

grant update on table "public"."reminders" to "anon";

grant delete on table "public"."reminders" to "authenticated";

grant insert on table "public"."reminders" to "authenticated";

grant references on table "public"."reminders" to "authenticated";

grant select on table "public"."reminders" to "authenticated";

grant trigger on table "public"."reminders" to "authenticated";

grant truncate on table "public"."reminders" to "authenticated";

grant update on table "public"."reminders" to "authenticated";

grant delete on table "public"."reminders" to "service_role";

grant insert on table "public"."reminders" to "service_role";

grant references on table "public"."reminders" to "service_role";

grant select on table "public"."reminders" to "service_role";

grant trigger on table "public"."reminders" to "service_role";

grant truncate on table "public"."reminders" to "service_role";

grant update on table "public"."reminders" to "service_role";

create policy "documents_delete_own"
on "public"."documents"
as permissive
for delete
to public
using ((user_id = auth.uid()));


create policy "documents_insert_own"
on "public"."documents"
as permissive
for insert
to public
with check ((user_id = auth.uid()));


create policy "documents_select_own"
on "public"."documents"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "documents_update_own"
on "public"."documents"
as permissive
for update
to public
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));


create policy "lectures_delete_own"
on "public"."lectures"
as permissive
for delete
to public
using ((user_id = auth.uid()));


create policy "lectures_insert_own"
on "public"."lectures"
as permissive
for insert
to public
with check ((user_id = auth.uid()));


create policy "lectures_select_own"
on "public"."lectures"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "lectures_update_own"
on "public"."lectures"
as permissive
for update
to public
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));


create policy "Allow users to DELETE own profile"
on "public"."profiles"
as permissive
for delete
to public
using ((id = auth.uid()));


create policy "Allow users to INSERT own profile"
on "public"."profiles"
as permissive
for insert
to public
with check ((id = auth.uid()));


create policy "Allow users to SELECT own profile"
on "public"."profiles"
as permissive
for select
to public
using ((id = auth.uid()));


create policy "Allow users to UPDATE own profile"
on "public"."profiles"
as permissive
for update
to public
using ((id = auth.uid()))
with check ((id = auth.uid()));


create policy "progress_delete_own"
on "public"."progress"
as permissive
for delete
to public
using ((user_id = auth.uid()));


create policy "progress_insert_own"
on "public"."progress"
as permissive
for insert
to public
with check ((user_id = auth.uid()));


create policy "progress_select_own"
on "public"."progress"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "progress_update_own"
on "public"."progress"
as permissive
for update
to public
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));


create policy "qa_entries_delete_own"
on "public"."qa_entries"
as permissive
for delete
to public
using ((session_id IN ( SELECT qa_sessions.id
   FROM qa_sessions
  WHERE (qa_sessions.user_id = auth.uid()))));


create policy "qa_entries_insert_own"
on "public"."qa_entries"
as permissive
for insert
to public
with check ((session_id IN ( SELECT qa_sessions.id
   FROM qa_sessions
  WHERE (qa_sessions.user_id = auth.uid()))));


create policy "qa_entries_select_own"
on "public"."qa_entries"
as permissive
for select
to public
using ((session_id IN ( SELECT qa_sessions.id
   FROM qa_sessions
  WHERE (qa_sessions.user_id = auth.uid()))));


create policy "qa_entries_update_own"
on "public"."qa_entries"
as permissive
for update
to public
using ((session_id IN ( SELECT qa_sessions.id
   FROM qa_sessions
  WHERE (qa_sessions.user_id = auth.uid()))))
with check ((session_id IN ( SELECT qa_sessions.id
   FROM qa_sessions
  WHERE (qa_sessions.user_id = auth.uid()))));


create policy "qa_sessions_delete_own"
on "public"."qa_sessions"
as permissive
for delete
to public
using ((user_id = auth.uid()));


create policy "qa_sessions_insert_own"
on "public"."qa_sessions"
as permissive
for insert
to public
with check ((user_id = auth.uid()));


create policy "qa_sessions_select_own"
on "public"."qa_sessions"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "qa_sessions_update_own"
on "public"."qa_sessions"
as permissive
for update
to public
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));


create policy "reminders_delete_own"
on "public"."reminders"
as permissive
for delete
to public
using ((user_id = auth.uid()));


create policy "reminders_insert_own"
on "public"."reminders"
as permissive
for insert
to public
with check ((user_id = auth.uid()));


create policy "reminders_select_own"
on "public"."reminders"
as permissive
for select
to public
using ((user_id = auth.uid()));


create policy "reminders_update_own"
on "public"."reminders"
as permissive
for update
to public
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));



