
import { client } from "@repo/db/client";

export default async function Home() {
  const user = await client.user.findFirst();

  return (
    <div>
      <h1 style={{color: "red", fontSize: "2rem"}}>Hello and Welcome to the new Pages</h1>
      <p style={{color: "blue"}}>First name haha: {user?.username}</p>
      <p style={{color: "blue"}}>Password: {user?.password}</p>
    </div>
  );
}
