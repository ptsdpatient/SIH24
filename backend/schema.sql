CREATE TABLE pronouns (
    id INTEGER PRIMARY KEY,
    pronoun TEXT NOT NULL UNIQUE
);

CREATE TABLE countries (
    id INTEGER PRIMARY KEY ,
    country TEXT NOT NULL UNIQUE
);

CREATE TABLE states (
    id INTEGER PRIMARY KEY ,
    state_name TEXT NOT NULL UNIQUE,
    country INTEGER,
    FOREIGN KEY (country) REFERENCES countries(id)
);

CREATE TABLE cities (
    id INTEGER PRIMARY KEY ,
    city_name TEXT NOT NULL UNIQUE,
    state_name INTEGER,
    FOREIGN KEY (state_name) REFERENCES states(id)
);

CREATE TABLE universities (
    id INTEGER PRIMARY KEY ,
    university TEXT NOT NULL UNIQUE
);

CREATE TABLE colleges (
    id INTEGER PRIMARY KEY ,
    college TEXT NOT NULL UNIQUE,
    university INTEGER,
    FOREIGN KEY (university) REFERENCES universities(id),
    city INTEGER,
    FOREIGN KEY (city) REFERENCES cities(id)
);

CREATE TABLE languages (
    id INTEGER PRIMARY KEY ,
    language_name TEXT NOT NULL UNIQUE
);

CREATE TABLE industries (
    id INTEGER PRIMARY KEY ,
    industry TEXT NOT NULL UNIQUE
);

CREATE TABLE interests(
    id INTEGER PRIMARY KEY ,
    interest TEXT NOT NULL UNIQUE
);


CREATE TABLE users (
    id INTEGER PRIMARY KEY ,
    isAdmin INTEGER DEFAULT 0,
    isFaculty INTEGER DEFAULT 0,
    first_name TEXT,
    last_name TEXT ,
    email TEXT,
    graduation_year TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hashed_password TEXT,
    mobile TEXT ,
    headline TEXT ,
    dob DATE,
    skills TEXT,
    bio TEXT,
    position TEXT,
    projects TEXT,
    services TEXT,
    experiences TEXT,
    views INTEGER,   
    lightmode INTEGER,
    homeaddress TEXT,
    website TEXT,
    button TEXT,
    profilePic TEXT,
    bannerPic TEXT,
    theme TEXT,
    pronoun INTEGER,
    FOREIGN KEY (pronoun) REFERENCES pronouns(id),
    college INTEGER,
    FOREIGN KEY (college) REFERENCES colleges(id),
    industry INTEGER,
    FOREIGN KEY (industry) REFERENCES industries(id),
    city INTEGER,
    FOREIGN KEY (city) REFERENCES cities(id),
    university INTEGER,
    FOREIGN KEY (university) REFERENCES universities(id)
);


CREATE TABLE user_interests(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    interest INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (interest) REFERENCES interests(id)
);

CREATE TABLE user_languages(
    id INTEGER PRIMARY KEY,
    user_language INTEGER,
    user_id INTEGER,
    FOREIGN KEY (user_language) REFERENCES languages(id), 
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE campaigns(
    id INTEGER PRIMARY KEY ,
    title VARCHAR DEFAULT NULL,
    campaign_description TEXT DEFAULT NULL,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    goal DECIMAL NOT NULL,
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP DEFAULT NULL,
    campaign_image VARCHAR DEFAULT NULL,
    campaign_video VARCHAR DEFAULT NULL,
    campaign_type VARCHAR DEFAULT NULL
);

CREATE TABLE donations(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    amount DECIMAL NOT NULL,
    campaign INTEGER,
    FOREIGN KEY (campaign) REFERENCES campaigns(id),
    payment_method VARCHAR NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    receipt_url VARCHAR DEFAULT NULL
);

CREATE TABLE events(
    id INTEGER PRIMARY KEY ,
    title VARCHAR DEFAULT NULL,
    event_description TEXT DEFAULT NULL,
    event_location VARCHAR DEFAULT NULL,
    event_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    registeration_deadline TIMESTAMP DEFAULT NULL,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    max_participants INT DEFAULT NULL,
    is_virtual INT DEFAULT 0,
    virtual_link VARCHAR DEFAULT NULL

);

CREATE TABLE event_registeration(
    id INTEGER PRIMARY KEY ,
    event_id INTEGER,
    user_id INTEGER,
    registeration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES events(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
    
);

CREATE TABLE job_types(
    id INTEGER PRIMARY KEY ,
    job_type VARCHAR
);

CREATE TABLE jobs(
    id INTEGER PRIMARY KEY ,
    title VARCHAR,
    company VARCHAR,
    city INTEGER,
    FOREIGN KEY (city) REFERENCES cities(id),
    job_type INTEGER,
    FOREIGN KEY (job_type) REFERENCES job_types(id),
    job_description TEXT,
    requirements TEXT,
    posted_by INTEGER,
    FOREIGN KEY (posted_by) REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    application_deadline TIMESTAMP
);

CREATE TABLE job_status(
    id INTEGER PRIMARY KEY ,
    job_status VARCHAR
);

CREATE TABLE job_applications(
    id INTEGER PRIMARY KEY ,
    job_id INTEGER,
    FOREIGN KEY (job_id) REFERENCES jobs(id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    application_status VARCHAR,
    resume_url VARCHAR
);

CREATE TABLE networking_groups(
    id INTEGER PRIMARY KEY ,
    group_name VARCHAR,
    group_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE group_members(
    id INTEGER PRIMARY KEY ,
    group_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES networking_groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);
 
CREATE TABLE success_stories(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    title VARCHAR,
    story TEXT,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image_url VARCHAR,
    is_featured INTEGER
);

CREATE TABLE feedback(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating INTEGER
);

CREATE TABLE notifications(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    notification_type VARCHAR,
    notification_message TEXT,
    is_read INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activity_logs(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    activity_type VARCHAR,
    activity_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mentorships(
    id INTEGER PRIMARY KEY ,
    mentor_id INTEGER,
    FOREIGN KEY (mentor_id) REFERENCES users(id),
    mentee_id INTEGER,
    FOREIGN KEY (mentee_id) REFERENCES users(id),
    mentorship_status VARCHAR,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ended_at TIMESTAMP DEFAULT NULL,
    notes TEXT
);


CREATE TABLE message_channels(
    id INTEGER PRIMARY KEY ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    recipient_id INTEGER,
    FOREIGN KEY (recipient_id) REFERENCES users(id),
    last_message_at TIMESTAMP DEFAULT NULL,
    last_message_text TEXT DEFAULT NULL,
    is_archived INTEGER DEFAULT 0,
    is_muted INTEGER DEFAULT 0
);

CREATE TABLE messages(
    id INTEGER PRIMARY KEY ,
    channel_id INTEGER,
    FOREIGN KEY (channel_id) REFERENCES message_channels(id),
    sender_id INTEGER,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    message_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read INTEGER DEFAULT 0,
    is_deleted INTEGER DEFAULT 0,
    is_edited INTEGER DEFAULT 0,
    edited_at TIMESTAMP DEFAULT NULL,
    edited_by INTEGER,
    FOREIGN KEY (edited_by) REFERENCES users(id),
    is_pinned INTEGER DEFAULT 0,
    pinned_at TIMESTAMP DEFAULT NULL,
    pinned_by INTEGER,
    FOREIGN KEY (pinned_by) REFERENCES users(id),
    is_replied INTEGER DEFAULT 0,
    replied_at TIMESTAMP DEFAULT NULL,
    replied_by INTEGER,
    FOREIGN KEY (replied_by) REFERENCES users(id)
);

CREATE TABLE announcements(
    id INTEGER PRIMARY KEY ,
    announcement_title VARCHAR NOT NULL,
    announcement_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    expires_at TIMESTAMP DEFAULT NULL

);

CREATE TABLE projects(
    id INTEGER PRIMARY KEY ,
    project_title VARCHAR NOT NULL,
    project_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    completed_at TIMESTAMP DEFAULT NULL,
    completed_by INTEGER,
    FOREIGN KEY (completed_by) REFERENCES users(id),
    is_deleted INTEGER DEFAULT 0,
    deleted_at TIMESTAMP DEFAULT NULL,
    deleted_by INTEGER,
    FOREIGN KEY (deleted_by) REFERENCES users(id),
    start_at TIMESTAMP DEFAULT NULL,
    donation_id INTEGER,
    FOREIGN KEY (donation_id) REFERENCES donations(id)
);

CREATE TABLE project_members(
    id INTEGER PRIMARY KEY ,
    project_id INTEGER,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    role VARCHAR NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    left_at TIMESTAMP DEFAULT NULL,
    left_by INTEGER,
    FOREIGN KEY (left_by) REFERENCES users(id),
    is_deleted INTEGER DEFAULT 0,
    deleted_at TIMESTAMP DEFAULT NULL,
    deleted_by INTEGER,
    FOREIGN KEY (deleted_by) REFERENCES users(id)
);

CREATE TABLE achievements(
    id INTEGER PRIMARY KEY ,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    achievement_title VARCHAR NOT NULL,
    achievement_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    image_url VARCHAR,
    is_deleted INTEGER DEFAULT 0,
    deleted_at TIMESTAMP DEFAULT NULL
);


CREATE TABLE learning_resources(
    id INTEGER PRIMARY KEY ,
    title VARCHAR NOT NULL,
    description TEXT NOT NULL,
    url VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE blogs(
    id INTEGER PRIMARY KEY ,
    title VARCHAR NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    image_url VARCHAR NOT NULL,
    likes INTEGER DEFAULT 0
);

CREATE TABLE comments(
    id INTEGER PRIMARY KEY ,
    blog_id INTEGER,
    FOREIGN KEY (blog_id) REFERENCES blogs(id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    likes INTEGER DEFAULT 0,
    is_reply INTEGER DEFAULT 0,
    reply_to INTEGER DEFAULT NULL,
    FOREIGN KEY (reply_to) REFERENCES comments(id),
    is_deleted INTEGER DEFAULT 0,
    deleted_at TIMESTAMP DEFAULT NULL
);















-- These are the SQL commands to create the tables for a community platform. The tables include users, user

-- profiles, success stories, feedback, notifications, activity logs, mentorships, message channels

-- and messages, announcements, projects, project members, achievements, learning resources, blogs, and comments

-- . Each table has its own set of columns, and some tables have foreign key constraints to link them

-- together. The primary key for each table is an auto-incrementing integer. The timestamp

-- default value is set to the current timestamp for the created\_at column in each table.

-- The users table stores information about the users of the platform, such as their email, password, and

-- role. The user\_profiles table stores additional information about the users, such as their name,

