create table if not exists public.orders (
 id text primary key, customer_name text not null, phone text not null,
 address text not null, notes text, items jsonb not null,
 total_amount numeric(10,2) not null check(total_amount >= 0),
 order_status text not null default 'pending' check(order_status in ('pending','confirmed','preparing','out_for_delivery','delivered','cancelled')),
 whatsapp_message_id text, created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
alter table public.orders enable row level security;
-- Starter policy: permits order INSERT only. Configure Auth-protected admin policies separately.
create policy "public can create orders" on public.orders for insert to anon, authenticated
with check(customer_name <> '' and phone <> '' and address <> '');
-- Do NOT create public SELECT/UPDATE policies for customer data.
