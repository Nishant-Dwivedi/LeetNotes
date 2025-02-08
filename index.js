const sqlite3 = require("sqlite3").verbose();
const express = require("express");
const app = express();

app.listen(3000);

app.get("/", (req, res) => {
  console.log("GET received");
  res.status(200).send();
});

const database = new sqlite3.Database(
  "./data-access/leetnotes.db",
  (result) => {
    if (typeof result != "error") {
      console.log(`database file opened successfully`);
    } else {
      console.error(result);
    }
  }
);

database.all("SELECT * from created_note_for", [], (err, row) => {
  err ? console.error(err) : console.log(row);
});
