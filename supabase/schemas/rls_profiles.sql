ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- SELECT
CREATE POLICY "Allow users to SELECT own profile"
ON public.profiles
FOR SELECT
USING ( id = auth.uid() );

-- UPDATE
CREATE POLICY "Allow users to UPDATE own profile"
ON public.profiles
FOR UPDATE
USING ( id = auth.uid() )
WITH CHECK ( id = auth.uid() );

-- INSERT
CREATE POLICY "Allow users to INSERT own profile"
ON public.profiles
FOR INSERT
WITH CHECK ( id = auth.uid() );

-- DELETE
CREATE POLICY "Allow users to DELETE own profile"
ON public.profiles
FOR DELETE
USING ( id = auth.uid() );