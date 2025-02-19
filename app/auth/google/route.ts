import { createClient } from "@/utils/supabase/server";
import { NextResponse } from "next/server";

export async function GET() {
	const supabase = await createClient(); // サーバー側で初期化（環境変数は安全に扱える）
	const { data, error } = await supabase.auth.signInWithOAuth({
		provider: "google",
		options: {
			// 認証完了後にリダイレクトさせるコールバックURL
			redirectTo: `${process.env.NEXT_PUBLIC_APP_URL}/auth/callback`,
		},
	});

	if (error || !data.url) {
		return NextResponse.json(
			{ error: error?.message ?? "Unknown error" },
			{ status: 500 },
		);
	}

	return NextResponse.redirect(data.url);
}
