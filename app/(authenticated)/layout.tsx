import { createClient } from "@supabase/supabase-js";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

async function getUserFromCookie() {
  const cookieStore = cookies();
  const accessToken = cookieStore.get("sb-access-token")?.value;
  if (!accessToken) return null;

  // トークンを Authorization ヘッダーにセットしてクライアントを生成
  const supabase = createClient(supabaseUrl, supabaseAnonKey, {
    global: { headers: { Authorization: `Bearer ${accessToken}` } },
  });
  const { data, error } = await supabase.auth.getUser();
  if (error || !data.user) return null;
  return data.user;
}

export default async function AuthenticatedLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const user = await getUserFromCookie();

  if (!user) {
    // 認証されていなければログインページへリダイレクト
    redirect("/login");
  }

  return (
    <div>
      <header className="p-4 bg-gray-100">
        <h1 className="text-xl font-bold">My Application</h1>
        {/* グローバルナビゲーションなど */}
      </header>
      <main>{children}</main>
    </div>
  );
}
