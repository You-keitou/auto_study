"use client";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createClient } from "@supabase/supabase-js";
import { useState } from "react";

// Supabase クライアントの初期化
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

export default function SignInPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  // メール・パスワード認証
  async function handleEmailSignIn(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError("");

    const { error: signInError } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (signInError) {
      setError(signInError.message);
    } else {
      // 認証成功後、任意のページへリダイレクト
      window.location.href = "/";
    }
    setLoading(false);
  }

  // OAuth 認証（Google, GitHub）
  async function handleOAuthSignIn(provider: "google" | "github") {
    setLoading(true);
    setError("");
    const { error } = await supabase.auth.signInWithOAuth({ provider });
    if (error) {
      setError(error.message);
      setLoading(false);
    }
    // Supabase は設定されたリダイレクトURLへ自動で遷移します
  }

  return (
    <div className="container mx-auto max-w-md py-10">
      <h1 className="mb-6 text-center text-2xl font-bold">Sign In</h1>

      {/* メール・パスワード認証フォーム */}
      <form onSubmit={handleEmailSignIn} className="space-y-4">
        <div>
          <Label htmlFor="email" className="mb-1 block">
            Email
          </Label>
          <Input
            id="email"
            type="email"
            placeholder="your-email@example.com"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>
        <div>
          <Label htmlFor="password" className="mb-1 block">
            Password
          </Label>
          <Input
            id="password"
            type="password"
            placeholder="Your password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>
        {error && <p className="text-red-500">{error}</p>}
        <Button type="submit" disabled={loading}>
          {loading ? "Signing in..." : "Sign In with Email"}
        </Button>
      </form>

      <hr className="my-6" />

      {/* OAuth 認証ボタン */}
      <div className="flex flex-col space-y-4">
        <Button
          variant="outline"
          onClick={() => handleOAuthSignIn("google")}
          disabled={loading}
        >
          Sign in with Google
        </Button>
        <Button
          variant="outline"
          onClick={() => handleOAuthSignIn("github")}
          disabled={loading}
        >
          Sign in with GitHub
        </Button>
      </div>
    </div>
  );
}
