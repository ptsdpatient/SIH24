CREATE TABLE pronouns (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    pronoun TEXT NOT NULL UNIQUE
)

CREATE TABLE countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    country TEXT NOT NULL UNIQUE
)

CREATE TABLE states (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    state_name TEXT NOT NULL UNIQUE,
    country INTEGER,
    FOREIGN KEY (country) REFERENCES countries(id)
);

CREATE TABLE cities (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    city_name TEXT NOT NULL UNIQUE,
    state_name INTEGER,
    FOREIGN KEY (state_name) REFERENCES states(id)
);

CREATE TABLE universities (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    university TEXT NOT NULL UNIQUE
);

CREATE TABLE colleges (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    college TEXT NOT NULL UNIQUE,
    university INTEGER,
    FOREIGN KEY (university) REFERENCES universities(id),
    city INTEGER,
    FOREIGN KEY (city) REFERENCES cities(id)
);

CREATE TABLE languages (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    language_name TEXT NOT NULL UNIQUE
);

CREATE TABLE industries (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    industry TEXT NOT NULL UNIQUE
);

CREATE TABLE interests(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    interest TEXT NOT NULL UNIQUE
);

CREATE TABLE user_interests(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    user_id INTEGER,
    interest INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (interest) REFERENCES interests(id)
);

CREATE TABLE user_languages(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    user_language INTEGER,
    user_id INTEGER,
    FOREIGN KEY (user_language) REFERENCES languages(id), 
    FOREIGN KEY (user_id) REFERENCES users(id),
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    first_name TEXT,
    last_name TEXT ,
    email TEXT,
    graduation_year TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hashed_password TEXT,
    mobile TEXT ,
    headline TEXT ,
    mobile TEXT ,
    dob DATE,
    skills TEXT,
    bio TEXT,
    position TEXT,
    services TEXT,
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
    FOREIGN KEY (university) REFERENCES universities(id),
    

);


CREATE TABLE donations(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    amount DECIMAL NOT NULL,
    campaign VARCHAR,
    payment_method VARCHAR NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    receipt_url VARCHAR DEFAULT NULL,
);

CREATE TABLE events(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    title VARCHAR DEFAULT NULL,
    event_description TEXT DEFAULT NULL,
    event_location VARCHAR DEFAULT NULL,
    event_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    registeration_deadline TIMESTAMP DEFAULT NULL,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    max_participants INT DEFAULT NULL,
    is_virtual INT DEFAULT FALSE,
    virtual_link VARCHAR DEFAULT NULL

);

CREATE TABLE event_registeration(
    id INTEGER PRIMARY KEY AUTOINCREMENT ID,
    event_id INTEGER,
    user_id INTEGER,
    registeration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (event_id) REFERENCES events(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    
);

CREATE TABLE job_types(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    job_type VARCHAR,
);

CREATE TABLE jobs(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
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
    application_deadline TIMESTAMP,
);

CREATE TABLE job_status(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    job_status VARCHAR,
);

CREATE TABLE job_applications(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    job_id INTEGER,
    FOREIGN KEY (job_id) REFERENCES jobs(id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    application_status VARCHAR,
    resume_url VARCHAR,
);

CREATE TABLE networking_groups(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    group_name VARCHAR,
    group_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
);

CREATE TABLE group_members(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    group_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES networking_groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
);
 
CREATE TABLE success_stories(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    title VARCHAR,
    story TEXT,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image_url VARCHAR,
    is_featured INTEGER,
);

CREATE TABLE feedback(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating INTEGER,
);

CREATE TABLE notifications(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    notification_type VARCHAR,
    notification_message TEXT,
    is_read INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE activity_logs(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    activity_type VARCHAR,
    activity_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE mentorships(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    mentor_id INTEGER,
    FOREIGN KEY (mentor_id) REFERENCES users(id),
    mentee_id INTEGER,
    FOREIGN KEY (mentee_id) REFERENCES users(id),
    mentorship_status VARCHAR,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ended_at TIMESTAMP DEFAULT NULL,
    notes TEXT,
);


CREATE TABLE message_channels(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    recipient_id INTEGER,
    FOREIGN KEY (recipient_id) REFERENCES users(id),
    last_message_at TIMESTAMP DEFAULT NULL,
    last_message_text TEXT DEFAULT NULL,
    is_archived INTEGER DEFAULT FALSE,
    is_muted INTEGER DEFAULT FALSE,
);

CREATE TABLE messages(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    channel_id INTEGER,
    FOREIGN KEY (channel_id) REFERENCES message_channels(id),
    sender_id INTEGER,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    message_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read INTEGER DEFAULT FALSE,
    is_deleted INTEGER DEFAULT FALSE,
    is_edited INTEGER DEFAULT FALSE,
    edited_at TIMESTAMP DEFAULT NULL,
    edited_by INTEGER,
    FOREIGN KEY (edited_by) REFERENCES users(id),
    is_pinned INTEGER DEFAULT FALSE,
    pinned_at TIMESTAMP DEFAULT NULL,
    pinned_by INTEGER,
    FOREIGN KEY (pinned_by) REFERENCES users(id),
    is_replied INTEGER DEFAULT FALSE,
    replied_at TIMESTAMP DEFAULT NULL,
    replied_by INTEGER,
    FOREIGN KEY (replied_by) REFERENCES users(id),
);

CREATE TABLE announcements(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    announcement_title VARCHAR NOT NULL,
    announcement_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    expires_at TIMESTAMP DEFAULT NULL,

);

CREATE TABLE projects(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    project_title VARCHAR NOT NULL,
    project_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    completed_at TIMESTAMP DEFAULT NULL,
    completed_by INTEGER,
    FOREIGN KEY (completed_by) REFERENCES users(id),
    is_deleted INTEGER DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL,
    deleted_by INTEGER,
    FOREIGN KEY (deleted_by) REFERENCES users(id),
    start_at TIMESTAMP DEFAULT NULL,
    donation_id INTEGER,
    FOREIGN KEY (donation_id) REFERENCES donations(id),
);

CREATE TABLE project_members(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    project_id INTEGER,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    role VARCHAR NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    left_at TIMESTAMP DEFAULT NULL,
    left_by INTEGER,
    FOREIGN KEY (left_by) REFERENCES users(id),
    is_deleted INTEGER DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL,
    deleted_by INTEGER,
    FOREIGN KEY (deleted_by) REFERENCES users(id),
);

CREATE TABLE achievements(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    achievement_title VARCHAR NOT NULL,
    achievement_description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    image_url VARCHAR,
    is_deleted INTEGER DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL,
);


CREATE TABLE learning_resources(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    title VARCHAR NOT NULL,
    description TEXT NOT NULL,
    url VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),  
);

CREATE TABLE referrals(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    referrer_id INTEGER,
    FOREIGN KEY (referrer_id) REFERENCES users(id),
    referred_id INTEGER,
    FOREIGN KEY (referred_id) REFERENCES users(id),
    referred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    referred_through VARCHAR,
    referral_code VARCHAR,
    is_deleted INTEGER DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL,
    reward VARCHAR,
    reward_description TEXT,
);

CREATE TABLE news(
    id INTEGER PRIMARY KEY AUTOINCREMENT id,
    title TEXT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id),
    image_url VARCHAR,
    is_deleted INTEGER DEFAULT FALSE,
    deleted_at TIMESTAMP DEFAULT NULL,
    deleted_by INTEGER,
    FOREIGN KEY (deleted_by) REFERENCES users(id),
    is_featured INTEGER DEFAULT FALSE,
    featured_at TIMESTAMP DEFAULT NULL,
    featured_by INTEGER,
    FOREIGN KEY (featured_by) REFERENCES users(id),
);