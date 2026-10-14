# Put your project on GitHub (no Git install needed)

## 1. Create the account
1. Go to github.com and click **Sign up**.
2. Choose a professional username (your name works well), verify your email.

## 2. Prepare the folder
1. Unzip `pentaho-retail-etl.zip`.
2. Copy `00_create_tables.ktr`, `01_load_staging.ktr`, `02_clean.ktr` into the `pentaho` folder.
3. Open each `.ktr` in Notepad, press Ctrl+F, search `<password>`, and replace the value with `CHANGE_ME`. Do the same for `<username>`.
4. Add your screenshots to `screenshots`.
5. Open `README.md` and fill in your real raw and clean row counts.

## 3. Create the repository
1. Click the **+** at top right, then **New repository**.
2. Name: `pentaho-retail-etl`. Set to **Public**. Do not tick "Add a README" (you already have one).
3. Click **Create repository**.

## 4. Upload
1. On the new repository page, click **uploading an existing file**.
2. Drag the contents of the unzipped folder (the files and folders inside `pentaho-retail-etl`) into the browser. Dragging folders works in Chrome and Edge.
3. Scroll down and click **Commit changes**.

## 5. Check
Open the repository page. You should see the README displayed, and folders `pentaho`, `sql`, `data`, `screenshots`.
Copy the page URL for your CV, for example `github.com/yourname/pentaho-retail-etl`.

## Later: change your MySQL password
If a password was ever in a file you uploaded, change it in MySQL.
