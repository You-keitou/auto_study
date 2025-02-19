// app/layout.tsx
import "./globals.css";
import { Inter } from "next/font/google";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "My Application",
  description: "Interactive Learning Platform",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ja">
      <body className={inter.className}>
        <header className="p-4 bg-blue-600 text-white">
          <h1 className="text-2xl font-bold">My Application</h1>
          {/* グローバルナビゲーションをここに追加 */}
        </header>
        <main>{children}</main>
        <footer className="p-4 bg-gray-200 text-center text-sm">
          &copy; {new Date().getFullYear()} My Application. All rights reserved.
        </footer>
      </body>
    </html>
  );
}
