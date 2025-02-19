"use server";

import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import type { FormEvent } from "react";

export async function signInAction(event: FormEvent<HTMLFormElement>) {
	// フォームからメールとパスワードを取得
	event.preventDefault();

	const formData = new FormData(event.currentTarget);
	const email = formData.get("email") as string;
	const password = formData.get("password") as string;

	// サーバー側で Supabase クライアントを生成
	const supabase = await createClient();

	// メール・パスワードで認証
	const { error } = await supabase.auth.signInWithPassword({ email, password });
	if (error) {
		// エラーがあれば例外を投げる（Error Boundary やカスタムエラーハンドリングで表示可能）
		throw new Error(error.message);
	}

	// 認証成功時にリダイレクト（例: ホームページへ）
	redirect("/");
}
