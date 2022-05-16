import express from "express";

const app = express();

app.get("", (req, res) => {
  res.send("hello");
});

app.get("/healthcheck", (req, res) => {
  res.send(`
    <div>
      <h1>Yo yo</h1>

      <p>This is hot reloading!</p>
    </div>
  `);
});

app.listen(4000, () => {
  console.log("server running on port 4000");
});
