-- 1. Create users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

-- 2. Create discussion_posts table
CREATE TABLE discussion_posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_url TEXT NOT NULL,
    post_title TEXT NOT NULL
);

-- 3. Create problems table
CREATE TABLE problems (
    problem_id INTEGER PRIMARY KEY AUTOINCREMENT,
    problem_name TEXT NOT NULL,
    problem_rating INTEGER NOT NULL
);

-- 4. Create solutions table
CREATE TABLE solutions (
    solution_id INTEGER PRIMARY KEY AUTOINCREMENT,
    solution_url TEXT NOT NULL,
    submitted_by TEXT NOT NULL
);

-- 5. Create sheets table
CREATE TABLE sheets (
    sheet_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sheet_name TEXT NOT NULL,
    questions_count INTEGER NOT NULL
);

-- 6. Create created_note_for table (relationship between users and problems)
CREATE TABLE created_note_for (
    user_id INTEGER,
    problem_id INTEGER,
    note TEXT,
    PRIMARY KEY (user_id, problem_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

-- 7. Create saved_discussion table (relationship between users and discussion_posts)
CREATE TABLE saved_discussion (
    user_id INTEGER,
    post_id INTEGER,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES discussion_posts(post_id)
);

-- 8. Create saved_solution table (relationship between users and solutions)
CREATE TABLE saved_solution (
    user_id INTEGER,
    solution_id INTEGER,
    PRIMARY KEY (user_id, solution_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (solution_id) REFERENCES solutions(solution_id)
);

-- 9. Create problem_solution table (relationship between problems and solutions)
CREATE TABLE problem_solution (
    problem_id INTEGER,
    solution_id INTEGER PRIMARY KEY,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id),
    FOREIGN KEY (solution_id) REFERENCES solutions(solution_id)
    );

-- 10. Create contains table (relationship between sheets and problems)
CREATE TABLE contains (
    sheet_id INTEGER,
    problem_id INTEGER,
    PRIMARY KEY (sheet_id, problem_id),
    FOREIGN KEY (sheet_id) REFERENCES sheets(sheet_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

-- 11. Create default_notes table
CREATE TABLE default_notes (
    note_id INTEGER PRIMARY KEY AUTOINCREMENT,
    note TEXT
);

-- 12. Create default_note_problem table(relationship between default_notes and problems)
CREATE TABLE default_note_problem (
    note_id INTEGER PRIMARY KEY AUTOINCREMENT,
    problem_id INTEGER,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id),
    FOREIGN KEY (note_id) REFERENCES default_notes(note_id)
)
