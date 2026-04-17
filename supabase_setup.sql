-- ═══════════════════════════════════════════════════
-- SUPABASE SETUP SCRIPT FOR PORTFOLIO (LIKES ONLY)
-- ═══════════════════════════════════════════════════
-- Run this in the Supabase SQL Editor to set up the `likes` feature.
-- (Since you already have the messages table!)

-- 1. Create the `likes` table
CREATE TABLE public.likes (
    id INT PRIMARY KEY,
    count INT NOT NULL DEFAULT 0
);

-- 2. Initialize exactly one row with id = 1
INSERT INTO public.likes (id, count) VALUES (1, 0);

-- 3. Enable Row Level Security for `likes`
ALTER TABLE public.likes ENABLE ROW LEVEL SECURITY;

-- 4. Allow anyone to read the likes count
CREATE POLICY "Allow public select on likes"
ON public.likes FOR SELECT
TO public
USING (true);

-- 5. Allow anyone to update the likes count
CREATE POLICY "Allow public update on likes"
ON public.likes FOR UPDATE
TO public
USING (true)
WITH CHECK (true);

-- 6. Enable REALTIME for the `likes` table
-- This allows the portfolio frontend to listen for live updates
alter publication supabase_realtime add table public.likes;
