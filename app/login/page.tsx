"use client";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { signInAction } from "./actions";

export default function SignInPage() {
  return (
    <div className="container mx-auto max-w-md py-10">
      <h1 className="mb-6 text-center text-2xl font-bold">Sign In</h1>

      <form onSubmit={signInAction} className="space-y-4">
        <div>
          <Label htmlFor="email" className="mb-1 block">
            Email
          </Label>
          <Input id="email" name="email" type="email" placeholder="your-email@example.com" required />
        </div>
        <div>
          <Label htmlFor="password" className="mb-1 block">
            Password
          </Label>
          <Input id="password" name="password" type="password" placeholder="Your password" required />
        </div>
        <Button type="submit">Sign In with Email</Button>
      </form>

      <hr className="my-6" />

      {/* OAuth 認証ボタンは単純なリンクで実装 */}
      <div className="flex flex-col space-y-4">
        <a href="/auth/google">
          <Button variant="outline">Sign in with Google</Button>
        </a>
        {/* 他の OAuth も同様に実装可能 */}
      </div>
    </div>
  );
}
