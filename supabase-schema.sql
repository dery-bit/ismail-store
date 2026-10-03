-- ISMAIL STORE — database online Supabase
-- Jalankan seluruh script ini di Supabase Dashboard > SQL Editor.
-- Data dipisahkan per akun login (user_id), sehingga HP/PC yang login
-- dengan akun yang sama akan melihat data toko yang sama.

create table if not exists public.app_data (
  user_id uuid not null references auth.users(id) on delete cascade,
  data_key text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, data_key)
);

alter table public.app_data enable row level security;

drop policy if exists "app_data_select_own" on public.app_data;
drop policy if exists "app_data_insert_own" on public.app_data;
drop policy if exists "app_data_update_own" on public.app_data;
drop policy if exists "app_data_delete_own" on public.app_data;

create policy "app_data_select_own"
on public.app_data for select
to authenticated
using (auth.uid() = user_id);

create policy "app_data_insert_own"
on public.app_data for insert
to authenticated
with check (auth.uid() = user_id);

create policy "app_data_update_own"
on public.app_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "app_data_delete_own"
on public.app_data for delete
to authenticated
using (auth.uid() = user_id);

grant select, insert, update, delete on public.app_data to authenticated;

-- Opsional: kalau project Supabase Anda meminta tabel dipublikasikan ke Data API,
-- buka Dashboard > Integrations/API > Data API dan expose public.app_data.
